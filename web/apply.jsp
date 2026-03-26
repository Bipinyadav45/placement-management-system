<%-- 
    Document   : apply
    Created on : 4 Feb 2026, 8:12:46 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String company = request.getParameter("company");
    String role = request.getParameter("role");

    String email = "student@gmail.com"; // abhi static, baad me session se aayega

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/applied_db","root","spdt");

        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO applied_companies(student_email, company_name, role, apply_date) VALUES (?,?,?,CURDATE())"
        );
        ps.setString(1, email);
        ps.setString(2, company);
        ps.setString(3, role);
        ps.executeUpdate();

    }catch(Exception e){
        out.println(e);
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
