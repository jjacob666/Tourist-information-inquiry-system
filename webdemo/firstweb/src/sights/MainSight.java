package sights;

import com.microsoft.sqlserver.jdbc.SQLServerDriver;
import register_log.Encrypter;
import sun.applet.Main;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MainSight extends DBServlet1 {
    public String MainName = new String ();
    public int f_nums=0;

    public void setMainName(String name){
       if(name!=null){
           MainName=name;
           return;
       }
    }

    public void getFNums() throws SQLException {
        String sql = "select m_Nums from MainSight_info where m_Cname="+"\'"+MainName+"\'";
        super.service();
        // rs = super.execSQL(sql, new Object[]{MainName});
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        if(rs.next()){
            f_nums = rs.getInt(1);
        }
        else{
        }
    }

    public String getBroSights() throws SQLException{
        super.service();
        try{
            StringBuffer sb = new StringBuffer();
            String sql2 = "select m_Cname from MainSight_info";
            PreparedStatement pstmt = conn.prepareStatement(sql2);       //使用preparedstatement方法来实现与数据库的通信
            ResultSet rs2 = pstmt.executeQuery();
//            sb.append("<option selected=\"selected\">");sb.append(rs2.getString("m_Cname"));sb.append("</option>");
            while(rs2.next()){
                sb.append("<option value=\'"+rs2.getString("m_Cname") +"\' >");sb.append(rs2.getString("m_Cname"));sb.append("</option>");
            }
            return sb.toString();
        }catch(Exception e){
            return e.getMessage().toString();
        }
    }




    public String getChildSight() throws SQLException {
            super.service();
        try{
            StringBuffer sb = new StringBuffer();
            int n=0;
            getFNums();
            String sql1="select count(c_nums) from childSight_info where f_nums="+f_nums;
            //ResultSet rs1 = super.execSQL(sql1,new Object[]{f_nums});
            ResultSet rs1 = conn.prepareStatement(sql1).executeQuery();
            if(rs1.next()){
                 n = rs1.getInt(1);
            }
            else{
                sb.append(f_nums);
            }
            String sql2 = "select c_Cname,c_pic,c_detail,c_ticketW,c_ticketD from childSight_info where f_nums=?";
            PreparedStatement pstmt = conn.prepareStatement(sql2);       //使用preparedstatement方法来实现与数据库的通信
            pstmt.setInt(1,f_nums);
            ResultSet rs2 = pstmt.executeQuery();

            while(rs2.next()){
                sb.append("<tr>");
                sb.append("<td>");sb.append(rs2.getString("c_Cname"));sb.append("</td>");
                sb.append("<td>");sb.append("<img src=\"");sb.append(rs2.getString("c_pic"));
                sb.append("\"/></td>");
                sb.append("<td>");sb.append(rs2.getString("c_detail"));sb.append("</td>");
                sb.append("<td>");sb.append(rs2.getString("c_ticketW"));sb.append("</td>");
                sb.append("<td>");sb.append(rs2.getString("c_ticketD"));sb.append("</td>");
                sb.append("</tr>");
               //  pstmt.executeUpdate();
                // ResultSet rs2 = pstmt.getResultSet();
                //ResultSet rs2 = execSQL(sql2, f_nums,i);

            }
            return sb.toString();
        }catch(Exception e){
            return e.getMessage().toString();
        }
    }

    public String getDescribe() throws SQLException{
        super.service();
        try{
            StringBuffer sb = new StringBuffer();
            String sql1="select m_detail from MainSight_info where m_Cname="+"\'"+MainName+"\'";
            PreparedStatement ps = conn.prepareStatement(sql1);
            ps.execute();
            ResultSet rs1 = ps.getResultSet();
            while (rs1.next()){
                sb.append(rs1.getString("m_detail"));
            }
            return sb.toString();
        }catch(Exception e){
            return MainName;
        }

    }

    public String geiSite() throws SQLException{
        super.service();
        try{
            StringBuffer sb = new StringBuffer();
            String sql1="select m_detail from MainSight_info where m_Cname="+"\'"+MainName+"\'";
            PreparedStatement ps = conn.prepareStatement(sql1);
            ps.execute();
            ResultSet rs1 = ps.getResultSet();
            while (rs1.next()){
                sb.append(rs1.getString("m_pos"));

            }
            return sb.toString();
        }catch(Exception e){
            return MainName;
        }

    }

    public void JumpToMainSightSite(){

    }


}
