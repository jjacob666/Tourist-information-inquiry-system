package city;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;

public class City extends DBServlet3{

    public String MainName = new String ();
    public String m_cityNum;
    public String pro_name;
    public String pro_destnation;

//    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//        if(request.getParameter("submit") !=null){
//            response.sendRedirect("/hangzhou.jsp");
//            return;
//        }
//        try{
//            //调用父类的service方法
//            super.service(request, response);
//            //获得username的请求参数
//            response.setContentType("text");
//            request.setCharacterEncoding("UTF-8");
//            if(request.getParameter("province")!=null){
//                HttpSession session = request.getSession();
//                session.setAttribute("province",request.getParameter("province"));
//                pro_destnation = request.getParameter("province");
//            }
//        }catch(Exception e){
//
//
//        }
//
//    }

    public void setMainName(String name){
        try{
            if(name!=null){
                MainName=name;
                getCNums();
                getproname();
            }
        }catch (Exception e){

        }


    }

    protected void getCNums() throws SQLException {
        try{
            String sql = "select c_num from city_info where c_name="+"\'"+MainName+"\'";
            super.service();
            // rs = super.execSQL(sql, new Object[]{MainName});
            ResultSet rs = conn.prepareStatement(sql).executeQuery();
            if(rs.next()){
                m_cityNum = rs.getString("c_num");
            }
            else{
                m_cityNum="xixi";
            }
        }catch (Exception e){
            m_cityNum=e.getMessage().toString();
        }

    }


    protected void getproname() throws SQLException {
        String sql = "select c_province from city_info where c_name="+"\'"+MainName+"\'";
        super.service();
        // rs = super.execSQL(sql, new Object[]{MainName});
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        if(rs.next()){
            pro_name = rs.getString("c_province");
        }
        else{
        }
    }

    public String getDescribe() throws SQLException{
        super.service();
        try{
            StringBuffer sb = new StringBuffer();
            String sql1="select cinformation from city_info where c_name="+"\'"+MainName+"\'";
            PreparedStatement ps = conn.prepareStatement(sql1);
            ps.execute();
            ResultSet rs1 = ps.getResultSet();
            while (rs1.next()){
                sb.append(rs1.getString("cinformation"));
            }
            return sb.toString();
        }catch(Exception e){
            return MainName;
        }

    }



//    public String getAllCities() throws SQLException {
//        super.service();
//        try{
//
//            StringBuffer sb = new StringBuffer();
//            String sql2 = "select c_name from city_info ";
//            PreparedStatement pstmt = conn.prepareStatement(sql2);       //使用preparedstatement方法来实现与数据库的通信
//            ResultSet rs2 = pstmt.executeQuery();
////            sb.append("<option selected=\"selected\">");sb.append(rs2.getString("m_Cname"));sb.append("</option>");
//            while(rs2.next()){
//                sb.append("<option value=\'"+rs2.getString("c_name") +"\' >");sb.append(rs2.getString("c_name"));sb.append("</option>");
//            }
//            return sb.toString();
//        }catch(Exception e){
//            return e.getMessage().toString();
//        }
//    }

    public String getmainsights() throws SQLException {
        super.service();
        try{
            StringBuffer sb = new StringBuffer();
            String sql2 = "select m_Cname from MainSight_info where m_cityNum="+"\'"+m_cityNum+"\'";
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

    public String getBroPros() throws SQLException {
        super.service();
        try{
            StringBuffer sb = new StringBuffer();
            String sql2 = "select distinct c_province from city_info ";
            PreparedStatement pstmt = conn.prepareStatement(sql2);       //使用preparedstatement方法来实现与数据库的通信
            ResultSet rs2 = pstmt.executeQuery();
//            sb.append("<option selected=\"selected\">");sb.append(rs2.getString("m_Cname"));sb.append("</option>");
            while(rs2.next()){
                sb.append("<option value=\'"+rs2.getString("c_province") +"\' >");sb.append(rs2.getString("c_province"));sb.append("</option>");
            }
            return sb.toString();
        }catch(Exception e){
            return e.getMessage().toString();
        }
    }

    public String getDesChildCities() throws SQLException {
        super.service();
        try{

            StringBuffer sb = new StringBuffer();
            String sql2 = "select c_name from city_info where c_province="+"\'"+pro_destnation+"\'";
            PreparedStatement pstmt = conn.prepareStatement(sql2);       //使用preparedstatement方法来实现与数据库的通信
            ResultSet rs2 = pstmt.executeQuery();
//            sb.append("<option selected=\"selected\">");sb.append(rs2.getString("m_Cname"));sb.append("</option>");
            while(rs2.next()){
                sb.append("<option value=\'"+rs2.getString("c_name") +"\' >");sb.append(rs2.getString("c_name"));sb.append("</option>");
            }
            return sb.toString();
        }catch(Exception e){
            return e.getMessage().toString();
        }
    }



}
