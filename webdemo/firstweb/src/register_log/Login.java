package register_log;

import city.City;
import register_log.DBServlet;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;


public class Login extends DBServlet {
    String userName = new String();

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("register") != null) {
            response.sendRedirect("/register1.jsp");
            return;
        }
        String page = "/login1.jsp";
        try {
            //调用父类的service方法
            super.service(request, response);
            userName = request.getParameter("username");
            //获得username的请求参数

            String password = request.getParameter("password");
            String validationCode = request.getParameter("validation_code");
            if (userName == null || password == null || validationCode == null) return;
            if (userName.equals("") || password.equals("") || validationCode.equals("")) return;
            userName = new String(userName.getBytes("ISO-8859-1"), "UTF-8");
            // if(!checkValidationCode(request, validationCode)){
            //    return;
            // }
            String sql = "select * from user_info where userName=?";
            ResultSet rs = execSQL(sql, new Object[]{userName});
            if (rs.next() == false) {
                request.setAttribute("userError", userName + "不存在");
                request.setAttribute("username", userName);
                RequestDispatcher rd = request.getRequestDispatcher(page);
                rd.forward(request, response);
            } else {
                String passwordMD5 = Encrypter.md5Encrypt(password);
                if (!rs.getString("user_Psw").equals(passwordMD5)) {
                    request.setAttribute("passwordError", "密码不正确");
                    request.setAttribute("username", userName);
                    RequestDispatcher rd = request.getRequestDispatcher(page);
                    rd.forward(request, response);
                } else {
                    AccountBean account = new AccountBean();
                    account.setPassword(passwordMD5);
                    account.setUsername(userName);
                    HttpSession session = request.getSession();
                    session.setAttribute("account",account);

                    if (rs.getInt("isadmin") == 1) {
                        page = "/admin/index.html";
                        response.sendRedirect(page);
                    }
                    else {
//                        if(CityName==null){
                        page = ("/hangzhou1.jsp");
                        session.setAttribute("Cities", "杭州市");
                        response.sendRedirect(page);
                    }
                }
            }
        } catch (Exception e) {
        }
    }
}



