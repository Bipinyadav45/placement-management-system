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

    // ==========================
    // Dynamic DB connection
    // ==========================
    String host = System.getenv("DB_HOST");
    String port = System.getenv("DB_PORT");
    String db   = System.getenv("DB_NAME");
    String user = System.getenv("DB_USER");
    String pass = System.getenv("DB_PASS");

    String url;
    if(host == null){ // Local fallback
        url = "jdbc:mysql://localhost:3306/pms_db";
        user = "root";
        pass = "spdt";
    } else { // Online deploy
        url = "jdbc:mysql://" + host + ":" + port + "/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
    }

    con = DriverManager.getConnection(url, user, pass);

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
} finally {
    try{ if(ps != null) ps.close(); } catch(Exception e){}
    try{ if(con != null) con.close(); } catch(Exception e){}
}
%>