<%--
  Created by IntelliJ IDEA.
  User: windows
  Date: 2018/1/10
  Time: 8:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="com.microsoft.sqlserver.jdbc.SQLServerDriver"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.*" %>
<%@ page import="sights.MainSight1" %>
<%@ page import="register_log.AccountBean" %>

<%
    MainSight1 XiHu = new MainSight1();
    request.setCharacterEncoding("UTF-8");
    String SightName = request.getParameter("Attractions");
    XiHu.setMainName(SightName);
    //String SightName = "西湖";
    AccountBean account = (AccountBean)session.getAttribute("account");
%>



<html lang = "en" >
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 IE=edge,chrome=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>大景点一览</title>
    <link rel="stylesheet" href="/demo/css/demo.css">
    <link rel="stylesheet" type="text/css" href="/lib/cntl.css">
    <script src="http://cdn.bootcss.com/tinymce/4.4.3/tinymce.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/funnyNewsTicker.css">
    <link rel="stylesheet" type="text/css" href="/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="/css/default.css">
    <link rel="stylesheet" href="/css/liMarquee.css">



    <link href="/css/jquery.searchableSelect.css" rel="stylesheet" type="text/css">
    <script src="/js/jquery-1.11.1.min.js"></script>
    <script src="/js/jquery.searchableSelect.js"></script>

    <style type="text/css">
        /*
    Author: David Qin
    E-mail: david@hereapp.cn
    Date: 2014-11-05
    */

        .searchable-select-hide {
            display: none;
        }

        .searchable-select {
            display: inline-block;
            min-width: 200px;
            font-size: 14px;
            line-height: 1.428571429;
            color: #555;
            vertical-align: middle;
            position: relative;
            outline: none;
            z-index: 20;
        }

        .searchable-select-holder{
            padding: 6px;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            min-height: 30px;
            box-sizing: border-box;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);
            -webkit-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
        }

        .searchable-select-caret {
            position: absolute;
            width: 0;
            height: 0;
            box-sizing: border-box;
            border-color: black transparent transparent transparent;
            top: 0;
            bottom: 0;
            border-style: solid;
            border-width: 5px;
            margin: auto;
            right: 10px;
        }

        .searchable-select-dropdown {
            position: absolute;
            background-color: #fff;
            border: 1px solid #ccc;
            border-bottom-left-radius: 4px;
            border-bottom-right-radius: 4px;
            padding: 4px;
            border-top: none;
            top: 28px;
            left: 0;
            right: 0;
        }

        .searchable-select-input {
            margin-top: 5px;
            border: 1px solid #ccc;
            outline: none;
            padding: 4px;
            width: 100%;
            box-sizing: border-box;
            width: 100%;
        }

        .searchable-scroll {
            margin-top: 4px;
            position: relative;
        }

        .searchable-scroll.has-privious {
            padding-top: 16px;
        }

        .searchable-scroll.has-next {
            padding-bottom: 16px;
        }

        .searchable-has-privious {
            top: 0;
        }

        .searchable-has-next {
            bottom: 0;
        }

        .searchable-has-privious, .searchable-has-next {
            height: 16px;
            left: 0;
            right: 0;
            position: absolute;
            text-align: center;
            z-index: 10;
            background-color: white;
            line-height: 8px;
            cursor: pointer;
        }

        .searchable-select-items {
            max-height: 400px;
            overflow-y: scroll;
            position: relative;
        }

        .searchable-select-items::-webkit-scrollbar {
            display: none;
        }

        .searchable-select-item {
            padding: 5px 5px;
            cursor: pointer;
            min-height: 30px;
            box-sizing: border-box;
            transition: all 1s ease 0s;
        }

        .searchable-select-item.hover {

            background: #555;
            color: white;
        }

        .searchable-select-item.selected {
            background: #28a4c9;
            color: white;
        }</style>

        <script>tinymce.init({ selector:'textarea' });</script>
    <style type="text/css">
        .str_wrap{
            padding-left: 3em;
            padding-right: 3em;
            background: #fefefe;
            height: 10em;
            line-height: 2em;
            font-size: 1.2em;
        }
    </style>
</head>
<body style="background-color:#ececec" >

<%--<%--%>
    <%--Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");--%>
    <%--String url = "jdbc:sqlserver://localhost:1433;DatabaseName=SSIQ";--%>
    <%--Connection conn = DriverManager.getConnection(url, "sa", "123456");--%>

    <%--String sql1 = "SELECT * from ChildSight_info";--%>
    <%--String sql2 = "SELECT * from user_comments";--%>
    <%--String sql3 = "SELECT * from Shopping_info";--%>

    <%--PreparedStatement ps1 = conn.prepareStatement(sql1);--%>
    <%--PreparedStatement ps2 = conn.prepareStatement(sql2);--%>
    <%--PreparedStatement ps3 = conn.prepareStatement(sql3);--%>
    <%--ResultSet rs1 = ps1.executeQuery();--%>
    <%--ResultSet rs2 = ps2.executeQuery();--%>
    <%--ResultSet rs3 = ps3.executeQuery();--%>

    <%--String s[] = new String[13];--%>
    <%--String s1[] = new String[30];--%>
    <%--String s2[] = new String[30];--%>
    <%--String s3[] = new String[10];--%>
    <%--int i = 1;--%>
    <%--int j = 1;--%>
    <%--int k = 1;--%>
    <%--while(rs1.next() && i <= 12) {--%>
        <%--s[i] = rs1.getString("c_Detail");--%>
        <%--i++;--%>
    <%--}--%>
    <%--while(rs2.next() && j <= 30){--%>
        <%--s1[j] = rs2.getString("comCont");--%>
        <%--s2[j] = rs2.getString("userName");--%>
        <%--j++;--%>
    <%--}--%>
    <%--while(rs3.next() && j <= 9){--%>
        <%--s3[k] = rs3.getString("s_Pos");--%>
        <%--k++;--%>
    <%--}--%>
<%--%>--%>
<!-- ===================================
    HEADER
==================================== -->
<header>
    <!-- Navigation Menu start-->

    <nav class="navbar clean-main-menu" role="navigation">
        <div class="container">

            <!-- Navbar Toggle -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <!-- Logo -->
                <a class="navbar-brand" href="/hangzhou1.jsp"><img class="logo" id="logo" src="/images/logo.png" alt="Page"></a>

            </div>
            <!-- Navbar Toggle End -->


        </div>
    </nav>
    <!-- Navigation Menu end-->
</header>

<!-- ===================================
    OFFER SECTION
==================================== -->
<div class="container" id=<%=SightName%>>
    <div class="header">
        <div align="center">
            <p>&nbsp;</p>
            <h1><strong><a href="#"></a><%=SightName%><%=XiHu.getEnglishName()%></strong> </h1>
            <form id="form1" name="form1" method="post" action="">
                <a href="/hangzhou1.jsp"><strong>返回上一级,</strong></a>
                <a>用户：<%=account.getUsername()%>!</a>
                <%--<a href="../../admin/index.html"><strong>后台</strong></a>--%>
            </form>
            <form class="sselect" id="form2" name="form2" method="post" action="/mainsights/mainpage1.jsp">

                景点：
                <label for="Attractions"></label>
                <select name="Attractions" size="1" id="Attractions">
                    <%=XiHu.getBroSights()%>
                </select>
                <script>
                    $(function(){
                        $('select').searchableSelect();
                    });
                </script>
                <input type="submit" name="确定" id="submit2" value="确定" onclick="window.location.reload()"/>
            </form>

        </div>
        <!-- end .header --></div>
    <div id="intro" style="text-align: center;padding-left: 200px;padding-right: 200px;">
        <h2><%=SightName%>简介</h2>
        <p><%=XiHu.getDescribe()%><p>
        <p><%=XiHu.getTicket()%></p>
        <p><b>景区服务电话：</b><%=XiHu.getContact()%></p>
        <p><b>位置：</b><%=XiHu.getPos()%></p>
        <p><b>交通信息：</b><%=XiHu.getTrafficInfo()%></p>
    </div>

    <!--内部景点表格-->
    <tr ><h2 align="center">内部景点</h2></tr>
<section id="offer" class="clean-section-wrapper clean-offer-section  background-two">
    <div class="container">
        <div class="row">
            <div class="wrapper">
                <ul>
                    <%=XiHu.getChildSight()%>
                </ul>
            </div>
            <%--<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>--%>
            <script src="/demo/demo.js"></script>
        </div>
    </div>

</section>

<div class="child_sights" style="padding-left: 250px;width: 1400px;padding: center;padding-right: 250px;" >
    <table border="1" width="100%" align="center">

        <%--<input type="image" name="dudi" id="dudi" src="../../pics/xihu/03.jpeg" />--%>
        <%--<input type="image" name="baidi" id="baidi" src="../../pics/xihu/04.jpeg" />--%>
        <tr><td width=20% align=center>内部景点</td><td width="30%" align="center">实拍图片</td>
            <td width="30%" align="center">描述</td><td width="10%" align="center">旺季门票价格</td>
            <td width="30%" align="center">淡季门票价格</td></tr>
        <%=XiHu.getChildSightTable()%>

    </table>

</div>

<h2>驴友点评</h2>
<!--评论展示区-->
<div >
    <table >
        <thead>
        <tr class="text-c">
            <th width="40">评价内容</th>
        </tr>
        </thead>
        <tbody>
        <%=XiHu.GetComments()%>
        </tbody>
    </table>
</div>


<!--评论区-->
<h1 align="center" style="color:darkseagreen";><br>来分享一下！</h1>
<h2 style="height: 20px"></h2>
<textarea style="color: #000;">去过这个景点了吗？玩得怎么样？谈谈你的想法！</textarea>
<button style="float:right" >提交</button>
<h1 style="height: 40px"></h1>

<!--美食区-->
<div class="jq22-container">
    <header class="jq22-header">
        <h1>美食与购物 <span>一切你想要的</span></h1></h1>
    </header>
    <div class="jq22-content">
        <div class="str1 str_wrap" style="height:200px;">
            <table align="center" border="0" style="width: 1400px;padding-left: 0px;border-left-width: 100px;margin-left: 200px;padding-right: 0px;margin-right: 140px;border-right-width: 20px;">
            <%=XiHu.getShoppingInfo()%>
            </table>
        </div>
    </div>
</div>

<script src="/js/jquery.liMarquee.js"></script>
<script>
    $(window).load(function(){
        $('.str1').liMarquee({
            direction: 'up'
        });
        $('.str2').liMarquee({
            direction: 'down'
        });
    });

</script>

</body>
</html>
