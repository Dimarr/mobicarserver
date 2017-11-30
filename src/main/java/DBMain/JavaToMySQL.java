package DBMain;

import com.mysql.fabric.jdbc.FabricMySQLDriver;
import org.json.JSONObject;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * Created by DR
 */
public class JavaToMySQL {
    // JDBC URL, username and password of MySQL server

    static readIni rIni = new readIni();

    private final String url = rIni.run("options.ini")[0]+"/"+rIni.run("options.ini")[1]+"?verifyServerCertificate=false&useSSL=true";
    private static final String user = rIni.run("options.ini")[2];
    private static final String password = rIni.run("options.ini")[3];
    public static Connection con;
    public static Statement stmt;
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


    public String getJSONFromResultSet(ResultSet rs,String keyName) {
        Map json = new HashMap();
        List list = new ArrayList();
        if(rs!=null) {
            try {
                ResultSetMetaData metaData = rs.getMetaData();
                while(rs.next()) {
                    Map<String, Object> columnMap = new HashMap<String, Object>();
                    for (int columnIndex = 1; columnIndex <= metaData.getColumnCount(); columnIndex++) {
                        // if(metaData.getColumnTypeName(columnIndex)!="BLOB") {
                            if (rs.getString(metaData.getColumnLabel(columnIndex)) != null)
                                columnMap.put(metaData.getColumnLabel(columnIndex), rs.getString(metaData.getColumnLabel(columnIndex)));
                            else
                                columnMap.put(metaData.getColumnLabel(columnIndex), "");
                      /*  } else {
                            if (rs.getString(metaData.getColumnLabel(columnIndex)) != null) {
                                InputStream in = rs.getBinaryStream(columnIndex);
                                OutputStream f = null;
                                try {
                                    f = new FileOutputStream(new File("C:\\Temp"+"\\test"+columnIndex+".jpg"));
                                } catch (FileNotFoundException e) {
                                    e.printStackTrace();
                                }
                                int c = 0;
                                try {
                                    while ((c = in.read()) > -1) {
                                        f.write(c);
                                    }
                                } catch (IOException e) {
                                    e.printStackTrace();
                                }
                                try {
                                    f.close();
                                } catch (IOException e) {
                                    e.printStackTrace();
                                }
                                try {
                                    in.close();                                //columnMap.put(metaData.getColumnLabel(columnIndex), gson.toJson(metaData.getColumnLabel(columnIndex)));
                                } catch (IOException e) {
                                    e.printStackTrace();
                                }
                            } else columnMap.put(metaData.getColumnLabel(columnIndex), "");
                        } */
                    }
                    list.add(columnMap);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            json.put(keyName, list);
        }
    return JSONObject.valueToString(json);
}
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

    public void openCon()  {
        try {
            Driver driver = new FabricMySQLDriver();
            DriverManager.registerDriver((driver));
        } catch (SQLException e) {
            System.err.println("Not loaded driver");
        };
        try {
            // opening database connection to MySQL server
            Class.forName("com.mysql.jdbc.Driver");
            //System.out.println("url "+url+" user "+user+" pwd"+ password);
            con = DriverManager.getConnection(url, user, password);

            // getting Statement object to execute query
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void CloseCon() {
        try {
            con.close();
        } catch (SQLException se) { /*can't do anything */ }
    }


    public void DbExec(String exquery) {
        try {
            Driver driver = new FabricMySQLDriver();
            DriverManager.registerDriver((driver));
        } catch (SQLException e) {
            System.err.println("Not loaded driver");
        }
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


