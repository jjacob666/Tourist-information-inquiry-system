package register_log;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.*;

public class DBServlet extends HttpServlet {
    protected Connection conn = null;  //用于连接数据库的connection对象
    protected java.sql.ResultSet execSQL(String sql, Object...args) throws  Exception {
        //建立PreparedStatement对象
        PreparedStatement pStmt = conn.prepareStatement(sql);
        //为pstmt对象设置SQL参数值
        for (int i = 0; i < args.length; i++) {
            pStmt.setObject(i + 1, args[i]);      //设置SQL参数
        }
        pStmt.execute();            //执行SQL语句
        return pStmt.getResultSet();        //返回执行的结果集
    }
    protected boolean checkValidationCode(HttpServletRequest request, String validationCode) {
        //获取系统随机生成的验证码
        String validationCodeSession = (String) request.getSession().getAttribute("validation_code");
        if (validationCodeSession == null) {
            //设置result.jsp需要的结果信息
            request.setAttribute("info", "验证码过期");
            //设置login.jsp需要的错误信息
            request.setAttribute("codeError", "y验证码不正确");
            return false;
        }
        if (!validationCode.equalsIgnoreCase(validationCodeSession)) {
            //设置result.jsp需要的结果信息
            request.setAttribute("info", "验证码不正确");
            //设置login.jsp需要的错误信息
            request.setAttribute("codeError", "y验证码不正确");
            return false;
        }
        return true;
    }
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        try {
            //如果conn为空，打开数据库连接
            if (conn == null) {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String url="jdbc:sqlserver://localhost:1433;DatabaseName=SSIQ";
                conn=DriverManager.getConnection(url,"sa","123456");
            }
        } catch (Exception e) {
        }
    }
        public void destory(){
            try{
                if(conn!=null){
                    conn.close();
                }
        }
        catch(Exception e){
        }

        }
}
