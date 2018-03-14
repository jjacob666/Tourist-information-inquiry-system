<%--
  Created by IntelliJ IDEA.
  User: 10123
  Date: 2018/1/12
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<body>
<h2>实际应用中XML文件可以放在外部文件中，IE6测试通过</h2>
<xml id="doc">
    <data>
        <province name="广东">
            <city>广州</city>
            <city>深圳</city>
            <city>汕头</city>
        </province>

        <province name="吉林">
            <city>长春</city>
            <city>四平</city>
            <city>吉林</city>
            <city>白城</city>
        </province>

        <province name="河南">
            <city>郑州</city>
            <city>洛阳</city>
            <city>开封</city>
            <city>安阳</city>
        </province>
    </data>
</xml>
<select id=prov onchange="docity()">
    <option value="0">--- 请选择省份 ---</option>
</select>
<select id=city>
</select>

<script language="JavaScript">
    function init(){
        var v1 = doc.getElementsByTagName("province");
        for(var i =0; i<v1.length;i++){
            var e = document.createElement("OPTION");
            e.innerText = e.value = v1[i].getAttribute("name");
            prov.appendChild(e);
        }
    }
    function docity(){
        var sf = prov.value;
        var str="//province[@name='"+sf+"']";
        var v = doc.selectSingleNode(str);
        if(!v){ alert("没有符合条件的记录！");return;}
        city.innerHTML = "";
        var v1 = v.selectNodes("city")
        for(var i =0; i<v1.length;i++){
            var e = document.createElement("OPTION");
            e.innerText = e.value = v1[i].text;
            city.appendChild(e);
        }
    }
    init();
</script>
</body>

</html>
