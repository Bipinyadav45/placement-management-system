<%-- 
    Document   : deleteCompany
    Created on : 2 Feb 2026, 2:19:29 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String cid = request.getParameter("cid");

Connection con = null;
PreparedStatement ps = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/pms_db",
        "root",
        "spdt"
    );

    ps = con.prepareStatement(
        "DELETE FROM company WHERE cid=?"
    );
    ps.setInt(1, Integer.parseInt(cid));

    ps.executeUpdate();

    // ✅ Redirect after delete
    response.sendRedirect("companylist.jsp");

} catch (Exception e) {
    out.println("Error: " + e);
} finally {
    try {
        if (ps != null) ps.close();
        if (con != null) con.close();
    } catch (Exception e) {
        out.println(e);
    }
}
%>
