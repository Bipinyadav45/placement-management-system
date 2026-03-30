<%-- 
    Document   : updateStudent
    Created on : 30 Jan 2026, 9:23:42 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String prn = request.getParameter("prn");
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String email = request.getParameter("email");

Connection con = null;
PreparedStatement ps = null;

try{
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
        url = "jdbc:mysql://localhost:3306/student_db";
        user = "root";
        pass = "spdt";
    } else { // Online deploy
        url = "jdbc:mysql://" + host + ":" + port + "/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
    }

    con = DriverManager.getConnection(url, user, pass);

    ps = con.prepareStatement(
        "UPDATE student SET fname=?, lname=?, email=? WHERE prn=?"
    );

    ps.setString(1, fname);
    ps.setString(2, lname);
    ps.setString(3, email);
    ps.setString(4, prn);

    ps.executeUpdate();

    // ✅ Redirect after successful update
    response.sendRedirect("studentlist.jsp");

} catch(Exception e){
    out.println("Error: " + e);
} finally {
    try{ if(ps != null) ps.close(); } catch(Exception e){}
    try{ if(con != null) con.close(); } catch(Exception e){}
}
%>
