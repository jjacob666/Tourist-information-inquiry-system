package register_log;


import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class JumpToChild extends DBServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        request.setCharacterEncoding("UTF-8");
        if (request.getParameter("Attractions") != null) {

            switch (request.getParameter("Attractions")) {
                case "西湖":
                    response.sendRedirect("mainsights/xianbuyao/xihu/mainpage.jsp"); break;
                case "灵隐寺":
                    response.sendRedirect("/mainsights/lingyinsi/mainpage.jsp"); break;
                    default:
                        response.sendRedirect("/mainsights/xihu/mainpage.jsp");
            }
            return;
        }

        try{
            //调用父类的service方法
            super.service(request, response);

        }catch(Exception e){

        }
    }

}
