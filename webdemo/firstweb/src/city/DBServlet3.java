package city;

import javax.servlet.http.HttpServlet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBServlet3 extends HttpServlet {
    protected Connection conn = null;  //用于连接数据库的connection对象
    protected ResultSet execSQL(String sql, Object...args) {
        //建立PreparedStatement对象
        try{
            PreparedStatement pStmt = conn.prepareStatement(sql);
            //为pstmt对象设置SQL参数值
            for (int i = 0; i < args.length; i++) {
                pStmt.setObject(i + 1, args[i]);      //设置SQL参数
            }
            pStmt.execute();            //执行SQL语句
            return pStmt.getResultSet();        //返回执行的结果集
        }catch(Exception e){
            return null;
        }

    }
    protected void service()  {
        try {
            //如果conn为空，打开数据库连接
            if(conn==null){
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
