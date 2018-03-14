package Manage;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;


public class Admin extends DBServlet2 {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        super.service();
        super.doGet(req, resp);
        resp.setContentType("text");
        req.setCharacterEncoding("UTF-8");
        try{
            if(req.getParameter("del")!=null){
                String com_nums = req.getParameter("del");
                String sql1="delete from user_comments where comNums = "+com_nums;
                PreparedStatement ps = conn.prepareStatement(sql1);
                ps.executeUpdate();
            }
            else if(req.getParameter("delmem")!=null){
                String mem_del = req.getParameter("delmem");
                String sql2="delete from user_info where userName = "+"\'"+mem_del+"\'";
                PreparedStatement psdelmem = conn.prepareStatement(sql2);
                psdelmem.executeUpdate();
            }
        }catch (Exception e){
        }

    }

    public String manage_comments() throws SQLException{

        super.service();
        try{
            StringBuffer sb = new StringBuffer();
            String sql1="select * from user_comments";
            PreparedStatement ps = conn.prepareStatement(sql1);
            ps.execute();
            ResultSet rs1 = ps.getResultSet();
            while(rs1.next()) {
                String comNums=rs1.getString("comNums");
                sb.append("<tr class=\"text-c\">\n" +
                        "\t\t\t\t\t<td><input type=\"checkbox\" value=\"1\" name=\"\"></td>\n" +
                        "\t\t\t\t\t<td>");
                sb.append(rs1.getString("f_Nums"));sb.append("</td>");
                sb.append("\t\t\t\t\t<td><a href=\"javascript:;\"><i >"+rs1.getString("userName")+"</i></a></td>\n");
                sb.append("<td class=\"text-l\"><div class=\"c-999 f-12\">\n" +
                        "\t\t\t\t\t\t\t<u style=\"cursor:pointer\" class=\"text-primary\">");
                sb.append(rs1.getString("userName"));
                sb.append("</u> <time \" datetime=\"");sb.append(rs1.getString("date_time"));sb.append("\">");
                sb.append(rs1.getString("date_time"));sb.append("</time></div>\n" +
                        "\t\t\t\t\t\t<div>"); sb.append(rs1.getString("conCont"));
                        sb.append("</div></td>\n" +"<td class=\"text-l\"><div class=\"c-999 f-12\"><time \" datetime=\"");
                        sb.append(rs1.getString("date_time"));
                        sb.append("\">");sb.append(rs1.getString("date_time"));sb.append("</time><div></td>\n");
                        sb.append("\t\t\t\t\t<td class=\"td-manage\"><a title=\"编辑\" href=\"javascript:;\" " +
                                "onclick=\"member_edit('编辑','member-add.html','4','','510')\" style=\"text-decoration:none\">" +
                                "<i class=\"Hui-iconfont\">&#xe6df;</i></a> <a title=\"删除\" href=\"javascript:comment_delete(this,"+comNums+");" +
                                "\" onclick=\"member_del(this,'1')\" class=\"ml-5\" style=\"text-decoration:none\">" +
                                "<i class=\"Hui-iconfont\">&#xe6e2;</i></a></td>\n" +
                                "\t\t\t\t</tr>");
            }
            return sb.toString();
        }catch(Exception e){
            return e.getMessage().toString();
        }

    }
    public String getMembers(){
        super.service();
        try{
            StringBuffer sb = new StringBuffer();
            String sql2 = "select * from user_info ";
            PreparedStatement pstmt = conn.prepareStatement(sql2);       //使用preparedstatement方法来实现与数据库的通信
            ResultSet rs2 = pstmt.executeQuery();
            while(rs2.next()){
                String username=rs2.getString("UserName");
                sb.append("<tr class=\"text-c\">\n" +
                        "\t\t\t\t<td><input type=\"checkbox\" value=\"1\" name=\"\"></td>\n" +
                        "\t\t\t\t<td><u style=\"cursor:pointer\" class=\"text-primary\" onclick=\"member_show('张三','member-show.html','10001','360','400')\">");
                sb.append(rs2.getString("userName"));sb.append("</u></td>\n" + "\t\t\t\t<td>");
                sb.append(rs2.getString("user_Phone"));
                sb.append("</td><td>");sb.append(rs2.getString("user_Email"));sb.append(" </td><td class=\"td-status\"><span class=\"label label-success radius\">");
                sb.append(rs2.getString("isadmin"));sb.append("</span></td>\n" +
                        "\t\t\t\t<td class=\"td-manage\"><a style=\"text-decoration:none\" onClick=\"member_stop(this,'10001')\" " +
                        "href=\"javascript:;\" title=\"停用\"><i class=\"Hui-iconfont\">&#xe631;</i></a> <a title=\"编辑\"" +
                        " href=\"javascript:;\" onclick=\"member_edit('编辑','member-add.html','4','','510')\"" +
                        " class=\"ml-5\" style=\"text-decoration:none\"><i class=\"Hui-iconfont\">&#xe6df;" +
                        "</i></a> <a style=\"text-decoration:none\" class=\"ml-5\" " +
                        "onClick=\"change_password('修改密码','change-password.html','10001','600','270')\"" +
                        " href=\"javascript:;\" title=\"修改密码\"><i class=\"Hui-iconfont\">&#xe63f;" +
                        "</i></a> <a title=\"删除\" href=\"javascript:member_del(this,\'"+username+"\');\" onclick=\"member_del(this,'1')\" class=\"ml-5\" " +
                        "style=\"text-decoration:none\"><i class=\"Hui-iconfont\">&#xe6e2;</i></a></td>\n" +
                        "\t\t\t</tr>");
                //  pstmt.executeUpdate();
                // ResultSet rs2 = pstmt.getResultSet();
                //ResultSet rs2 = execSQL(sql2, f_nums,i);

            }
            return sb.toString();
        }catch(Exception e){
            return e.getMessage().toString();
        }

    }




}