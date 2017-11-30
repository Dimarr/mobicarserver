package DBMain;

import com.mysql.fabric.jdbc.FabricMySQLDriver;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
/**
 * Created by DR
 */
public class JavaToMySQL {
    // JDBC URL, username and password of MySQL server

    static readIni rIni = new readIni();

    private final String url = rIni.run("options.ini")[0]+"/"+rIni.run("options.ini")[1]+"?verifyServerCertificate=false&useSSL=true";
    private static final String user = rIni.run("options.ini")[2];
    private static final String password = rIni.run("options.ini")[3];
    private static Connection con;
    private static Statement stmt;
    private static ResultSet rs;
    public ResultSet DSelect(String sql) {
        ResultSet r = null;
        try {
            Driver driver = new FabricMySQLDriver();
            DriverManager.registerDriver((driver));
        } catch (SQLException e) {
            System.err.println("Not loaded driver");
        }
        ;
        try {
            // opening database connection to MySQL server
            Class.forName("com.mysql.jdbc.Driver");

            con = DriverManager.getConnection(url, user, password);

            // getting Statement object to execute query
            stmt = con.createStatement();
            r = stmt.executeQuery(sql);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    };
    public ArrayList<String> DbSelect(String SQLTable, int mode,int columnindex){
        //Connection connection;
        try {
            Driver driver = new FabricMySQLDriver();
            DriverManager.registerDriver((driver));
        } catch (SQLException e) {
            System.err.println("Not loaded driver");
        }
        ;
        ArrayList<String> serv = new ArrayList<String>();
        try {
            // opening database connection to MySQL server
            Class.forName("com.mysql.jdbc.Driver");
            //System.out.println("*"+password+"*");

            con = DriverManager.getConnection(url, user, password);

            // getting Statement object to execute query
            stmt = con.createStatement();

            // executing SELECT query if mode =1 othercase executing getting query string
            String query;
            if (mode == 1) {
                query = "select * from " + SQLTable;
            } else query = SQLTable;

            rs = stmt.executeQuery(query);

            //if (rs.isFirst()) {
            //    serv.add(rs.getNString(2));
            //}
            //rs.
            try {
                while (rs.next()) {
                    serv.add(rs.getObject(columnindex).toString());
                    //getNString(columnindex));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                //close connection ,stmt and resultset here
                try {
                    con.close();
                } catch (SQLException se) { /*can't do anything */ }
                try {
                    stmt.close();
                } catch (SQLException se) { /*can't do anything */ }
                try {
                    rs.close();
                } catch (SQLException se) { /*can't do anything */ }

            }

        }catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        //System.out.println("11 "+serv.size());
        return serv;
    }


    public void DbExec(String exquery) {
        try {
            Driver driver = new FabricMySQLDriver();
            DriverManager.registerDriver((driver));
        } catch (SQLException e) {
            System.err.println("Not loaded driver");
        }
        ;
        try {
            // opening database connection to MySQL server
            Class.forName("com.mysql.jdbc.Driver");
            //System.out.println("url "+url+" user "+user+" pwd"+ password);
            con = DriverManager.getConnection(url, user, password);

            // getting Statement object to execute query
            stmt = con.createStatement();
            stmt.execute(exquery);
        }

        catch (SQLException sqlEx) {
            sqlEx.printStackTrace();
                    } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            //close connection ,stmt and resultset here
            try {
                con.close();
            } catch (SQLException se) { /*can't do anything */ }
            try {
                stmt.close();
            } catch (SQLException se) { /*can't do anything */ }
        }

    }

    }


