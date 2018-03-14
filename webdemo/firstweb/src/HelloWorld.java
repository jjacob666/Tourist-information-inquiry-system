import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@WebServlet("/HelloWorld")
public class HelloWorld extends HttpServlet{
    private String message;

    @Override
    public void init()throws ServletException{
        message="Hello world, this message is from servlet!";
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        resp.setContentType("text/html");

        PrintWriter out = resp.getWriter();
        out.println("<h1>" +message + "</h1>");
    }

    @Override
    public void destroy(){
        super.destroy();
    }
}