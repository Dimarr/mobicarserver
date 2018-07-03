package Objects;

/**
 * Created by SBT-Rumyantsev-DK on 08.09.2016.
 */

import DBMain.JavaToMySQL;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

    /*public static void updatesp(int id) {
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
    }*/

    public static void archivecalls(Integer period) throws SQLException {
        String sql="{ call archivecalls(?) }";
        JavaToMySQL jtm = new JavaToMySQL();
        try {
            CallableStatement stmt;
            jtm.openCon();
            stmt = jtm.con.prepareCall(sql);
            stmt.setInt(1, period);
            stmt.executeQuery();
            stmt.close();
            jtm.CloseCon();
        }
        catch (SQLException e) {
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

    public static void InsertPicSP(String spid,String PathPic) throws SQLException {
        /*PreparedStatement statement;
        //try (InputStream inputStream = new FileInputStream(new File(PathPic)))
        InputStream inputStream = null;
        try {
            inputStream = new ByteArrayInputStream(PicStr.getBytes(StandardCharsets.UTF_8.name()));
            String sql = "UPDATE sproviders SET pic = (?) WHERE id="+spid;
            JavaToMySQL jmt = new JavaToMySQL();
            jmt.openCon();
            statement = jmt.con.prepareStatement(sql);
            statement.setBlob(1, inputStream);
            statement.executeUpdate();
            jmt.CloseCon();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }*/
        String sql = "UPDATE sproviders SET pic = '"+PathPic.trim()+"' WHERE id="+spid;
        //System.out.println(sql);
        JavaToMySQL jmt = new JavaToMySQL();
        jmt.DbExec(sql);
    }

    public static String getAllLocations() {
        JavaToMySQL jtm = new JavaToMySQL();
        String sql = "SELECT OptionID as LocationID,Optionname as LocationName FROM pointcatalog WHERE OptionID<20";
        return jtm.getJSONFromResultSet(jtm.DSelect(sql),"Locations");
    }

    public static String getAllServices() {
        JavaToMySQL jtm = new JavaToMySQL();
        String sql = "SELECT ID as ServiceID,Name as ServiceName FROM servicetype;";
        return jtm.getJSONFromResultSet(jtm.DSelect(sql),"AllServices");
    }

    public static String getSubService(String sid) {
        JavaToMySQL jtm = new JavaToMySQL();
        String sql = "SELECT cartype.ID as SubServiceID,cartype.typeName as SubServiceName FROM servicetype,cartype " +
                "WHERE servicetype.regular=cartype.regular and servicetype.id="+sid+";";
        return jtm.getJSONFromResultSet(jtm.DSelect(sql),"SubServices");
    }

    public static String getServices(String spid) {
        String sql = "SELECT servicetype.id as ServID,servicetype.name as Service,  cartype.typename as SubServiceName, " +
                "cartype.id as subserviceid, spservices.availl as locationid, price "+
        "FROM spservices,  servicetype, cartype WHERE serviceid=servicetype.id AND spservices.cartype=cartype.id " +
        "AND spservices.spid="+spid;
        JavaToMySQL jtm = new JavaToMySQL();
        return jtm.getJSONFromResultSet(jtm.DSelect(sql),"SP_SubServices");
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
        String sql = "DELETE FROM coordinate WHERE spuser=1 AND uid="+spid+";";
        jmt.DbExec(sql);
        sql = "INSERT INTO coordinate (spuser,uid,X,Y) VALUES(1,"+spid+","+X+","+Y+");";
        jmt.DbExec(sql);
    }

    public static void setBusy(String spid) {
        JavaToMySQL jmt = new JavaToMySQL();
        String sql = "UPDATE sproviders set busy=1 WHERE id="+spid+";";
        jmt.DbExec(sql);
    }

    public static void setAvailable(String spid) {
        JavaToMySQL jmt = new JavaToMySQL();
        String sql = "UPDATE sproviders set busy=0 WHERE id="+spid+";";
        jmt.DbExec(sql);
    }

    public static void setFirebaseToken(String spid, String fbtoken) {
        JavaToMySQL jmt = new JavaToMySQL();
        String sql = "UPDATE sproviders set firebasetoken='"+fbtoken+"' WHERE id="+spid+";";
        jmt.DbExec(sql);
    }

    public static String getFirebaseToken(String spid) {
        JavaToMySQL jmt = new JavaToMySQL();
        String sql = "SELECT firebasetoken FROM sproviders WHERE id="+spid+";";
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

    public static String getxy(String spid) throws SQLException {
        JavaToMySQL jtm = new JavaToMySQL();
        String sql = "SELECT X,Y,ltime as SavedTime FROM coordinate WHERE spuser=1 and uid="+spid+" order by ltime desc LIMIT 1;";
        return jtm.getJSONFromResultSet(jtm.DSelect(sql),"lastspcoordinates");
    }

    public static String getstaticxy(String spid) throws SQLException {
        JavaToMySQL jtm = new JavaToMySQL();
        String sql = "SELECT X,Y FROM sproviders WHERE id="+spid;
        return jtm.getJSONFromResultSet(jtm.DSelect(sql),"staticspcoordinates");
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

    public static String onlineStatus(String spid,String newstatus) throws SQLException {
        String sql ="SELECT logined FROM sproviders where id="+spid;
        JavaToMySQL jmt = new JavaToMySQL();
        String res ="-1";
        if (newstatus.isEmpty()) {
            ResultSet rs = jmt.DSelect(sql);
            jmt.DbExec(sql);
            rs.last();
            if (rs.getRow() > 0) res = rs.getString("logined").trim();
        } else {
            sql = "UPDATE sproviders SET logined="+newstatus+" WHERE id="+spid;
            jmt.DbExec(sql);
            res=newstatus;
        }
        return res;
    }

    public static void Logout(String spid) throws SQLException {
        String sql ="UPDATE sproviders set logined=0 where id="+spid;
        JavaToMySQL jtm = new JavaToMySQL();
        jtm.DbExec(sql);
    }

    public static Integer LogedLite(String email, String BNID, String BNIDflag) throws SQLException {
        String sql = "select id from sproviders where ";

        if (email.contains("@")) sql+= "trim(email)='";
        else sql += "trim(phone)='";

        sql+=email;

        if  (!BNIDflag.equalsIgnoreCase("2")) {
            if (BNIDflag.equalsIgnoreCase("0")) {
                sql += "' and trim(BNID)='" + BNID;
            } else {
                sql += "' and trim(BN)='" + BNID;
            }
        }
        sql+="';";
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

    public static void setphone(Integer spid, String phone) {
        String sql = "UPDATE sproviders SET phone='"+phone+"' WHERE id="+spid+";";
        JavaToMySQL jmt = new JavaToMySQL();
        jmt.DbExec(sql);
    }

    public static String getphone(Integer spid) {
        String sql = "SELECT phone FROM sproviders WHERE id="+spid;
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

    public static String GetToken(String spid) {
        JavaToMySQL jmt = new JavaToMySQL();
        String sql = "SELECT token FROM sproviders WHERE id="+spid+";";
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

    public static String GetTransID() {
        JavaToMySQL jmt = new JavaToMySQL();
        String sql = "SELECT max(payid)+1 FROM payments";
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

    public static Integer Verifypincode(String spid, String pincode) {
        JavaToMySQL jmt = new JavaToMySQL();
        String sql = "SELECT count(*) FROM sproviders WHERE id="+spid+" AND password='"+Crypt.md5Apache(pincode)+"';";
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

    public static void setFinalDataPayment(String trid,String paiddate,String finalamount, String callid) {
        Integer call=0;
        String sql ="UPDATE payments SET pstatus=2,callid="+callid+",pdate='"+paiddate+"',amount="+Float.valueOf(finalamount)/100+" WHERE payid="+trid;
        JavaToMySQL jtm = new JavaToMySQL();
        jtm.DbExec(sql);

        sql = "UPDATE calls SET status=11 WHERE callid="+callid;
        jtm.DbExec(sql);
    }

    public static void Setpincode(String spid, String pincode) {
        String sql ="UPDATE sproviders SET password='"+Crypt.md5Apache(pincode)+"' WHERE id="+spid;
        JavaToMySQL jtm = new JavaToMySQL();
        jtm.DbExec(sql);
    }

    public static void SetToken(String spid, String token) {
        String sql ="UPDATE sproviders SET token='"+token+"' WHERE id="+spid;
        JavaToMySQL jtm = new JavaToMySQL();
        jtm.DbExec(sql);
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

    public static void addService(String sid, String serviceid, String location, String profid, String price, String cartype){
        JavaToMySQL jmt = new JavaToMySQL();
        String sql;
/*        if (Integer.valueOf(cartype) == 0) {
            sql = "DELETE FROM spservices WHERE spid="+sid+" AND serviceid="+serviceid+";";
        } else { */
            sql = "DELETE FROM spservices WHERE spid=" + sid + " AND serviceid=" + serviceid + " AND cartype=" + cartype + ";";
        //}
        jmt.DbExec(sql);
        sql = "INSERT INTO spservices (spid,serviceid,price,availl,prof, cartype) VALUES ("+sid+","+serviceid+","+price+","+
                location+","+profid+","+cartype+");";
        jmt.DbExec(sql);
    }

    public static void delService(String sid, String serviceid) {
        JavaToMySQL jmt = new JavaToMySQL();
        String sql = "DELETE FROM spservices WHERE spid="+sid+" AND serviceid="+serviceid+";";
        jmt.DbExec(sql);
    }

    public static void SetCarID(String spid, Integer brand, Integer model, String carid, String sppic){
        JavaToMySQL jmt = new JavaToMySQL();
        Integer carbm= brand*100+model;
        String sql = "UPDATE sproviders SET carbm="+carbm+",carid='"+carid+"',pic='"+sppic.trim()+"' WHERE id="+spid;
        jmt.DbExec(sql);
    }

    public static String RealCoords(String spid, String uid) throws SQLException {
        JavaToMySQL jtm = new JavaToMySQL();
        String spx ="0";
        String spy ="0";
        String userx ="0";
        String usery ="0";

        String sql = "SELECT X,Y FROM coordinate WHERE spuser=1 and uid="+spid+" order by ltime desc LIMIT 1;";
        ResultSet rs= jtm.DSelect(sql);
        if (rs.first()) {
            spx = rs.getString(1).trim();
            spy = rs.getString(2).trim();
        } else {
            rs.close();
            sql= "SELECT X,Y from sproviders WHERE id="+spid;
            rs= jtm.DSelect(sql);
            if (rs.first()) {
                spx = (rs.getString(1) == null) ? "0" : rs.getString(1).trim();
                spy = (rs.getString(2) == null) ? "0" : rs.getString(2).trim();
            }
        }
        rs.close();

        sql = "SELECT X,Y FROM coordinate WHERE spuser=2 and uid="+uid+" order by ltime desc LIMIT 1;";
        rs= jtm.DSelect(sql);
        if (rs.first()) {
            userx = rs.getString(1).trim();
            usery = rs.getString(2).trim();
        } else {
            rs.close();
            sql= "SELECT X,Y from users WHERE userid="+uid;
            rs= jtm.DSelect(sql);
            if (rs.first()) {
                userx = (rs.getString(1) == null) ? "0" : rs.getString(1).trim();
                usery = (rs.getString(2) == null) ? "0" : rs.getString(2).trim();
            }
        }
        rs.close();

        return "{\"Realcoords\":[{\"SP_X\":\""+spx+"\",\"SP_Y\":\""+spy+"\",\"User_X\":\""+userx+"\",\"User_Y\":\""+usery+"\"}]}";
    }

    public static String GetCarID(Integer uid){
        JavaToMySQL jmt = new JavaToMySQL();
        String sql = "SELECT carbm, carid FROM sproviders WHERE id="+uid;
        String res ="";
        ResultSet rs= jmt.DSelect(sql);
        try {
            rs.first();
            Integer brand= rs.getInt(1)/100;
            Integer model= rs.getInt(1) % 100;
            String carid = rs.getString(2).trim();
                    //rs.getString(2).substring(0,2)+"-"+rs.getString(2).substring(2,5)+"-"+rs.getString(2).substring(5);
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
            //res= "Car # "+carid+". Brand is "+brandname+". Model is "+modelname;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    public static String getBankDetailsForSP(Integer SpID){
        JavaToMySQL jtm = new JavaToMySQL();
        String sql = "SELECT Banks.Name as bankname, Banks.Id as bankid,sproviders.bankbranch as branch, sproviders.bankaccount as baccount " +
                "FROM Banks, sproviders " +
                "WHERE Banks.ID=sproviders.bankid and sproviders.id="+SpID;
        return jtm.getJSONFromResultSet(jtm.DSelect(sql),"banksdetails");
    }

    public static void setBankForSP(Integer SpID, Integer BankID, String branch, String account){
        JavaToMySQL jmt = new JavaToMySQL();
        String sql = "UPDATE sproviders SET bankid="+BankID+",bankbranch='"+branch+"',bankaccount='"+account+"' WHERE id="+SpID+";";
        jmt.DbExec(sql);
    }

    public static void setStaticXY(String SpID, String X, String Y){
        JavaToMySQL jmt = new JavaToMySQL();
        String sql = "UPDATE sproviders SET X="+X+",Y="+Y+" WHERE id="+SpID+";";
        jmt.DbExec(sql);
    }

    public static String Newsplite(String name,String email,String phone,  String BNID, String BN ) {
        String sql= "INSERT INTO sproviders (logined,name,email,BNID, BN,phone) VALUES(0,'"+name+"','"+email+"','"+
                BNID+"','"+BN+"','"+phone+"');";
        JavaToMySQL jmt = new JavaToMySQL();
        jmt.DbExec(sql);
        sql = "SELECT max(id) FROM sproviders";
        ResultSet rs= jmt.DSelect(sql);
        try {
            rs.first();
            Integer spid = rs.getInt(1);
            return String.valueOf(spid);                                                                                                               // ID of availiability , ID of professional level, Price, cartype
        } catch (SQLException e) {
            e.printStackTrace();
        }
    //System.out.println(crpwd);
    return "-1";
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
            SetCarID(String.valueOf(spid),Integer.valueOf(carbrand),Integer.valueOf(carmodel),carid,"");
            return spid;                                                                                                               // ID of availiability , ID of professional level, Price, cartype
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //System.out.println(crpwd);
        return -1;
    }

    public static void AskPaymentCall( String spid) throws SQLException {
        String sql;
        sql= "UPDATE calls SET status = 4 WHERE status=2 AND spid="+spid+";";
        JavaToMySQL jtm = new JavaToMySQL();
        jtm.DbExec(sql);
        setAvailable(spid);
    }

    public static void AcceptCall( String spid) throws SQLException {
        String sql;
        sql= "UPDATE calls SET status = 2 WHERE status=1 AND spid="+spid+";";
        JavaToMySQL jtm = new JavaToMySQL();
        jtm.DbExec(sql);
        /*sql ="select sproviders.id as spid ,spservices.price, calls.userid,calls.cdate,calls.details " +
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
        };*/
    }

    public static void RejectCall( String spid, String reasonReject) {
        String reason = reasonReject.trim().equals("1") ? ("Rejected by SP"):("Rejected by timer");
        String sql= "UPDATE calls SET status = 3,details='"+reason+"' WHERE status<3 AND spid="+spid+";";
        JavaToMySQL jtm = new JavaToMySQL();
        jtm.DbExec(sql);
        setAvailable(spid);
    }

    public static void CancelCall( String spid) {
        String sql= "UPDATE calls SET status = 6 WHERE status=2 AND spid="+spid+";"; //Cancelled by SP Approved request
        JavaToMySQL jtm = new JavaToMySQL();
        jtm.DbExec(sql);
        setAvailable(spid);
    }

    public static String StatusCall( String spid) {
        String sql ="SELECT userid, statusname, serviceid, servicetype.name as servicename FROM calls,callstatus,servicetype" +
                " WHERE calls.status=callstatus.statusid AND servicetype.id=calls.serviceid " +
                //"AND callstatus.statusid<3 AND calls.spid="+spid;  // Just for Accepted or New
                "AND calls.spid="+spid+" ORDER BY calls.callid DESC;";  // For all
        JavaToMySQL jmt = new JavaToMySQL();
        return jmt.getJSONFromResultSet(jmt.DSelect(sql), "SpStatusRequest");
    }

    public static String GetCarList(Integer spid) {
        String sql ="SELECT RequestDate, brand, model,carid,userid FROM CarList WHERE SPID="+spid;
        JavaToMySQL jmt = new JavaToMySQL();
        return jmt.getJSONFromResultSet(jmt.DSelect(sql),"CarList");
    }

    public static void SetSellerID(Integer spid, String sellerid, String paymesecret, String paymeid) {
        String sql= "UPDATE sproviders SET sellerid="+sellerid+",payme_secret='"+paymesecret+"',payme_id='"+paymeid+"' WHERE id="+spid+";";
        JavaToMySQL jtm = new JavaToMySQL();
        jtm.DbExec(sql);
    }

    public static String GetSellerID(String spid) {
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

    public static Integer getAmountSale(String paymesale) {
        String sql = "SELECt amount FROM payments WHERE paymetrid='"+paymesale+"';";
        Integer res = 0;
        JavaToMySQL jmt = new JavaToMySQL();
        ResultSet rs=jmt.DSelect(sql);
        try {
            if (rs.first()) {
                res=rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    public static void setPaymeApprovement(String spid) {
        String sql = "UPDATE sproviders SET paymeapprove=1 WHERE id="+spid;
        JavaToMySQL jmt = new JavaToMySQL();
        jmt.DbExec(sql);
    }

    public static String GetSellerPaymeID(String spid) {
        String sql = "SELECt payme_id FROM sproviders WHERE id="+spid+";";
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
