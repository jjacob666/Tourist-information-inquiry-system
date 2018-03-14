<%--
  Created by IntelliJ IDEA.
  User: 10123
  Date: 2018/1/4
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form name="login_form" action="/register_log/Login" method="post">
        用户名：
        <input type="text" id="username" value="${requestScope.username}" class="input_list" name="username"
               size="30" maxlength="30"/>
        <font color="#FF0000">${requestScope.userError}</font><br>
        密 码：
        <input type="password" id="password" class="input_list" name="password" size="30" maxlength="30"/>
        <font color="#FF0000">${requestScope.passwordError}</font><br>
        验证码：
        <input type="text" id="validation_code" name="validation_code" style="width:60px;margin-top:2px"
               size="30" maxlength="30"/><br>
        <img id="img_validation_code" src="validation_code"/>
        <input type="button" value="刷新" onclick="refresh()"/>
        <font color="#FF0000">${requestScope.codeError}</font><br>
        <input type="button" value="登录" name="login" onclick="checkLogin()"/>
        <input type="submit" value="注册" name="register"/>
    </form>
    <script>
    function checkLogin(){
        var username = document.getElementById("username");
        if(username.value==""){
            alert("请输入账号");
            username.focus();
            return;
        }
        var password = document.getElementById("password");
        if(password.value==""){
            alert("请输入密码");
            password.focus();
            return;
        }
        var validation_code = document.getElementById("validation_code");
        if(validation_code.value==""){
            alert("请输入验证码");
            validation_code.focus();
            return;
        }

        login_form.submit();
    }
    </script>

</body>
</html>
