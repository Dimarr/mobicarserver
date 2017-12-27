package Objects;

import DBMain.JavaToMySQL;

import java.io.*;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import static Objects.Crypt.md5Apache;

/**
 * Created by DR on 18.08.2016.
 */
public class User {
    private int id;
    private float x; // geoposition
    private float y; // geoposition
    private String firstname;
    private String lastname;
    private String creditcard;
    private String CDetail;

    public int getId() {
        return id;
    }

    public User(int id) {
        this.id = id;
    }

    public String getFName() {
        return firstname;
    }

    public String getLName() {
        return lastname;
    }

    public void setFName(String FName) {
        this.firstname = FName;
    }

    public void setLName(String LName) {
        this.lastname = LName;
    }

    public void setCC(String CC) {
        this.creditcard = CC;
    }

    public static Integer LogedLite (String email, int phone) throws SQLException {
        String sql;
        if (phone==0) {
            sql = "select userid from users where email='" + email + "';";
        } else {
            sql = "select userid from users where phone='" + email + "';";
        }
        JavaToMySQL jtm = new JavaToMySQL();
        ResultSet rs = jtm.DSelect(sql);
        rs.last();
        if (rs.getRow()==0) {
            return -1;
        } else {
            Date date = new Date();
            Integer uid = rs.getInt("userid");
            sql= "update users set attempt=0,logined=1, logtime='" + date.toString()+ "' where userid=" + uid;
            jtm.DbExec(sql);
            return uid;
        }

    }


    public static Integer Loged (String email, String pwd, int phone) throws SQLException {
        String crpwd = md5Apache(pwd);
        String sql;
        if (phone==0) {
               sql = "select userid from users where email='" + email + "' and password='" + crpwd + "';";
        } else {
                sql = "select userid from users where phone='" + email + "' and password='" + crpwd + "';";
        }
        JavaToMySQL jtm = new JavaToMySQL();
        ResultSet rs = jtm.DSelect(sql);
        rs.last();
        if (rs.getRow()==0) {
            return -1;
        } else {
            Date date = new Date();
            Integer uid = rs.getInt("userid");
            sql= "update users set attempt=0,logined=1, logtime='" + date.toString()+ "' where userid=" + uid;
            jtm.DbExec(sql);
            return uid;
        }
    }

    public static String AddNewPayment(String uid,String spid,Float amount, String paymetrid) throws SQLException {
        java.util.Date dt = new java.util.Date();
        java.text.SimpleDateFormat sdf =
                new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String currentTime = sdf.format(dt);
        String sql ="INSERT INTO payments (userid,spid,pdate,amount,pstatus,paymetrid) VALUES ("+uid+","+
                spid+",'"+currentTime+"',"+Float.toString(amount)+",1,'"+paymetrid+"');";
        JavaToMySQL jtm = new JavaToMySQL();
        jtm.DbExec(sql);
        sql = "SELECT max(payid) FROM payments";
        ResultSet rs= jtm.DSelect(sql);
        try {
            rs.first();
            Integer res = rs.getInt(1);
            return String.valueOf(res);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "-1";
    }

    public static String GetToken(String uid) {
        JavaToMySQL jmt = new JavaToMySQL();
        String sql = "SELECT token FROM users WHERE userid="+uid+";";
        ResultSet rs= jmt.DSelect(sql);
        try {
            rs.first();
            String res = rs.getString(1);
            rs.close();
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "";
    }

    public static Integer Verifypincode(String uid, String pincode) {
        JavaToMySQL jmt = new JavaToMySQL();
        String sql = "SELECT count(*) FROM users WHERE userid="+uid+" AND password='"+Crypt.md5Apache(pincode)+"';";
        ResultSet rs= jmt.DSelect(sql);
        try {
            rs.first();
            Integer res = rs.getInt(1);
            rs.close();
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static void Setpincode(String uid, String pincode) {
        String sql ="UPDATE users SET password='"+Crypt.md5Apache(pincode)+"' WHERE userid="+uid;
        JavaToMySQL jtm = new JavaToMySQL();
        jtm.DbExec(sql);
    }

    public static void SetToken(String uid, String token) {
        String sql ="UPDATE users SET token='"+token+"' WHERE userid="+uid;
        JavaToMySQL jtm = new JavaToMySQL();
        jtm.DbExec(sql);
    }

    public static void SetPaymentStatus(String payid, String status) {
        String sql ="UPDATE payments SET pstatus="+status+" WHERE payid="+payid;
        JavaToMySQL jtm = new JavaToMySQL();
        jtm.DbExec(sql);
    }

    public static String GetPayments(String uid) {
        JavaToMySQL jtm = new JavaToMySQL();
        String sql = "SELECT paymentstatus.pstatus as PaymentStatus, payments.amount as Amount,\n " +
        "payments.pdate as PaymentDate, payments.paymetrid as PaymeTransactionID FROM payments,paymentstatus\n" +
                "WHERE payments.pstatus= paymentstatus.id AND payments.userid="+uid;
        return jtm.getJSONFromResultSet(jtm.DSelect(sql),"userpayments");
    }

    public static void setAttempt(String uid) throws SQLException {
        String sql ="UPDATE users set attempt=attempt+1 where userid="+uid;
        JavaToMySQL jtm = new JavaToMySQL();
        jtm.DbExec(sql);
    }

    public static void Logout (String suid) throws SQLException {
        String sql ="UPDATE users set logined=0 where userid="+suid;
        JavaToMySQL jtm = new JavaToMySQL();
        jtm.DbExec(sql);
    }

    public static void InsertPicUser(String PathPic, Integer uid) throws SQLException, FileNotFoundException {
        PreparedStatement statement;
        try (InputStream inputStream = new FileInputStream(new File(PathPic))) {
            String sql = "UPDATE users SET pic = (?) WHERE userid="+uid;
            JavaToMySQL jmt = new JavaToMySQL();
            jmt.openCon();
            statement = jmt.con.prepareStatement(sql);
            statement.setBlob(1, inputStream);
            statement.executeUpdate();
            jmt.CloseCon();
        } catch (IOException e) {
            e.printStackTrace();
        };
    }

    public static void setphone(Integer uid, String phone) {
        String sql = "UPDATE users SET phone='"+phone+"' WHERE userid="+uid+";";
        JavaToMySQL jmt = new JavaToMySQL();
        jmt.DbExec(sql);
    }

    public static String getphone(Integer uid) {
        String sql = "SELECT phone FROM users WHERE userid="+uid;
        JavaToMySQL jmt = new JavaToMySQL();
        ResultSet rs= jmt.DSelect(sql);
        try {
            rs.first();
            String res = rs.getString(1);
            rs.close();
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
            return "-1";
        }
    }

    public static Integer NewuserLite(String fname,String lname,String email, String phone) {
        String sql= "INSERT INTO users (firstname,lastname,email,phone) VALUES('"+fname+"','"+lname+"','"+email+"','"+phone+"');";
        JavaToMySQL jmt = new JavaToMySQL();
        jmt.DbExec(sql);
        sql = "SELECT max(userid) FROM users";
        ResultSet rs= jmt.DSelect(sql);
        try {
            rs.first();
            Integer res = rs.getInt(1);
            rs.close();
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static Integer Newuser(String fname,String lname,String email, String pwd, String cc, String phone, String cartype, String carbrand, String carmodel, String carid ) {
        String crpwd = md5Apache(pwd);
        String sql= "INSERT INTO users (firstname,lastname,creditcard,email,password,phone, cartype) VALUES('"+fname+"','"+lname+"','"+cc+"','"+email+"','"+
                crpwd+"','"+phone+"',"+cartype+");";
        JavaToMySQL jmt = new JavaToMySQL();
        jmt.DbExec(sql);
        sql = "SELECT max(userid) FROM users";
        ResultSet rs= jmt.DSelect(sql);
        try {
            rs.first();
            Integer res = rs.getInt(1);
            SetCarID(res,Integer.valueOf(carbrand),Integer.valueOf(carmodel),carid);
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //System.out.println(crpwd);
        return -1;
    };

    public static void SetXY( Integer userid, Float X, Float Y) {
        String sql= "UPDATE users SET X="+X+",Y="+Y+" WHERE userid="+userid;
        JavaToMySQL jmt = new JavaToMySQL();
        jmt.DbExec(sql);
    };

    public static void saveXY(String userid, String X, String Y) {
        JavaToMySQL jmt = new JavaToMySQL();
        String sql = "INSERT INTO coordinate (spuser,uid,X,Y) VALUES(2,"+userid+","+X+","+Y+");";
        jmt.DbExec(sql);
    }

    public static String getxy(String uid) throws SQLException {
        JavaToMySQL jtm = new JavaToMySQL();
        String sql = "SELECT X,Y,ltime as SavedTime FROM coordinate WHERE spuser=2 and uid="+uid+" order by ltime desc LIMIT 1;";
        return jtm.getJSONFromResultSet(jtm.DSelect(sql),"lastusercoordinates");
    }

    public static Integer SetRating( Integer spid, Integer rating) {
        String sql = "SELECT votes, rating FROM sproviders WHERE id="+spid;
        JavaToMySQL jmt = new JavaToMySQL();
        ResultSet rs= jmt.DSelect(sql);
        Float rv = Float.valueOf(0);
        Integer votes = 0;
        Integer rate = 0;
        try {
            rs.first();
            votes= rs.getInt(1)+1;
            rate=rs.getInt(2)+rating;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        rv= Float.valueOf(rate)/Float.valueOf(votes);
        Integer calcrate=Math.round(rv)*5;
        sql = "UPDATE sproviders SET votes="+votes+", rating="+rate+", point="+calcrate+" WHERE id="+spid;
        jmt.DbExec(sql);
        return Math.round(rv);
    }

    public static String jsonrs(String sql, String key){
        JavaToMySQL jtm = new JavaToMySQL();
        return jtm.getJSONFromResultSet(jtm.DSelect(sql),key);
    }

    public static void SetCarID(Integer uid, Integer brand, Integer model, String carid){
        JavaToMySQL jmt = new JavaToMySQL();
        Integer carbm= brand*10+model;
        String sql = "UPDATE users SET carbm="+carbm+",carid='"+carid+"' WHERE userid="+uid;
        jmt.DbExec(sql);
    }

    public static String GetCarID(Integer uid){
        //Gson gson = new Gson();
        //String json = null;
        JavaToMySQL jmt = new JavaToMySQL();
        String sql = "SELECT carbm, carid FROM users WHERE userid="+uid;
        String res ="";
        ResultSet rs= jmt.DSelect(sql);
        try {
            rs.first();
            Integer brand= rs.getInt(1)/10;
            Integer model= rs.getInt(1) % 10;
            String carid = rs.getString(2); //.substring(0,2)+"-"+rs.getString(2).substring(2,5)+"-"+rs.getString(2).substring(5);
            rs.close();
            sql = "SELECT name from carbrand WHERE id="+brand;
            rs= jmt.DSelect(sql);
            rs.first();
            String brandname=rs.getString(1);
            rs.close();

            sql = "SELECT name from carmodel WHERE id="+model+" AND brandid="+brand;
            rs= jmt.DSelect(sql);
            rs.first();
            String modelname=rs.getString(1);
            rs.close();
            res= "{\"Carlist\":[{\"CarBrand\":\""+brandname+"\",\"CarModel\":\""+modelname+"\",\"CarID\":\""+carid+"\"}]}";
            //{"Carlist":[{"CarBrand":"Nissan","CarModel":"Murano","CarID":"5884"}]}
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    public static String listsp(String servid, String subservid,String userid, String X, String Y,  String locationid, String top){
        JavaToMySQL jtm = new JavaToMySQL();
        String sql;
        String r ="-1";
        //sql="{ call setpoint(?,?,?,?) }";
        sql="{ call setpointnew(?,?,?,?) }";
        try {
            CallableStatement stmt;
            jtm.openCon();
            stmt= jtm.con.prepareCall(sql);
            stmt.setInt(1, Integer.parseInt(servid));
            stmt.setInt(2, Integer.parseInt(userid));
            stmt.setFloat(3, Float.parseFloat(X));
            stmt.setFloat(4, Float.parseFloat(Y));
            stmt.executeQuery();
            stmt.close();
            jtm.CloseCon();
            sql = "SELECT searchservice.*, if(votes=0,0,format(searchservice.rating/votes,2)) as Rate,Votes FROM searchservice, search " +
                    "WHERE search.spid=searchservice.spid AND ";
            if (Integer.valueOf(subservid)>0) {
                sql +=  "search.userid=" + userid + " AND searchservice.serviceid=" + servid + " AND searchservice.subserviceID=" +
                        subservid + " AND locationid=" + locationid + " ORDER BY search.point DESC";
            } else {
                sql +=  "search.userid=" + userid + " AND searchservice.serviceid=" + servid +
                        " AND locationid=" + locationid + " ORDER BY search.point DESC";

            }
            /*

            if (Integer.valueOf(cartype)==0) {
                sql = "SELECT sproviders.id as spid,name, phone, address, X, Y,"+
                        " if(votes=0,0,format(sproviders.rating/votes,2)) as Rate,Votes," +
                        " spservices.price as Price, if(prof=21,\"Yes\",\"No\") as Diploma, \"Any\" as Cartype" +
                        " FROM search, sproviders, spservices" +
                        " WHERE search.spid=sproviders.id and search.spid=spservices.spid and search.userid=" + userid;
                //if (Integer.valueOf(servid)>0)
                sql += " and spservices.serviceid= " + servid;
                sql += " ORDER BY search.point DESC";
            } else {
                sql = "SELECT sproviders.id as spid,name, phone, address, X, Y,"+
                        " if(votes=0,0,format(sproviders.rating/votes,2)) as Rate,Votes," +
                        " spservices.price as Price, if(prof=21,\"Yes\",\"No\") as Diploma, cartype.typename as Cartype" +
                        " FROM search, sproviders, spservices, cartype" +
                        " WHERE search.spid=sproviders.id and search.spid=spservices.spid and search.userid=" + userid;
                //if (Integer.valueOf(servid)>0)
                sql += " and spservices.serviceid= " + servid;
                sql += " and cartype.id=spservices.cartype and cartype.id="+cartype+" ORDER BY search.point DESC";
            }
            */
            //System.out.println(sql);
            if (Integer.valueOf(top)>0) {
                sql+=" LIMIT "+top;
            }
            r = jtm.getJSONFromResultSet(jtm.DSelect(sql),"Results for userID#"+userid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }

    public String AddCall_1( String CDetail) {
        String sql;
        long curTime = System.currentTimeMillis();
        Date dt = new Date(curTime);
        sql= "INSERT INTO calls (userid,spid,cdate,details,serviceid) VALUES ("+this.id+ ",***,'"+dt+ "','"+CDetail+"',###);";
        ResultSetTable resultSetTable = new ResultSetTable(id,sql);
        return sql;
    }

    public void AddCallSQL( String CDetail, Integer spid, Integer serviceid) {
        String sql;
        long curTime = System.currentTimeMillis();
        Date dt = new Date(curTime);
        sql= "INSERT INTO calls (userid,spid,cdate,details,serviceid) VALUES ("+this.id+ ","+spid+",'"+dt+ "','"+CDetail+"',"+serviceid+");";
        JavaToMySQL jmt = new JavaToMySQL();
        jmt.DbExec(sql);
        //return sql;
    }

    public static void AcceptJob( Integer payid) {
		String sql = "UPDATE payments SET pstatus=2 WHERE pstatus=1 and payid="+payid;
        JavaToMySQL jmt = new JavaToMySQL();
        jmt.DbExec(sql);
        // Will be implemented payment transaction mechanism
    }
    public static void DeclineJob( Integer payid) {
        String sql = "UPDATE payments SET pstatus=3 WHERE pstatus=1 and payid="+payid;
        JavaToMySQL jmt = new JavaToMySQL();
        jmt.DbExec(sql);
        // Will be implemented payment transaction mechanism
    }
    public ResultSet ViewPayments( ) {
        String sql;
		// Will be implemented views of all user's payments
        sql = "SELECT payments.payid, sproviders.name as Provider, amount as Amount, details as 'Payment detail', pdate as 'Payment date'," +
                " paymentstatus.pstatus as 'Payment status' FROM payments, sproviders, paymentstatus " +
                "WHERE payments.spid= sproviders.id and payments.pstatus= paymentstatus.id and payments.userid="+this.id+ " ORDER BY pdate, payments.pstatus;";
        JavaToMySQL jtm = new JavaToMySQL();
        //System.out.println(sql);
        return jtm.DSelect(sql);
    }

    public String ViewPaymentsSQL( ) {
        String sql;
        // Will be implemented views of all user's payments
        sql = "SELECT payments.payid, sproviders.name as Provider, amount as Amount, details as 'Payment detail', pdate as 'Payment date'," +
                " paymentstatus.pstatus as 'Payment status' FROM payments, sproviders, paymentstatus " +
                "WHERE payments.spid= sproviders.id and payments.pstatus= paymentstatus.id and payments.userid="+this.id+ " ORDER BY pdate, payments.pstatus;";
        //JavaToMySQL jtm = new JavaToMySQL();
        //System.out.println(sql);
        return sql;
    }


    public ResultSet ViewCalls(Integer callstatus ) {
        // Will be implemented views of all user's calls
        String sql = "select sproviders.name as providername,sproviders.phone as providerphone, sproviders.rating ,spservices.price, servicetype.name as servicename\n" +
                ",calls.cdate,calls.details,calls.callid as callid\n" +
                " from calls, sproviders, servicetype, spservices where\n" +
                " calls.spid = sproviders.id \n" +
                "and spservices.serviceid=servicetype.id and spservices.spid= sproviders.id and calls.userid=" + this.id + " and calls.status=" + callstatus;

        JavaToMySQL jtm = new JavaToMySQL();
        return jtm.DSelect(sql);
    }
    public String ViewCallsSQL(Integer callstatus ) {
		// Will be implemented views of all user's calls
        return "select sproviders.name as providername,sproviders.phone as providerphone, sproviders.rating ,spservices.price, servicetype.name as servicename " +
                ",calls.cdate,calls.details,calls.callid as callid " +
                " from calls, sproviders, servicetype, spservices where " +
                " calls.spid = sproviders.id " +
                "and spservices.serviceid=servicetype.id and spservices.spid= sproviders.id and calls.userid="+this.id+" and calls.status="+callstatus;
    }
}
