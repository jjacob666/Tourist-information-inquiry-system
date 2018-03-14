<%--
  Created by IntelliJ IDEA.
  User: 10123
  Date: 2018/1/8
  Time: 0:33
  To change this template use File | Settings | File Templates.
--%>g
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<script type="text/javascript" >
    var xmlHttp;
    function POS(str){
        if(str==""){
            document.getElementById("txtHint").innerText="";
            return;
        }
        if(window.ActiveXObject){
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        else if(window.XMLHttpRequest){
            xmlHttp=new XMLHttpRequest();
        }
        xmlHttp.onreadystatechange=function(){
            if(xmlHttp.readyState==4){
                if(xmlHttp.status==200){
                    document.getElementById("txtHint").innerHTML=xmlHttp.responseText;
                }
                else {
                    document.getElementById("txtHint").innerHTML = xmlHttp.status;
                }
            }
            else {
                document.getElementById("txtHint").innerHTML=xmlHttp.readyState;
            }
        }
        xmlHttp.open("GET", "/register_log/traffic?q="+str,true);
        xmlHttp.send();

    }
</script>

<form action="/register_log/traffic">
    <select name="tpos" id="pos" onchange="POS(this.value)" style="font-family:Verdana, Arial, Helvetica, sans-serif;">
        <option value="上海">上海</option>
        <option value="苏州">苏州</option>
    </select>
    <input type="submit" value="提交" name="submit"/>
</form>
<br>
<div id="txtHint">费用信息将显示在这...</div>
<div id="submited">提交的内容</div>
</body>
</html>
