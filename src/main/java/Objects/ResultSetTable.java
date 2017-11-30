package Objects;

/**
 * Created by DR on 24.08.2016.
 */

import DBMain.readIni;
import com.mysql.fabric.jdbc.FabricMySQLDriver;

import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.swing.*;
import javax.swing.table.*;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 This program shows how to display the result of a
 database query in a table.
 */
public class ResultSetTable{
    //public static void main(String[] args)
        //public int spid;
        public ResultSetTable(Integer uid,String sql){
            ResultSetFrame frame = new ResultSetFrame(uid,sql);
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            frame.show();
            //this.spid= frame.spid_;

    }
    //}
}
/**
 This frame contains a combo box to select a database table
 and a table to show the data stored in the table
 */
class CommonResultSetFrame extends JFrame{
    public  Properties   configCommon = new Properties();
    public  Connection   conn;
    public  String       url;
    public  String       userName;
    public  String       userPwd;
    public  CommonResultSetFrame(final String sql, String frametitle, String btntitle) throws SQLException {
        setTitle("Services");
        setSize(WIDTH, HEIGHT);
        try
        {
            parseConfig();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

        if (rs != null) try {
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            Driver driver = new FabricMySQLDriver();
            DriverManager.registerDriver((driver));
        } catch (SQLException e) {
            System.err.println("Not loaded driver");
        };
        try {
            final String query = sql;
                    //new StringBuilder().append("select * from calls where userid=").append(uid).toString();

            Class.forName("com.mysql.jdbc.Driver");
            //System.out.println("*"+password+"*");

            conn = DriverManager.getConnection(url, userName, userPwd);

            // getting Statement object to execute query
            final Statement st = conn.createStatement();


            ResultSet rs = st.executeQuery(query);
            //System.out.println(query);
            DatabaseTableModel model = new DatabaseTableModel();
            model.setDataSource(rs);

           final JTable table = new JTable(model);

            JPanel panel = new JPanel(new BorderLayout());

            panel.add(new JScrollPane(table), BorderLayout.CENTER);
            JButton button = new JButton(btntitle);

            ActionListener actionListener = new ActionListener() {
                public void actionPerformed(ActionEvent e) {
                    // code for selected
                    String callid= (String) table.getValueAt(table.getSelectedRow(),table.getColumnCount()-1);
                    String query ="";
                    try {
                        ResultSet rs = st.executeQuery(query);
                    } catch (SQLException e1) {
                        e1.printStackTrace();
                    }
                }
            };


            button.addActionListener(actionListener);
            button.setLocation(12, 12); // расположение на форме
            button.setSize(165, 50); // размер
            panel.add(button, BorderLayout.SOUTH);

            JFrame frame = new JFrame(frametitle);

            frame.setLocationRelativeTo(null);

            frame.setSize(500, 400);

            frame.setContentPane(panel);

            //frame.getContentPane().add(button);
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

            frame.setVisible(true);
            //Container contentPane = getContentPane();
  /*          if (scrollPane != null)
                getContentPane().remove(scrollPane);

            final JTable table = new JTable(model);
            scrollPane = new JScrollPane(table);
            JButton button = new JButton("Select service");
            button.addActionListener(actionListener);
            scrollPane.add(button);
            getContentPane().add(scrollPane,
                    BorderLayout.CENTER);
            getContentPane().add(button,BorderLayout.SOUTH);
*/
            pack();
            doLayout();

        } catch (ClassNotFoundException e1) {
            e1.printStackTrace();
        }

    }

    private void parseConfig() {
        readIni rIni = new readIni();
        url = rIni.run("options.ini")[0]+"/"+rIni.run("options.ini")[1];
        userName = rIni.run("options.ini")[2];
        userPwd = rIni.run("options.ini")[3];
    }

    private Connection setConnection() throws SQLException
    {
        Driver driver = new FabricMySQLDriver();
        DriverManager.registerDriver((driver));
        //DriverManager.registerDriver(new Driver());
        //conn = (OracleConnection)DriverManager.getConnection(url, userName, userPwd);
        conn=DriverManager.getConnection(url, userName, userPwd);
        return conn;
    }
    public Connection getConnection() throws SQLException
    {
        if (conn == null)
        {
            setConnection();
        }
        return conn;
    }
    private JScrollPane scrollPane;
    private ResultSetTableModel model;
    private JComboBox tableNames;
    private ResultSet rs;
    private Statement stat;
    private boolean scrolling;
    private static final int WIDTH = 400;
    private static final int HEIGHT = 300;
}

class ResultSetFrame extends JFrame
{
    public  Properties   configCommon = new Properties();
    public  Connection   conn;
    public  String       url;
    public  String       userName;
    public  String       userPwd;
    public String spid_;
    public String sid_;
    public ResultSetFrame(final Integer uid,final String sql_)
    {
        setTitle("Services");
        setSize(WIDTH, HEIGHT);
        try
        {
            parseConfig();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
      /* find all tables in the database and add them to
        a combo box
     */
        Container contentPane = getContentPane();
        tableNames = new JComboBox();
        tableNames.addActionListener(new ActionListener(){
                                                 public void actionPerformed(ActionEvent evt)
                                                 {
                                                     try
                                                     {
                                                         if (scrollPane != null)
                                                             getContentPane().remove(scrollPane);
                                                         String tableName
                                                                 = (String)tableNames.getSelectedItem();
                                                         tableNames.setVisible(false);

                                                         if (rs != null) rs.close();
                                                         String query = "SELECT * FROM " + tableName;
                                                         rs = stat.executeQuery(query);
                                                         if (scrolling)
                                                             model = new ScrollingResultSetTableModel(rs);
                                                         else
                                                             model = new CachingResultSetTableModel(rs);
                                                         final JTable table = new JTable(model);
                                                         //TableColumnModel tablelumnModel = table.getColumnModel();
                                                         //System.out.println("В table: "+table.getColumnCount()+", в model: "+model.getColumnCount());
                                                         scrollPane = new JScrollPane(table);
                                                         JButton button = new JButton("Select service");
                                                         ActionListener actionListener = new ActionListener() {
                                                             public void actionPerformed(ActionEvent e) {
                                                                 sid_= table.getValueAt(table.getSelectedRow(),6).toString();
                                                                 String s;
                                                                 s= sql_.replace("###",sid_);
                                                                 spid_= table.getValueAt(table.getSelectedRow(),7).toString();
                                                                 s= sql_.replace("***",spid_);
                                                                 //System.out.println("Res "+s);
                                                                 if (conn != null)
                                                                 try {
                                                                     stat.execute(s);
                                                                     try {
                                                                         String query = new StringBuilder().append("select * from calls where userid=").append(uid).toString();

                                                                         Statement st = conn.createStatement();

                                                                         ResultSet rs = st.executeQuery(query);
                                                                         DatabaseTableModel model = new DatabaseTableModel();
                                                                         model.setDataSource(rs);
                                                                         JTable table = new JTable(model);

                                                                         JPanel panel = new JPanel(new BorderLayout());

                                                                         panel.add(new JScrollPane(table), BorderLayout.CENTER);

                                                                         JFrame frame = new JFrame("List of calls");

                                                                         frame.setLocationRelativeTo(null);

                                                                         frame.setSize(500, 400);

                                                                         frame.setContentPane(panel);

                                                                         frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

                                                                         frame.setVisible(true);
                                                                     } catch (ClassNotFoundException e1) {
                                                                         e1.printStackTrace();
                                                                     }


                                                                 } catch (SQLException e1) {
                                                                     e1.printStackTrace();
                                                                 }

                                                             }
                                                         };
                                                         button.addActionListener(actionListener);
                                                         scrollPane.add(button);
                                                         getContentPane().add(scrollPane,
                                                                 BorderLayout.CENTER);
                                                         getContentPane().add(button,BorderLayout.SOUTH);
                                                         pack();
                                                         doLayout();
                                                     }
                                                     catch(SQLException e)
                                                     {
                                                         e.printStackTrace();
                                                     }
                                                 }
                                             });
        JPanel p = new JPanel();
        p.add(tableNames);
        contentPane.add(p, BorderLayout.NORTH);
        try
        {
            conn = getConnection();
            DatabaseMetaData meta = conn.getMetaData();
            if (meta.supportsResultSetType(
                    ResultSet.TYPE_SCROLL_INSENSITIVE))
            {
                scrolling = true;
                stat = conn.createStatement(
                        ResultSet.TYPE_SCROLL_INSENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
            }
            else
            {
                stat = conn.createStatement();
                scrolling = false;
            }
            //meta.getTables()
            ResultSet tables = meta.getTables(null, null, null,
                    new String[] { "VIEW" });
            while (tables.next())
                tableNames.addItem(tables.getString(3));
            tables.close();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        addWindowListener(new
                                  WindowAdapter()
                                  {
                                      public void windowClosing(WindowEvent event)
                                      {
                                          try
                                          {
                                              conn.close();
                                          }
                                          catch (SQLException e)
                                          {
                                              e.printStackTrace();
                                          }
                                      }
                                  });
    }
   void parseConfig()
    {
        readIni rIni = new readIni();

        url = rIni.run("options.ini")[0]+"/"+rIni.run("options.ini")[1];
        userName = rIni.run("options.ini")[2];
        userPwd = rIni.run("options.ini")[3];
    }
    private Connection setConnection() throws SQLException
    {
        Driver driver = new FabricMySQLDriver();
        DriverManager.registerDriver((driver));
        //DriverManager.registerDriver(new Driver());
        //conn = (OracleConnection)DriverManager.getConnection(url, userName, userPwd);
        conn=DriverManager.getConnection(url, userName, userPwd);
        return conn;
    }
    public Connection getConnection() throws SQLException
    {
        if (conn == null)
        {
            setConnection();
        }
        return conn;
    }
    private JScrollPane scrollPane;
    private ResultSetTableModel model;
    private JComboBox tableNames;
    private ResultSet rs;
    private Statement stat;
    private boolean scrolling;
    private static final int WIDTH = 400;
    private static final int HEIGHT = 300;
}
/**
 This class is the superclass for the scrolling and the
 caching result set table model. It stores the result set
 and its metadata.
 */
abstract class ResultSetTableModel extends AbstractTableModel
{
    /**
     Constructs the table model.
     @param aResultSet the result set to display.
     */
    public ResultSetTableModel(ResultSet aResultSet)
    {
        rs = aResultSet;
        try
        {
            rsmd = rs.getMetaData();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
    }
    public String getColumnName(int c)
    {
        try
        {
            return rsmd.getColumnName(c + 1);
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return "";
        }
    }
    public int getColumnCount()
    {
        try
        {
            return rsmd.getColumnCount();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return 0;
        }
    }
    /**
     Gets the result set that this model exposes.
     @return the result set
     */
    protected ResultSet getResultSet()
    {
        return rs;
    }
    private ResultSet rs;
    private ResultSetMetaData rsmd;
}
/**
 This class uses a scrolling cursor, a JDBC 2 feature,
 to locate result set elements.
 */
class ScrollingResultSetTableModel extends ResultSetTableModel
{
    /**
     Constructs the table model.
     @param aResultSet the result set to display.
     */
    public ScrollingResultSetTableModel(ResultSet aResultSet)
    {
        super(aResultSet);
    }
    public Object getValueAt(int r, int c)
    {
        try
        {
            ResultSet rs = getResultSet();
            rs.absolute(r + 1);
            return rs.getObject(c + 1);
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return null;
        }
    }
    public int getRowCount()
    {
        try
        {
            ResultSet rs = getResultSet();
            rs.last();
            return rs.getRow();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return 0;
        }
    }
}
/*
  This class caches the result set data; it can be used
  if scrolling cursors are not supported
*/
class CachingResultSetTableModel extends ResultSetTableModel
{
    public CachingResultSetTableModel(ResultSet aResultSet)
    {
        super(aResultSet);
        try
        {
            cache = new ArrayList();
            int cols = getColumnCount();
            ResultSet rs = getResultSet();
         /* place all data in an array list of Object[] arrays
           We don't use an Object[][] because we don't know
           how many rows are in the result set
        */
            while (rs.next())
            {
                Object[] row = new Object[cols];
                for (int j = 0; j < row.length; j++)
                    row[j] = rs.getObject(j + 1);
                cache.add(row);
            }
        }
        catch(SQLException e)
        {
            System.out.println("Error " + e);
        }
    }
    public Object getValueAt(int r, int c)
    {
        if (r < cache.size())
            return ((Object[])cache.get(r))[c];
        else
            return null;
    }
    public int getRowCount()
    {
        return cache.size();
    }
    private ArrayList cache;
}
