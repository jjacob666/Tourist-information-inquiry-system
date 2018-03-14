package register_log;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.*;

public class traffic extends DBServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(request.getParameter("submit") !=null){
            response.sendRedirect("/hangzhou.jsp");
            return;
        }
        String t_pos="";
        StringBuffer str= new StringBuffer();
        try{
            //调用父类的service方法
            super.service(request, response);
            //获得username的请求参数
            response.setContentType("text");
            request.setCharacterEncoding("UTF-8");
            t_pos = request.getParameter("q");
          //  t_pos = new String(t_pos.getBytes("ISO-8859-1"),"UTF-8");
            // if(!checkValidationCode(request, validationCode)){
            //    return;
            // }
            String sql= "select trainC,airC,selfC from traffic_info where t_pos="+"\'"+t_pos+"\'";
            ResultSet rs = conn.prepareStatement(sql).executeQuery();
            //ResultSet rs= execSQL(sql,new Object[] {t_pos});
            if(rs.next()==false){
                request.setAttribute("userError", t_pos + "不存在");
            }
            else{
                str.append("<table border=\"1\" align=\"center\" ><tr><td>");
                str.append("火车票（元）</td><td>");str.append(rs.getString(1).trim());
                str.append("</td></tr><tr><td>");
                str.append("机票（元）</td><td>");str.append(rs.getString(2).trim());
                str.append("</td></tr><tr><td>");
                str.append("自驾游(元)</td><td>");str.append(rs.getString(3).trim());
                str.append("</td></tr></table>");
            }
        }catch(Exception e){
            str.append("<table>");
           str.append("数据库失败".trim());
            str.append("</table>");

        }
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.write(str.toString());
        //request.getRequestDispatcher("../mainsights/xihu/test.jsp").forward(request, response);
        out.flush();
        out.close();
    }
}
