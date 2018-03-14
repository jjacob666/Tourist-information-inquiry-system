<%--
  Created by IntelliJ IDEA.
  User: 10123
  Date: 2017/12/28
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>addnews</title>
</head>
<body>
    <form action="index.jsp" method="post">
        标题：<input type="text" name="newstitle" size="20"><br>
        内容：<textarea name="newscontent" cols="30" rows="5"></textarea><br>
        <input type="submit" value="提交" name="button" id="button"/>
    </form>
</body>
</html>
