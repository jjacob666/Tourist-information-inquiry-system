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

public class MainSight1 extends DBServlet1 {
    public String MainName = new String ();
    public int f_nums=0;

    public void setMainName(String name){
        if(name!=null){
            MainName=name;
            return;
        }
        try{
            getFNums();
        }catch(Exception e){

        }

    }

    protected void getFNums() throws SQLException {
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

    //获取英文名
    public String getEnglishName() throws SQLException{
        super.service();
        try{
            StringBuffer sb = new StringBuffer();
            String sql1="select m_Ename from MainSight_info where m_Cname="+"\'"+MainName+"\'";
            PreparedStatement ps = conn.prepareStatement(sql1);
            ps.execute();
            ResultSet rs1 = ps.getResultSet();
            while (rs1.next()){
                sb.append(rs1.getString("m_Ename"));
            }
            return sb.toString();
        }catch(Exception e){
            return MainName;
        }
    }
    //获取位置
    public String getPos() throws SQLException{
        super.service();
        try{
            StringBuffer sb = new StringBuffer();
            String sql1="select m_pos from MainSight_info where m_Cname="+"\'"+MainName+"\'";
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
    //获取票价
    public String getTicket() throws SQLException{
        super.service();
        try{
            StringBuffer sb = new StringBuffer();
            String sql1="select m_ticketW, m_ticketD from MainSight_info where m_cname="+"\'"+MainName+"\'";
            PreparedStatement ps = conn.prepareStatement(sql1);
            ps.execute();
            ResultSet rs1 = ps.getResultSet();
            String ww=null;
            String dd=null;
            while (rs1.next()){
                ww=rs1.getString("m_ticketW");
                dd=rs1.getString("m_ticketD");

            }
            if(ww==null){
                ww="免费";
            }
            if(dd==null){
                dd="免费";
            }
            sb.append("旺季门票："+ww);
            sb.append(";淡季门票："+dd);
            return sb.toString();
        }catch(Exception e){
            return MainName;
        }
    }

    //获取电话
    public String getContact() throws SQLException{
        super.service();
        try{
            StringBuffer sb = new StringBuffer();
            String sql1="select m_pos from m_tel where m_Cname="+"\'"+MainName+"\'";
            PreparedStatement ps = conn.prepareStatement(sql1);
            ps.execute();
            ResultSet rs1 = ps.getResultSet();
            while (rs1.next()){
                sb.append(rs1.getString("m_tel"));
            }
            return sb.toString();
        }catch(Exception e){
            return MainName;
        }
    }

    //获取交通信息
    public String getTrafficInfo() throws SQLException{
        super.service();
        try{
            StringBuffer sb = new StringBuffer();
            String sql1="select m_Traffic from MainSight_info where m_Cname="+"\'"+MainName+"\'";
            PreparedStatement ps = conn.prepareStatement(sql1);
            ps.execute();
            ResultSet rs1 = ps.getResultSet();
            while (rs1.next()){
                sb.append(rs1.getString("m_Traffic"));
            }
            return sb.toString();
        }catch(Exception e){
            return MainName;
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
            int i=0;
            while(rs2.next()&&i<12){
                sb.append("<li>\n" +
                        "                        <div class='picBox'>\n" +
                        "                            <div class='show'>\n" +
                        "                                <image height='190px' width='190px' src=\'");
                sb.append(rs2.getString("c_pic"));
                sb.append(" \'></image>\n" +
                        "                            </div>\n" +
                        "                            <div class='hide'>\n" +
                        "                                <p>");
                sb.append("");sb.append(rs2.getString("c_cname"));sb.append("</p></div>\n" +
                        "                        </div>\n" +
                        "                    </li>");
                i++;
            }
            return sb.toString();
        }catch(Exception e){
            return e.getMessage().toString();
        }
    }

    public String getChildSightTable() throws SQLException {
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

    public String GetComments() throws SQLException{
        super.service();
        try{
            StringBuffer sb = new StringBuffer();
            String sql1="select * from user_comments where f_nums=\'"+f_nums+"\'";
            PreparedStatement ps = conn.prepareStatement(sql1);
            ps.execute();
            ResultSet rs1 = ps.getResultSet();
            int i=0;
            while(rs1.next()&&i<10) {
                String comNums=rs1.getString("comNums");
                sb.append("<tr>");
                sb.append("<td class=\"text-l\"><div class=\"c-999 f-12\">\n" +
                        "\t\t\t\t\t\t\t<u style=\"cursor:pointer\" class=\"text-primary\">");
                sb.append(rs1.getString("userName"));
                sb.append("</u> <time \" datetime=\"");sb.append(rs1.getString("date_time"));sb.append("\">");
                sb.append(rs1.getString("date_time"));sb.append("</time></div>\n" +
                        "\t\t\t\t\t\t<div>"); sb.append(rs1.getString("conCont"));
                sb.append("</div></td>\n");
                sb.append("</tr>");
                i++;
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

    public String getShoppingInfo() throws SQLException{
        super.service();
        try{
            StringBuffer sb = new StringBuffer();
            String sql1="select * from shopping_info where f_num=\'"+f_nums+"\'";
            PreparedStatement ps = conn.prepareStatement(sql1);
            ps.execute();
            ResultSet rs1 = ps.getResultSet();
            while (rs1.next()){
                sb.append("<tr>");
                sb.append("<td>"+rs1.getString("s_name")+"</td>");
                sb.append("<td>"+rs1.getString("s_class")+"</td>");
                sb.append("<td>"+rs1.getString("s_pos")+"</td>");
                sb.append("<td>人均消费"+rs1.getString("s_Cost")+"元</td>");
                sb.append("</tr>");
            }
            return sb.toString();
        }catch(Exception e){
            return MainName;
        }
    }

//
//    public String getSite() throws SQLException{
//        super.service();
//        try{
//            StringBuffer sb = new StringBuffer();
//            String sql1="select m_detail from MainSight_info where m_Cname="+"\'"+MainName+"\'";
//            PreparedStatement ps = conn.prepareStatement(sql1);
//            ps.execute();
//            ResultSet rs1 = ps.getResultSet();
//            while (rs1.next()){
//                sb.append(rs1.getString("m_pos"));
//
//            }
//            return sb.toString();
//        }catch(Exception e){
//            return MainName;
//        }
//
//    }

    public void JumpToMainSightSite(){

    }


}
