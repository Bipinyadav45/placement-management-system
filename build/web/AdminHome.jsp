<%-- 
    Document   : AdminHome
    Created on : 28 Jan 2026, 3:21:20 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,java.sql.*" %>

<%
    if(session==null || session.getAttribute("admin")==null){
        response.sendRedirect("adminlogin.jsp");
    }

    int studentCount = 0;
    int companyCount = 0;
    int placedCount = 0;

    try{

        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/pms_db","root","spdt");

        Statement stmt = con.createStatement();

        ResultSet rs1 = stmt.executeQuery("SELECT COUNT(*) FROM student");
        if(rs1.next()){
            studentCount = rs1.getInt(1);
        }

        ResultSet rs2 = stmt.executeQuery("SELECT COUNT(*) FROM company");
        if(rs2.next()){
            companyCount = rs2.getInt(1);
        }

        ResultSet rs3 = stmt.executeQuery("SELECT COUNT(*) FROM student WHERE status='Placed'");
        if(rs3.next()){
            placedCount = rs3.getInt(1);
        }

    }catch(Exception e){
        out.println(e);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body{ margin:0; font-family:Arial; background:#f4f6f8; }
        .header{ background:#3f51b5; color:white; padding:15px; font-size:22px; text-align:right; }
        .sidebar{ width:220px; height:100vh; background:#263238; position:fixed; top:0; left:0; color:white; padding-top:60px; }
        .sidebar a{ display:block; color:white; padding:15px; text-decoration:none; }
        .sidebar a:hover{ background:#37474f; }
        .content{ margin-left:240px; padding:40px; display:flex; gap:20px; }
        .card{ background:white; padding:30px; flex:1; text-align:center; box-shadow:0 0 10px #ccc; }
    </style>
</head>

<body>

<div class="header">PLACEMENT PORTAL</div>

<div class="sidebar">
    <a href="AdminHome.jsp">Home</a>
    <a href="studentlist.jsp">Students</a>
    <a href="companylist.jsp">Companies</a>
    <a href="placedstudents.jsp">Placed Students</a>
    <a href="home.jsp">Logout</a>
</div>

<div class="content">

    <div class="card">
        <h3>No. of Students</h3>
        <h2><%=studentCount%></h2>
    </div>

    <div class="card">
        <h3>No. of Companies</h3>
        <h2><%=companyCount%></h2>
    </div>

    <div class="card">
        <h3>No. of Placed Students</h3>
        <h2><%=placedCount%></h2>
    </div>

</div>

</body>
</html> 