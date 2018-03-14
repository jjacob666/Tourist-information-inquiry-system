<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="sights.MainSight" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<style type="text/css">
body {
	font: 100%/1.4 Verdana, Arial, Helvetica, sans-serif;
	background-color: #42413C;
	margin: 0;
	padding: 0;
	color: #000;
	background-image: url(../../../pics/xihu/xihu001.jpg);
}
/*输入框风格*/

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
	margin-top: 0px;	 /* 删除上边距可以解决边距会超出其包含的 div 的问题。剩余的下边距可以使 div 与后面的任何元素保持一定距离。 */
	padding-right: 15px;
	padding-left: 15px; /* 向 div 内的元素侧边（而不是 div 自身）添加填充可避免使用任何方框模型数学。此外，也可将具有侧边填充的嵌套 div 用作替代方法。 */
	font-family: "微软雅黑";
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
	font-size: 100%;
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
	font-family: "微软雅黑";
	font-variant: normal;
	text-transform: capitalize;
}
.header div p a {
	font-size: 24%;
}
.header div p a {
	font-size: 100%;
}
.header div p strong {
	font-family: "微软雅黑";
	font-size: larger;
	font-style: normal;
	line-height: normal;
}
.container .content #form3 p {
	font-size: 18%;
}
.container .content #form3 p {
	font-size: 36%;
}
.container .content #form3 p {
	font-size: 50px;
}
.container .content #form3 p {
	font-size: 40px;
}
.container .content #form3 p {
	font-size: 20px;
}
.container .content #form3 p {
	font-size: 15px;
	font-family: "微软雅黑";
}
body,td,th {
	color: #666;
}
-->
</style></head>
<%
    MainSight XiHu = new MainSight();
    String SightName = "西湖";
%>
<body style="position: relative;">


<div class="container" id=<%=SightName%>>>
  <div class="header">
    <div align="center">
      <p>&nbsp;</p>
      <h1><strong><a href="#"></a><%=SightName%>></strong> </h1>
      <form id="form1" name="form1" method="post" action="">
          <a href="/hangzhou.jsp"><strong>杭州概况</strong></a>
        <a href="#"><strong>点评</strong></a>
        <a href="../../../admin/index.html"><strong>后台</strong></a>
      </form>
      <form id="form2" name="form2" method="post" action="/register_log/JumpToChild">
        <p>选择目的地：
          <select name="destination" size="1" id="destination">
            <option>杭州</option>
          </select>
        景点：
        <label for="Attractions"></label>
        <select name="Attractions" size="1" id="Attractions">
          <option selected="selected">西湖</option>
          <option>灵隐寺</option>
        </select>
            <input type="submit" name="确定" id="submit2" value="确定"/>
        </p>
      </form>

          <form id="form0" name="form0" action="" method="post" >
              <p>景点搜索：
                  <label for="find"></label>
                  <input type="text" name="find" id="find" />
                  <input type="submit" name="submit0" id="submit0" value="提交" />
              </p>
          </form>

    </div> 
    <!-- end .header --></div>
  <div class="content">

      <p>
          <img  name="001.jps" id="001.jps"  src="../../../pics/xihu/xihu001.jpg" />
      </p>
        <p>

         <p name="detil" rows="18" readonly="readonly" id="detil"><%=XiHu.getDescribe(SightName)%></p>
         </p>

      <p>电话： 123456</p>
      <p>所在地区：西湖区 </p>

        <!--内部景点-->
        <div class="child_sights">
            <table border="1" width="60%" align="center">
                <tr ><h2 align="center">内部景点</h2></tr>
            <%--<input type="image" name="dudi" id="dudi" src="../../pics/xihu/03.jpeg" />--%>
            <%--<input type="image" name="baidi" id="baidi" src="../../pics/xihu/04.jpeg" />--%>

                <tr><td width=20% align=center>内部景点</td><td width="30%" align="center">实拍图片</td>
                    <td width="30%" align="center">描述</td><td width="30%" align="center">旺季门票价格</td>
                    <td width="30%" align="center">淡季门票价格</td></tr>
                <%=XiHu.getChildSight(SightName)%>

            </table>

        </div>


      <div class="transport">
          <!-- 交通费用 -->
          <h2 align="center">交通</h2>
          <p align="center">选择出发地：
              <select name="tpos" id="pos" onchange="POS(this.value)" style="font-family:Verdana, Arial, Helvetica, sans-serif;">
                  <option value="上海">上海</option>
                  <option value="苏州">苏州</option>
              </select>
              <br>
          <div id="txtHint">费用信息将显示在这...</div>
      </div>

      <!--周边购物-->
      <div class="shopping">
          <h2 align="center">周边购物</h2>
              <p align="center">
                  <textarea name="traffic2" cols="45" rows="3" readonly="readonly" id="traffic2">
                      饭店：
                      餐厅：
                      购物街：
                  </textarea>
              </p>
      </div>

      <!--游玩路线-->
      <div class="tour_routine">
              <h2 align="center">游玩路线</h2>
              <p align="center">游玩场景：
                  <label for="play"></label>
                  <select name="play" id="play">
                      <option>西湖→白堤→断桥</option>
                      <option>白堤→西湖→断桥</option>
                  </select>
              </p>
              <p align="center">路线介绍：</p>
              <p align="center">
                  <textarea name="traffic3" cols="45" rows="3" readonly="readonly" >xxxxx</textarea>
              </p>

      </div>

      <!--游客比例-->
      <div class="proportion">
              <h2 align="center">游客比例</h2>
              <p align="center">
                  <textarea name="traffic3" cols="45" rows="3" readonly="readonly" >xxxxx</textarea>
              </p>
      </div>



  </div>
</div>

</body>

<script>
	function selectOnchang(Departure){
 		//获取被选中的option标签选项 
		alert(Departure.selectedIndex);
	}
	
	function selectOnchang(Departure){  
 		var value = obj.options[Departure.selectedIndex].value;
 		alert(value);
}
	
</script>
<!--交通费用ajax-->
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


</html>