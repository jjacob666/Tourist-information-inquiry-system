<%--
  Created by IntelliJ IDEA.
  User: 10123
  Date: 2018/1/7
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<mce:script src="lib/jquery-1.5.2.js" mce_src="lib/jquery-1.5.2.js" type="text/javascript"></mce:script>

<html>
<head>
    <title>Test</title>
</head>
<body>
<select name="traffic_info" id="traffic_info" onchange="test()">

    <option value="a" selected>a</option>
    <option value="b">b</option>
    <option value="c">c</option>
</select>

<div id="a" style="display: block">div1</div>
<div id="b" style="display: none">div2</div>
<div id="c" style="display: block">div3</div>



<script type="text/javascript">
    function test(){
        document.getElementById('a').style.display='block';
        document.getElementById('b').style.display='none';
        document.getElementById('c').style.display='block';
        var value=document.getElementById('select').value;
        document.getElementById(value).style.display='block';
    }

</script>


</body>
</html>
