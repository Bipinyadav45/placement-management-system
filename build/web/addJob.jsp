<%-- 
    Document   : addJob
    Created on : 20 Mar 2026, 2:36:08 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="until.DBConnection"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Job</title>

<style>
body{
    font-family: Arial;
    background:linear-gradient(135deg, #e3f2fd, #ffffff);
}

/* ✅ Improved container */
.container{
    width:350px;
    margin:80px auto;
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0 4px 15px rgba(0,0,0,0.1);
}

/* Heading center */
.container h2{
    text-align:center;
    margin-bottom:20px;
}

/* Inputs + select */
input, textarea, select{
    width:100%;
    padding:10px;
    margin:10px 0;
    border:1px solid #ccc;
    border-radius:6px;
    font-size:14px;
    outline:none;
    transition:0.3s;
}

/* Focus effect */
input:focus, textarea:focus, select:focus{
    border-color:#007bff;
    box-shadow:0 0 5px rgba(0,123,255,0.3);
}

/* Button */
button{
    padding:10px;
    background:#007bff;
    color:white;
    border:none;
    width:100%;
    border-radius:6px;
    font-size:15px;
    cursor:pointer;
    transition:0.3s;
}

/* Hover effect */
button:hover{
    background:#0056b3;
}
</style>
</head>

<body>

<div class="container">
    <h2>Add Job</h2>

    <form method="post">
        <input type="text" name="title" placeholder="Job Title" required>
        <input type="text" name="company" placeholder="Company" required>
        <input type="text" name="location" placeholder="Location" required>

        <select name="status">
            <option value="Open">Open</option>
            <option value="Closed">Closed</option>
        </select>

        <button type="submit">Add Job</button>
    </form>

<%
if(request.getMethod().equalsIgnoreCase("POST")){

    String title = request.getParameter("title");
    String company = request.getParameter("company");
    String location = request.getParameter("location");
    String status = request.getParameter("status");

    Connection con = null;
    PreparedStatement ps = null;

    try{
        con = DBConnection.getConnection();

        String query = "INSERT INTO jobs(title, company, location, status) VALUES(?,?,?,?)";
        ps = con.prepareStatement(query);

        ps.setString(1, title);
        ps.setString(2, company);
        ps.setString(3, location);
        ps.setString(4, status);

        int i = ps.executeUpdate();

        if(i > 0){
            out.println("<p style='color:green; text-align:center;'>Job Added Successfully ✅</p>");
        }

    } catch(Exception e){
        out.println("Error: " + e);
    } finally{
        if(ps!=null) ps.close();
        if(con!=null) con.close();
    }
}
%>

</div>

</body>
</html>