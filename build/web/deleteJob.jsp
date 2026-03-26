<%-- 
    Document   : deleteJob
    Created on : 20 Mar 2026, 3:49:18 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="until.DBConnection"%>

<%
String id = request.getParameter("id");
if(id != null){
    try{
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("DELETE FROM jobs WHERE id=?");
        ps.setInt(1, Integer.parseInt(id));
        ps.executeUpdate();
        con.close();
        response.sendRedirect("jobpostings.jsp");
    }catch(Exception e){ out.println(e); }
}else{
    out.println("Job ID missing!");
}
%>