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
    <title>Register</title>
</head>
<body>

<form name="register_form" action="/register_log/Register" method="post">
    <span class="require">*</span>用户名：
    <!-- 用户输入框 -->
    <input type="text" id="username" name="username" size="30" maxlength="30"/><br>
    <span class="require">*</span> 密码：</div>
    <input type="password" id="password" name="password" size="30" maxlength="30" /><br>
    <span class="require">*</span> 请再次输入密码：
    <input type="password" id="repassword" name="repassword" size="30" maxlength="30" /><br>
    邮箱地址：
    <input type="text" id="email" name="email" size="30" maxlength="30"/><br>
    <span class="require">*</span>验证码：
    <input type="text" id="validation_code" name="validation_code" style="width:60px;margin-top:20px"
           size="30" maxlength="30"/><br>
    <img id="img_validation_code" src="validation_code"/>
    <input type="button" value="刷新" onclick="refresh()"/><br>
    <input type="button" value="注册" onclick="checkRegister()"/>
    <input type="submit" value="登录" name="login"/>

</form>



<script>
    function checkRegister(){
        var username=document.getElementById("username");
        if(username.value==""){
            alert("必须输入用户名");
            username.focus();
            return;
        }
        var password = document.getElementById("password");
        if(password.value==""){
            alert("必须输入密码！");
            password.focus();
            return;
        }
        var repassword = document.getElementById("repassword");

        if(password.value!=repassword.value){
            alert("输入的密码不一致！");
            repassword.focus();
            return;
        }
        var email=document.getElementById("email");
        if(email.value!=""){
            if(!checkEmail(email)) return;
        }
        var validation_code = document.getElementById("validation_code");
        if(validation_code.value==""){
            alert("验证码必须输入！");
            validation_code.focus();            //将焦点放到validation_code文本框上
            return;
        }
        register_form.submit();     //提交用户注册信息
    }
    function checkEmail(email){
        var email = email.value;
        var pattern= /^([a-zA-Z0-9._-])+@([a-zA-z0-9_-])+(\.[a-zA-z0-9_-])+/;
        flag=pattern.test(email);
        if(!flag){
            alert("email()格式不正确");
            email.focus();
            return false;
        }
        return true;
    }
</script>

</body>
</html>
