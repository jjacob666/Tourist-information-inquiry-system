<%--
  Created by IntelliJ IDEA.
  User: 10123
  Date: 2018/1/4
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Result</title>
</head>

<body>
结果
<form name="form" action="${requestScope.page}" method="post">
<script>
    if (test="${requestScope.info!=null}"){
        alert('${requestScope.info}');      //显示结果信息
        form.submit();      //提交form
    }

</script>
<!-- 通过提交的方式回到指定的JSP页面  -->
</form>

</body>
</html>
