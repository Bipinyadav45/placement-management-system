<%-- 
    Document   : updateCompany
    Created on : 1 Feb 2026, 4:08:15 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
int cid = Integer.parseInt(request.getParameter("cid"));
String cname = request.getParameter("cname");
String role = request.getParameter("role");
String pkg = request.getParameter("package");
String criteria = request.getParameter("criteria");

Connection con = null;
PreparedStatement ps = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/pms_db","root","spdt");

    ps = con.prepareStatement(
        "UPDATE company SET cname=?, role=?, package=?, criteria=? WHERE cid=?"
    );

    ps.setString(1, cname);
    ps.setString(2, role);
    ps.setString(3, pkg);
    ps.setString(4, criteria);
    ps.setInt(5, cid);

    ps.executeUpdate();

    // ✅ Redirect after successful update
    response.sendRedirect("companylist.jsp");

} catch (Exception e) {
    out.println("Error: " + e);
}
%>
