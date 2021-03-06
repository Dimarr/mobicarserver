package Objects;

/**
 * Created by SBT-Rumyantsev-DK on 08.09.2016.
 */

import DBMain.JavaToMySQL;

import java.io.*;
import java.sql.*;
import java.util.Date;
import static Objects.Crypt.md5Apache;

/**
 * Created by DR on 18.08.2016.
 */
public class Serviceprovider {
    private int id;
    private float x; // geoposition
    private float y; // geoposition
    public String name;
    public Integer rating;
    public String email;
    public String phone;

    public int getId() {
        return id;
    }

    public Serviceprovider(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public Integer getRating() {
        return rating;
    }

    public String getEmail() { return email; }

    public String getPhone() {
        return phone;
    }

    public void setName(String Name) {
        this.name = Name;
    }

    public void setEmail(String Email) {
        this.email = Email;
    }

    public void setPhone(String Phone) {
        this.phone = Phone;
    }

    public static void updatesp(int id) {
        JavaToMySQL jtm = new JavaToMySQL();
        int points = -1;
        String sql = "{ call setpoint(?,?) }";

        try {
            CallableStatement stmt = null;
            jtm.openCon();
            stmt= jtm.con.prepareCall(sql);
            stmt.setInt(1, id);
            stmt.registerOutParameter(2, Types.INTEGER);
            stmt.executeQuery();
            points=stmt.getInt(2);
            stmt.close();

            jtm.con.createStatement().execute("UPDATE sproviders SET point="+points);
            jtm.CloseCon();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static String searchservice(Integer spid, Integer servid, Integer cartypeid) throws SQLException {
        JavaToMySQL jtm = new JavaToMySQL();
        String sql = null;
        if (spid !=0) {
            sql = "SELECT name as spname, servicename, typename as servicetypename,price FROM searchservice WHERE spid=" + spid;
        } else {
            sql = "SELECT name as spname, servicename, typename as servicetypename,price FROM searchservice WHERE 1=1";
        }
        if (cartypeid != 0) {
            sql +=  " and cartypeid="+cartypeid ;
        }
        if (servid != 0) {
            sql += " and serviceid="+servid ;
        }
        return jtm.getJSONFromResultSet(jtm.DSelect(sql),"searchservice");
    }

    public static void InsertPicSP(String PathPic, Integer spid) throws SQLException, FileNotFoundException {
        PreparedStatement statement;
        try (InputStream inputStream = new FileInputStream(new File(PathPic))) {
            String sql = "UPDATE sproviders SET pic = (?) WHERE id="+spid;
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


    public static String getServices(String spid) {
        String sql = "SELECT servicetype.id as ServID,servicetype.name as Service,  price " +
                "FROM spservices,  servicetype where serviceid=servicetype.id and spservices.spid="+spid;
        return sql;
    }

    public static void setToken(String spid, String token) {
        JavaToMySQL jmt = new JavaToMySQL();
        String sql = "UPDATE sproviders set token='"+token+"' WHERE id="+spid+";";
        jmt.DbExec(sql);
    }

    public static String getToken(String spid) throws SQLException {
        JavaToMySQL jmt = new JavaToMySQL();
        String sql = "SELECT token FROM sproviders WHERE id="+spid+";";
        String res ="";
        ResultSet rs = jmt.DSelect(sql);
        jmt.DbExec(sql);
        rs.last();
        if (rs.getRow()>0) res=rs.getString("token");
        return res;
    }

    public static void saveXY(String spid, String X, String Y) {
        JavaToMySQL jmt = new JavaToMySQL();
        String sql = "INSERT INTO coordinate (spuser,uid,X,Y) VALUES(1,"+spid+","+X+","+Y+");";
        jmt.DbExec(sql);
    }

    public static void setBusy(String spid) {
        JavaToMySQL jmt = new JavaToMySQL();
        String sql = "UPDATE sproviders set busy=1 WHERE id="+spid+";";
        jmt.DbExec(sql);
    }

    public static String getxy(String spid) throws SQLException {
        JavaToMySQL jtm = new JavaToMySQL();
        String sql = "SELECT X,Y,ltime as SavedTime FROM coordinate WHERE spuser=1 and uid="+spid+" order by ltime desc LIMIT 1;";
        return jtm.getJSONFromResultSet(jtm.DSelect(sql),"lastspcoordinates");
    }

    public static String getBusy(String spid) throws SQLException {
        JavaToMySQL jmt = new JavaToMySQL();
        String sql = "SELECT busy FROM sproviders WHERE id="+spid+";";
        String res ="-1";
        ResultSet rs = jmt.DSelect(sql);
        jmt.DbExec(sql);
        rs.last();
        if (rs.getRow()>0) res=rs.getString("busy");
        return res;
    }

    public static void Logout(String spid) throws SQLException {
        String sql ="UPDATE sproviders set logined=0 where id="+spid;
        JavaToMySQL jtm = new JavaToMySQL();
        jtm.DbExec(sql);
    }

    public static Integer LogedLite(String email, String BNID, String BNIDflag) throws SQLException {
        String sql = null;

        if (BNIDflag.equalsIgnoreCase("0")) {
            sql = "select id from sproviders where trim(email)='" + email + "' and trim(BNID)='"+ BNID+ "';";
        } else {
            sql = "select id from sproviders where trim(email)='" + email + "' and trim(BN)='"+ BNID+ "';";
        }

/*        if (email.isEmpty() && !BNID.isEmpty()) {
            sql = "select id from sproviders where trim(BNID)='"+ BNID+ "';";
        } else {
            if (!email.isEmpty() && BNID.isEmpty()) {
                sql = "select id from sproviders where trim(email)='"+ email+ "';";
            } else {
                sql = "select id from sproviders where trim(email)='" + email + "' and trim(BNID)='"+ BNID+ "';";
            }
        } */
        JavaToMySQL jtm = new JavaToMySQL();
        ResultSet rs = jtm.DSelect(sql);
        rs.last();
        if (rs.getRow()==0) {
            return -1;
        } else {
            Date date = new Date();
            Integer sid = rs.getInt("id");
            sql= "UPDATE sproviders set logined=1, logtime='" + date.toString()+ "' where id=" + sid;
            jtm.DbExec(sql);
            return sid;
        }
    }

    public static Integer Loged(String email, String BNID, String pwd) throws SQLException {
        String crpwd = md5Apache(pwd);
        String sql = "select id,x,y from sproviders where email='" + email + "' and BNID='"+ BNID+"' and password='" + crpwd + "';";
        JavaToMySQL jtm = new JavaToMySQL();
        ResultSet rs = jtm.DSelect(sql);
        rs.last();
        if (rs.getRow()==0) {
            return -1;
        } else return rs.getInt("id");
    }

    public static void addService(String sid, String serviceid, String availibilityid, String profid, String price, String cartype){
        JavaToMySQL jmt = new JavaToMySQL();
        String sql = "DELETE FROM spservices WHERE spid="+sid+" AND serviceid="+serviceid+";";
        jmt.DbExec(sql);
        sql = "INSERT INTO spservices (spid,serviceid,price,availl,prof, cartype) VALUES ("+sid+","+serviceid+","+price+","+
                availibilityid+","+profid+","+cartype+");";
        jmt.DbExec(sql);
    }

    public static void delService(String sid, String serviceid) {
        JavaToMySQL jmt = new JavaToMySQL();
        String sql = "DELETE FROM spservices WHERE spid="+sid+" AND serviceid="+serviceid+";";
        jmt.DbExec(sql);
    }

    public static void SetCarID(Integer uid, Integer brand, Integer model, String carid){
        JavaToMySQL jmt = new JavaToMySQL();
        Integer carbm= brand*10+model;
        String sql = "UPDATE sproviders SET carbm="+carbm+",carid='"+carid+"' WHERE id="+uid;
        jmt.DbExec(sql);
    }

    public static String GetCarID(Integer uid){
        JavaToMySQL jmt = new JavaToMySQL();
        String sql = "SELECT carbm, carid FROM sproviders WHERE id="+uid;
        String res ="";
        ResultSet rs= jmt.DSelect(sql);
        try {
            rs.first();
            Integer brand= rs.getInt(1)/10;
            Integer model= rs.getInt(1) % 10;
            String carid = rs.getString(2).substring(0,2)+"-"+rs.getString(2).substring(2,5)+"-"+rs.getString(2).substring(5);
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
            res= "Car # "+carid+". Brand is "+brandname+". Model is "+modelname;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    public static String getBankDetailsForSP(Integer SpID){
        JavaToMySQL jtm = new JavaToMySQL();
        String sql = "Select Banks.Name as bankname, Banks.Id as bankid,sproviders.bankbranch as branch, sproviders.bankaccount as baccount from Banks, sproviders\n" +
                "where Banks.ID=sproviders.bankid and sproviders.id="+SpID;
        return jtm.getJSONFromResultSet(jtm.DSelect(sql),"banksdetails");
    }

    public static void setBankForSP(Integer SpID, Integer BankID, String branch, String account){
        JavaToMySQL jmt = new JavaToMySQL();
        String sql = "UPDATE sproviders SET bankid="+BankID+",bankbranch='"+branch+"',bankaccount='"+account+"' WHERE id="+SpID+";";
        jmt.DbExec(sql);
    }


    public static Integer Newsp(String name,String address,String email,String pwd, float X, float Y,String desc,
                                String phone, String services, String BNID, String BN,String bank, String branch,
                                String baccount, String token, String carbrand, String carmodel, String carid ) {
        String crpwd = md5Apache(pwd);
        String sql= "INSERT INTO sproviders (logined,name,address,description,email,BNID, BN,password,phone,rating, votes,x,y, point, bankid,bankbranch,bankaccount,token) VALUES(0,'"+name+"','"+address+"','"+desc+"','"+email+"','"+
                BNID+"','"+BN+"','"+crpwd+"','"+phone+"',0,0,"+String.valueOf(X)+","+String.valueOf(Y)+",0,"+bank+",'"+branch+"','"+baccount+"','"+token+"');";
        JavaToMySQL jmt = new JavaToMySQL();
        jmt.DbExec(sql);
        sql = "SELECT max(id) FROM sproviders";
        ResultSet rs= jmt.DSelect(sql);
        try {
            rs.first();
            Integer spid=rs.getInt(1);
            if (!services.equals("&")) {
                String delims = "[*]+";
                String[] tokens = services.split(delims);
                if (tokens.length == 0)System.out.println("Services aren't defined");
                else for (int i=0; i<tokens.length;i=i+5) addService(String.valueOf(spid),tokens[i],tokens[i+1],tokens[i+2],tokens[i+3],tokens[i+4]);  //Service provider, Service
            }
            SetCarID(spid,Integer.valueOf(carbrand),Integer.valueOf(carmodel),carid);
            return spid;                                                                                                               // ID of availiability , ID of professional level, Price, cartype
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //System.out.println(crpwd);
        return -1;
    }

    public void AcceptCall( Integer callid) throws SQLException {
        String sql;
        sql= "UPDATE calls SET status = 2 WHERE callid="+callid+";";
        JavaToMySQL jtm = new JavaToMySQL();
        jtm.DbExec(sql);

        sql ="select sproviders.id as spid ,spservices.price, calls.userid,calls.cdate,calls.details " +
                " from calls, sproviders, spservices where " +
                "calls.spid = sproviders.id  and calls.serviceid=spservices.serviceid " +
                " and spservices.spid= sproviders.id and calls.status=2 and calls.callid ="+callid+";";
        ResultSet rs=jtm.DSelect(sql);
        try {
            rs.first();
            Float price= rs.getFloat("price");
            Integer uid = rs.getInt("userid");
            String det = rs.getString("details");
            rs.close();
            long curTime = System.currentTimeMillis();
            Date dt = new Date(curTime);

            sql= "INSERT INTO payments (userid,spid,pdate,amount,pstatus) VALUES ("+uid+","+this.id+",'"+dt+"',"+price+",1);";
            //System.out.println(sql);
            jtm.DbExec(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        };
    }
    public static void RejectCall( Integer callid) {
        String sql= "UPDATE calls SET status = 3 WHERE callid="+callid+";";
        JavaToMySQL jtm = new JavaToMySQL();
        jtm.DbExec(sql);
    }

    public static String GetNewRequestsSP(Integer spid) {  //List of all requests for SP in Status New
        String sql ="SELECT * FROM Requests WHERE StatusID=1 and SPID="+spid;
        JavaToMySQL jmt = new JavaToMySQL();
        return jmt.getJSONFromResultSet(jmt.DSelect(sql), "NewRequestsSP");
    }

    public static String GetCarList(Integer spid) {
        String sql ="SELECT RequestDate, brand, model,carid,userid FROM CarList WHERE SPID="+spid;
        JavaToMySQL jmt = new JavaToMySQL();
        return jmt.getJSONFromResultSet(jmt.DSelect(sql),"CarList");
    }

    public static void SetSellerID(Integer spid, String sellerid) {
        String sql= "UPDATE sproviders SET sellerid="+sellerid+" WHERE id="+spid+";";
        JavaToMySQL jtm = new JavaToMySQL();
        jtm.DbExec(sql);
    }

    public static String GetSellerID(Integer spid) {
        String sql = "SELECt sellerid FROM sproviders WHERE id="+spid+";";
        String res= "";
        JavaToMySQL jmt = new JavaToMySQL();
        ResultSet rs=jmt.DSelect(sql);
        try {
            if (rs.first()) {
                res=rs.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }
}
