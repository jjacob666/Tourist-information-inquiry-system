<%--
  Created by IntelliJ IDEA.
  User: 10123
  Date: 2018/1/4
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  import="java.sql.*" errorPage="" %>%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>Title</title>

<style type="text/css">
<!--
body {
	font: 100%/1.4 Verdana, Arial, Helvetica, sans-serif;
	background-color: #42413C;
	margin: 0;
	padding: 0;
	color: #000;
	background-image: url(/pics/register_background.jpg);
}

/*文本框*/
input{
    border: 1px solid #ccc;
    padding: 7px 0px;
    border-radius: 3px;
    padding-left:5px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
}
input:focus{
    border-color: #66afe9;
    outline: 0;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
}

/* ~~ 元素/标签选择器 ~~ */
ul, ol, dl { /* 由于浏览器之间的差异，最佳做法是在列表中将填充和边距都设置为零。为了保持一致，您可以在此处指定需要的数值，也可以在列表所包含的列表项（LI、DT 和 DD）中指定需要的数值。请注意，除非编写一个更为具体的选择器，否则您在此处进行的设置将会层叠到 .nav 列表。 */
	padding: 0;
	margin: 0;
}
h1, h2, h3, h4, h5, h6, p {
	margin-top: 0;	 /* 删除上边距可以解决边距会超出其包含的 div 的问题。剩余的下边距可以使 div 与后面的任何元素保持一定距离。 */
	padding-right: 15px;
	padding-left: 15px; /* 向 div 内的元素侧边（而不是 div 自身）添加填充可避免使用任何方框模型数学。此外，也可将具有侧边填充的嵌套 div 用作替代方法。 */
}
a img { /* 此选择器将删除某些浏览器中显示在图像周围的默认蓝色边框（当该图像包含在链接中时） */
	border: none;
}
/* ~~ 站点链接的样式必须保持此顺序，包括用于创建悬停效果的选择器组在内。 ~~ */
a:link {
	color: #42413C;
	text-decoration: underline; /* 除非将链接设置成极为独特的外观样式，否则最好提供下划线，以便可从视觉上快速识别 */
}
a:visited {
	color: #6E6C64;
	text-decoration: underline;
}
a:hover, a:active, a:focus { /* 此组选择器将为键盘导航者提供与鼠标使用者相同的悬停体验。 */
	text-decoration: line-through;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 36%;
}

/* ~~ 此固定宽度容器包含其它 div ~~ */
.container {
	width: 960px;
	background-color: #FFF;
	margin: 0 auto; /* 侧边的自动值与宽度结合使用，可以将布局居中对齐 */
}

/* ~~ 标题未指定宽度。它将扩展到布局的完整宽度。标题包含一个图像占位符，该占位符应替换为您自己的链接徽标 ~~ */
.header {
	background-color: #ADB96E;
}

/* ~~ 这是布局信息。 ~~ 

1) 填充只会放置于 div 的顶部和/或底部。此 div 中的元素侧边会有填充。这样，您可以避免使用任何“方框模型数学”。请注意，如果向 div 自身添加任何侧边填充或边框，这些侧边填充或边框将与您定义的宽度相加，得出 *总计* 宽度。您也可以选择删除 div 中的元素的填充，并在该元素中另外放置一个没有任何宽度但具有设计所需填充的 div。

*/

.content {
	padding: 10px 0;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	text-align: center;
	background-color: #FFF;
	background-attachment: scroll;
	background-position: center center;
	border-top-color: #D6D6D6;
}

/* ~~ 脚注 ~~ */
.footer {
	padding: 10px 0;
	background-color: #CCC49F;
}

/* ~~ 其它浮动/清除类 ~~ */
.fltrt {  /* 此类可用于在页面中使元素向右浮动。浮动元素必须位于其在页面上的相邻元素之前。 */
	float: right;
	margin-left: 8px;
}
.fltlft { /* 此类可用于在页面中使元素向左浮动。浮动元素必须位于其在页面上的相邻元素之前。 */
	float: left;
	margin-right: 8px;
}
.clearfloat { /* 如果从 #container 中删除或移出了 #footer，则可以将此类放置在 <br /> 或空 div 中，作为 #container 内最后一个浮动 div 之后的最终元素 */
	clear:both;
	height:0;
	font-size: 1px;
	line-height: 0px;
}
.container .header a #Insert_logo {
	font-family: 微软雅黑;
}
.container .header a #Insert_logo {
	font-family: Lucida Console, Monaco, monospace;
}
.header div a {
	font-family: 微软雅黑;
}
-->
</style></head>


<body style="position: relative;">

<div class="container" style="width:560px" >
    <div class="jiemian" style="width:560px;margin-top:100px">
    <div class="header">
        <div align="center">
            <p>&nbsp;</p>
            <h1><strong><a href="#"><img src="/pics/system_icon.png" alt="在此处插入徽标" name="Insert_logo" width="102" height="98" id="Insert_logo" style="background-color: #ADB96E; display: marker; padding-left: 15px; padding-right: 15px;" /></a>旅游信息查询平台</strong></h1>
            <p><a href="#"><strong>用户登录</strong></a></p>
        </div>
        <div class="content">

<form name="login_form" action="/register_log/Login" method="post">
    <div><span style="display:inline-block;width:95px;text-align:center;">
        <span class="require">*</span>用户名：</span>
<input type="text" id="username" value="${requestScope.username}" class="input_list" name="username" size="30" maxlength="30"/>
        <font color="#FF0000">${requestScope.userError}</font><br>
        <span style="display:inline-block;width:95px;text-align:center;">
            <span class="require">*</span> 密 码：</span>
          <input type="password" id="password" class="input_list" name="password" size="30" maxlength="30"/>
        <font color="#FF0000">${requestScope.passwordError}</font><br>
        <span style="display:inline-block;width:95px;text-align:center;">
            <span class="require">*</span> 验证码：</span>
          <input type="text" id="validation_code" name="validation_code" style="width:60px;margin-top:2px"
               size="30" maxlength="30"/>
<img id="img_validation_code" src="/register_log/ValidationCode"/>
<input type="button" value="刷新" onClick="refresh()"/><br>
        <font color="#FF0000">${requestScope.codeError}</font><br>
<input type="button" value="登录" name="login" onClick="checkLogin()"/>
<input type="submit" value="注册" name="register"/>
  </div>
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
        </div>
    </div>
    </div>
</div>
</body>
</html>
