<%-- 
    Document   : apply
    Created on : 4 Feb 2026, 8:12:46 pm
    Author     : defaultuser0
--%>

<%@page import="configConnection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String company = request.getParameter("company");
String role = request.getParameter("role");

String email = "student@gmail.com"; // session se aayega baad me

try{
    Class.forName("com.mysql.cj.jdbc.Driver");

    // ✅ New line
    Connection con = DBConnection.getConnection();

    PreparedStatement ps = con.prepareStatement(
        "INSERT INTO applied_jobs (company, role, email) VALUES (?, ?, ?)"
    );
    ps.setString(1, company);
    ps.setString(2, role);
    ps.setString(3, email);

    ps.executeUpdate();
    con.close();

} catch(Exception e){
    e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Apply Success</title>
    <style>
        body{
            font-family: Arial;
            background:#f5f6fa;
            text-align:center;
            padding-top:100px;
        }
        .box{
            background:white;
            width:400px;
            margin:auto;
            padding:30px;
            border-radius:5px;
            box-shadow:0 0 10px #ccc;
        }
        a{
            display:inline-block;
            margin-top:20px;
            text-decoration:none;
            color:white;
            background:#4b6cb7;
            padding:10px 20px;
            border-radius:4px;
        }
    </style>
</head>
<body>

<div class="box">
    <h2>Application Submitted ✅</h2>
    <p>You have successfully applied for this company.</p>
    <a href="newCompanies.jsp">Back to Companies</a>
</div>

</body>
</html>
