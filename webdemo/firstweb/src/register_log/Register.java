package register_log;
import register_log.DBServlet;
import register_log.Encrypter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;

public class Register extends DBServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String userName = null;
        if(request.getParameter("login")!=null){
            response.sendRedirect("/login1.jsp");
            return;
        }
        try{
            //调用DBServlet的service()方法
            super.service(request, response);       //检查是否连接数据库，如果没有，就连接数据库
            userName = request.getParameter("username");
            String password = request.getParameter("password");
            String email=request.getParameter("email");
            String validationCode = request.getParameter("validation_code");

            if(userName==null|| password==null||validationCode==null){
                return;
            }
            if(userName.equals("")|| password.equals("")||validationCode.equals("")){
                return;
            }
            //进行编码转换，以支持中文名
            userName = new String(userName.getBytes("ISO-8859-1"),"UTF-8");
            //在result.jsp中要跳转到register.jsp页面
            request.setAttribute("page","/register1.jsp");
            //核对验证码
            if(!checkValidationCode(request, validationCode)){
                return;
            }
            email = (email==null)?"":email;
            //用MD5加密算法将密码字符加密
            String passwordMD5 = Encrypter.md5Encrypt(password);
            //定义插入记录的SQL语句
            String sql = "insert into user_info(userName, user_Psw, user_email) values (?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);       //使用preparedstatement方法来实现与数据库的通信
            pstmt.setString(1,userName);
            pstmt.setString(2,passwordMD5);
            pstmt.setString(3,email);
            pstmt.executeUpdate();
            //执行SQL语句
           // execSQL(sql, userName, passwordMD5, email);
            request.setAttribute("info","用户注册成功！");

        }
        catch(Exception e){
            System.out.println(e.getMessage());
            request.setAttribute("info", userName+"已经被使用！");

        }
        finally {
            //转发到result.jsp
            RequestDispatcher rd = request.getRequestDispatcher("/result.jsp");
            rd.forward(request, response);
        }
    }

}
