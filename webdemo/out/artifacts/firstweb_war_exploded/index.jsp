<%--
  Created by IntelliJ IDEA.
  User: 10123
  Date: 2017/12/28
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>

<%
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    String dbName="SSIQ";
    String url="jdbc:sqlserver://172.18.72.22:1433;DatabaseName="+dbName;
        Connection conn=DriverManager.getConnection(url,"sa","123456");
//    javax.naming.Context ctx = new javax.naming.InitialContext();
//    javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("java:/comp/env/jdbc/webdb");
//    if(ds==null){
//        out.print("err null");
//    }
//    Connection conn = ds.getConnection();

%>
<%=dbName+"数据库连接成功"%><br>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String newstitle = request.getParameter("newstitle");
    String newcontent = request.getParameter("newscontent");
    if(newstitle!=null){
        String sql="insert into newsinfo (newstitle,newscontent) values(?,?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);       //使用preparedstatement方法来实现与数据库的通信
        pstmt.setString(1,newstitle);       //??这句话是什么意思
        pstmt.setString(2,newcontent);
        pstmt.executeUpdate();
        out.println("已经提交标题为 \""+newstitle+"\" 的新闻\n");
        out.println("内容："+newcontent+"\n");
    }
//    else{
//        String sql = "select * from newsinfo";
//        PreparedStatement pstmt = conn.prepareStatement(sql);
//        pstmt.executeUpdate();
//    }

%>
</body>
</html>
