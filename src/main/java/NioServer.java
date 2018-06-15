import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.lang.management.ManagementFactory;
import java.lang.management.ThreadMXBean;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.nio.channels.spi.SelectorProvider;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import static sun.misc.ThreadGroupUtils.getRootThreadGroup;

public class NioServer implements Runnable {
	// The host:port combination to listen on
	private InetAddress hostAddress;
	private static int port;
    private int numberOfClients = 0;

	// The channel on which we'll accept connections
	private ServerSocketChannel serverChannel;

	// The selector we'll be monitoring
	private Selector selector;

	// The buffer into which we'll read data when it's available
	private ByteBuffer readBuffer = ByteBuffer.allocate(8192);

	private EchoWorker worker;

	// A list of PendingChange instances
	private List pendingChanges = new LinkedList();

	// Maps a SocketChannel to a list of ByteBuffer instances
	private Map pendingData = new HashMap();

	public NioServer(InetAddress hostAddress, int port, EchoWorker worker) throws IOException {
		this.hostAddress = hostAddress;
		this.port = port;
		this.selector = this.initSelector();
		this.worker = worker;
	}

	public void send(SocketChannel socket, byte[] data) {
		synchronized (this.pendingChanges) {
			// Indicate we want the interest ops set changed
			this.pendingChanges.add(new ChangeRequest(socket, ChangeRequest.CHANGEOPS, SelectionKey.OP_WRITE));

			// And queue the data we want written
			synchronized (this.pendingData) {
				List queue = (List) this.pendingData.get(socket);
				if (queue == null) {
					queue = new ArrayList();
					this.pendingData.put(socket, queue);
				}
				queue.add(ByteBuffer.wrap(data));
			}
		}

		// Finally, wake up our selecting thread so it can make the required changes
		this.selector.wakeup();
	}
    public Thread[] getAllThreads( ) {
        final ThreadGroup root = getRootThreadGroup( );
        final ThreadMXBean thbean = ManagementFactory.getThreadMXBean( );
        int nAlloc = thbean.getThreadCount( );
        int n = 0;
        Thread[] threads;
        do {
            nAlloc *= 2;
            threads = new Thread[ nAlloc ];
            n = root.enumerate( threads, true );
        } while ( n == nAlloc );
        return java.util.Arrays.copyOf( threads, n );
    }

	public void run() {
        Boolean flag = true;
		while (flag) {
			try {
				// Process any pending changes
				synchronized (this.pendingChanges) {
					Iterator changes = this.pendingChanges.iterator();
					while (changes.hasNext()) {
						ChangeRequest change = (ChangeRequest) changes.next();
						switch (change.type) {
						case ChangeRequest.CHANGEOPS:
							SelectionKey key = change.socket.keyFor(this.selector);
							if (key != null) {
							if (key.isValid()) key.interestOps(change.ops); }
						}
					}
					this.pendingChanges.clear();
				}

				// Wait for an event one of the registered channels
				this.selector.select();

				// Iterate over the set of keys for which events are available
				Iterator selectedKeys = this.selector.selectedKeys().iterator();
				while (selectedKeys.hasNext()) {
					SelectionKey key = (SelectionKey) selectedKeys.next();
					selectedKeys.remove();
					if (!key.isValid()) {
						continue;
					}

					// Check what event is available and deal with it
					if (key.isAcceptable()) {
						this.accept(key);
					} else if (key.isReadable()) {
						if (!this.read(key)) {
                            flag= false;
                            break;
                        };
					} else if (key.isWritable()) {
						this.write(key);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
        Thread[] ths = getAllThreads();
        System.out.println("Connections are closing...");
        for (int i=0;i<ths.length;i++) ths[i].interrupt();
        System.exit(0);
	}

	private void accept(SelectionKey key) throws IOException {
		// For an accept to be pending the channel must be a server socket channel.
		ServerSocketChannel serverSocketChannel = (ServerSocketChannel) key.channel();

		// Accept the connection and make it non-blocking
		SocketChannel socketChannel = serverSocketChannel.accept();
		Socket socket = socketChannel.socket();
		socketChannel.configureBlocking(false);
        //System.out.println(socket.getRemoteSocketAddress().toString());
		// Register the new SocketChannel with our Selector, indicating
		// we'd like to be notified when there's data waiting to be read
		socketChannel.register(this.selector, SelectionKey.OP_READ);
        System.out.println("User from IP" +socketChannel.getRemoteAddress().toString()+" connected");
		System.out.println("Socket IP address "+socket.getInetAddress().toString());
        numberOfClients++;
        //System.out.println(this.selector.select());
	}

	private boolean read(SelectionKey key) throws IOException {
		SocketChannel socketChannel = (SocketChannel) key.channel();

		// Clear out our read buffer so it's ready for new data
		this.readBuffer.clear();

		// Attempt to read off the channel
		int numRead;
		try {
			numRead = socketChannel.read(this.readBuffer);
            String ss = new String(this.readBuffer.array());
			if (ss.indexOf("\r\n")>=0) {
				ss = ss.substring(0, ss.indexOf("\r\n"));
			}
            //System.out.println(ss);
            if (ss.equalsIgnoreCase("mobi1!")) {
                key.cancel();
                socketChannel.close();
                return false;
            }
		} catch (IOException e) {
			// The remote forcibly closed the connection, cancel
			// the selection key and close the channel.
			key.cancel();
			socketChannel.close();
			return false;
		}

		if (numRead == -1) {
			// Remote entity shut the socket down cleanly. Do the
			// same from our end and cancel the channel.
            String s = ((SocketChannel) key.channel()).getRemoteAddress().toString();
            key.channel().close();
			key.cancel();
            System.out.println("User from IP "+s+" left");
            numberOfClients--;
            return true;
            // return (numberOfClients > 0);
		}

		// Hand the data off to our worker thread
		this.worker.processData(this, socketChannel, this.readBuffer.array(), numRead);
        return true;
	}

	private void write(SelectionKey key) throws IOException {
		SocketChannel socketChannel = (SocketChannel) key.channel();

		synchronized (this.pendingData) {
			List queue = (List) this.pendingData.get(socketChannel);

			// Write until there's not more data ...
			while (!queue.isEmpty()) {
				ByteBuffer buf = (ByteBuffer) queue.get(0);
				socketChannel.write(buf);
				if (buf.remaining() > 0) {
					// ... or the socket's buffer fills up
					break;
				}
				queue.remove(0);
			}

			if (queue.isEmpty()) {
				// We wrote away all data, so we're no longer interested
				// in writing on this socket. Switch back to waiting for
				// data.
				key.interestOps(SelectionKey.OP_READ);
			}
		}
	}

	private Selector initSelector() throws IOException {
		// Create a new selector
		Selector socketSelector = SelectorProvider.provider().openSelector();

		// Create a new non-blocking server socket channel
		this.serverChannel = ServerSocketChannel.open();
		serverChannel.configureBlocking(false);

		// Bind the server socket to the specified address and port
		InetSocketAddress isa = new InetSocketAddress(this.hostAddress, this.port);
		serverChannel.socket().bind(isa);

		// Register the server socket channel, indicating an interest in 
		// accepting new connections
		serverChannel.register(socketSelector, SelectionKey.OP_ACCEPT);

		return socketSelector;
	}

	public static void main(String[] args) {
		DateFormat df = new SimpleDateFormat("dd_MM_yyyy");
		Date dt = new Date();
		try {
			int port = 4444;
			if (args.length > 0) {
				if (!args[0].isEmpty()) port = Integer.parseInt(args[0]);
				if (!args[1].isEmpty()) {
					try {
						String output_file = "Log_"+df.format(dt)+".txt";
						System.setOut(new PrintStream(new File(output_file)));
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}

			EchoWorker worker = new EchoWorker();
			Thread tw = new Thread(worker);
			tw.start();
			NioServer ts = new NioServer(null, port, worker);
			new Thread(ts).start();
			/*Thread[] ths= ts.getAllThreads();
            int cn=1;
            for(int i=0;i<ths.length ;i++) {
                if (ths[i].getName().indexOf("Client")>0) cn++;
            }
            tw.setName("Client #"+cn);*/
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			System.out.println("Server started at "+df.format(dt)+". Opened port # "+port);
		}
	}
}
