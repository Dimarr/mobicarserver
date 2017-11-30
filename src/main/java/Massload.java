import DBMain.JavaToMySQL;
import Objects.Serviceprovider;
import au.com.bytecode.opencsv.CSVReader;

import java.io.FileReader;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by 2016 on 09.09.2017.
 */
public class Massload {
    public static void main(String[] args) throws IOException {
        String[] row = null;
        String csvFilename = "e:\\Mobi\\TEST.csv";
        Integer carbrand = 0;
        Integer carmodel = 0;
        Integer spid = 0;

        CSVReader csvReader;
        List content;
        csvReader = new CSVReader(new FileReader(csvFilename),';');
        content = csvReader.readAll();
        Integer headerflag = 0;
        for (Object object : content) {
            if (headerflag > 0) {
                row = (String[]) object;
                carbrand = carbrandid(row[11]);
                carmodel = carmodelid(carbrand,row[12]);
                spid = Serviceprovider.Newsp(row[0],row[1],row[3],"",0,0,row[4],row[2],"&",
                        row[5],row[6],row[7],row[8],row[9],"",String.valueOf(carbrand),String.valueOf(carmodel),row[10]);
                if (spid>-1) {
                    System.out.println("SP #"+spid+" was created successfully");
                } else {
                    System.out.println("SP "+row[0]+" wasn't created");                }
            } else headerflag =1;
        }
        csvReader.close();
    }
  public static Integer carbrandid(String brname) {
      Integer res = 0;
      JavaToMySQL jmt = new JavaToMySQL();
      String sql = "SELECT id FROM carbrand WHERE name LIKE '"+brname+"'";
      ResultSet rs = jmt.DSelect(sql);
      try {
          rs.last();
          if (rs.getRow()>0) {
              res=rs.getInt("id");
          } else {
              rs.close();
              sql = "INSERT INTO carbrand (name) VALUES ('"+brname+"')";
              jmt.DbExec(sql);
              sql = "select max(id) from carbrand";
              rs = jmt.DSelect(sql);
              rs.first();
              res = rs.getInt(1);
          }
          rs.close();
      } catch (SQLException e) {
          e.printStackTrace();
      }
      return res;
  }
    public static Integer carmodelid(Integer brandid,String carmodel) {
        Integer res = 0;
        JavaToMySQL jmt = new JavaToMySQL();
        String sql = "SELECT id FROM carmodel WHERE brandid="+brandid+" AND name LIKE '"+carmodel+"'";
        ResultSet rs = jmt.DSelect(sql);
        try {
            rs.last();
            if (rs.getRow()>0) {
                res=rs.getInt("id");
            } else {
                rs.close();
                sql = "INSERT INTO carmodel (brandid,name) VALUES ("+brandid+",'"+carmodel+"')";
                jmt.DbExec(sql);
                sql = "select max(id) from carmodel";
                rs = jmt.DSelect(sql);
                rs.first();
                res = rs.getInt(1);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }
}