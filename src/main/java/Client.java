import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class Client {
    public static void main(String[] args) throws IOException {

        System.out.println("Welcome to Client side");
        System.out.println("Use exit for closing client");

        Socket fromserver = null;

        if (args.length<2) {
            System.out.println("Use: Client hostname port");
            System.exit(-1);
        }

        System.out.println("Connecting to... "+args[0]);

        Integer port = Integer.valueOf(args[1]);

        fromserver = new Socket(args[0],port);
        BufferedReader in = new BufferedReader(new InputStreamReader(fromserver.getInputStream()));
        PrintWriter    out = new PrintWriter(fromserver.getOutputStream(),true);
        BufferedReader inu = new BufferedReader(new InputStreamReader(System.in));

        String fuser,fserver;
        System.out.println("***************** Test API commands *****************");
    /*    System.out.println("user,123@ff.com,123");
        System.out.println("sp,123@ff.com,123");
        System.out.println("createuser,Shon,Richter,333@ll.com,123,1234123456784567,0541234563,0");
        System.out.println("createsp,Car M Ltd, Holon rotshild, 11@r.com,, test something,0525252522,32.0788,34.11678,2*12*23*87.5,123123");
        System.out.println("getservices,1");
        System.out.println("addservice,1,2,availID,profID,Price,CarTypeID");
        System.out.println("delservice,1,2");
        System.out.println("viewcalls,1,2");
        System.out.println("viewpayments,1");
        System.out.println("addcall,1,some detail,1,2");
        System.out.println("acceptjob,3");
        System.out.println("declinejob,3");
        System.out.println("acceptcall,4,2");
        System.out.println("rejectcall,4");
        System.out.println("setrating,1,7");
        System.out.println("search,ServiceID, UserID, X,Y,CarTypeID, toprows");
        System.out.println("picuser,pathToPic, UserID");
        System.out.println("picsp,pathToPic, SpID");
        System.out.println("getcarid, UserID");
        System.out.println("usersetcarid, UserID,CarBrandID,CarModelID,CarNumberString");
        System.out.println("getnewreqforsp, SpID");
        System.out.println("getcarlistforsp, SpID");
        System.out.println("getsellerid, SpID");
        System.out.println("setsellerid, SpID, SellerID");
        System.out.println("**********************************************************");
    */
        while ((fuser = inu.readLine())!=null) {
            out.println(fuser);
            fserver = in.readLine();
            System.out.println(fserver);
            if (fuser.equalsIgnoreCase("exit")) break;
        }

        out.close();
        in.close();
        inu.close();
        fromserver.close();
    }
} 