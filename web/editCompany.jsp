<%-- 
    Document   : editCompany
    Created on : 1 Feb 2026, 4:03:32 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
String cid = request.getParameter("cid");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/pms_db","root","spdt");

    ps = con.prepareStatement("SELECT * FROM company WHERE cid=?");
    ps.setString(1, cid);
    rs = ps.executeQuery();

    if (rs.next()) {
%>

<h2>Edit Company</h2>

<form action="updateCompany.jsp" method="post">

    <!-- Hidden ID -->
    <input type="hidden" name="cid" value="<%=rs.getInt("cid")%>">

    Company Name:
    <input type="text" name="companyName"
           value="<%=rs.getString("cname")%>"><br><br>

    Role:
    <input type="text" name="jobRole"
           value="<%=rs.getString("role")%>"><br><br>

    Package:
    <input type="text" name="package"
           value="<%=rs.getString("package")%>"><br><br>

    Criteria:
    <input type="text" name="criteria"
           value="<%=rs.getString("criteria")%>"><br><br>

    <input type="submit" value="Update Company">
</form>

<%
    }
} catch (Exception e) {
    out.println(e);
} finally {
    try {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    } catch (Exception e) {
        out.println(e);
    }
}
%>
