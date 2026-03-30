<%-- 
    Document   : studentlist
    Created on : 29 Jan 2026, 8:16:11 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String host = System.getenv("DB_HOST");
String port = System.getenv("DB_PORT");
String db   = System.getenv("DB_NAME");  // env variable for online DB
String user = System.getenv("DB_USER");
String pass = System.getenv("DB_PASS");

String url;
if(host == null){ // fallback for local
    url = "jdbc:mysql://localhost:3306/student_db";
    user = "root";
    pass = "spdt";
} else { // online DB
    url = "jdbc:mysql://" + host + ":" + port + "/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
}

Connection con = null;
try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection(url, user, pass);
}catch(Exception e){
    out.println("DB Connection Error: " + e);
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Students | Placement Portal</title>
    <style>
        body{
            margin:0;
            font-family: Arial, sans-serif;
            background:#f5f6fa;
        }

        /* TOP BAR */
        .topbar{
            background:#5c6bc0;
            color:white;
            padding:15px 25px;
            display:flex;
            justify-content:flex-end;
            align-items:center;
            font-size:22px;
            font-weight:bold;
        }

        /* SIDEBAR */
        .sidebar{
            width:220px;
            height:100vh;
            background:#1f1f2e;
            position:fixed;
            top:0;
            left:0;
            padding-top:70px;
        }
        .sidebar a{
            display:block;
            padding:15px;
            color:#ccc;
            text-decoration:none;
        }
        .sidebar a:hover,
        .sidebar a.active{
            background:#2d2d44;
            color:white;
        }

        .content{
            margin-left:240px;
            padding:30px;
            margin-top:20px;
        }

        .card{
            background:white;
            padding:20px;
            border-radius:5px;
        }

        .btn{
            padding:8px 15px;
            border:1px solid #5a66c5;
            background:white;
            cursor:pointer;
            text-decoration:none;
            margin-bottom:10px;
            display:inline-block;
        }

        table{
            width:100%;
            border-collapse:collapse;
            margin-top:20px;
        }
        th, td{
            padding:10px;
            border:1px solid #ccc;
            text-align:left;
        }
        th{
            background:#f4f4f4;
        }
        a.action{
            color:blue;
            text-decoration:none;
        }
    </style>
</head>

<body>

<!-- TOP HEADER -->
<div class="topbar">
    PLACEMENT PORTAL
</div>

<!-- SIDEBAR -->
<div class="sidebar">
    <a href="studentlist.jsp" class="active">STUDENTS</a>
    <a href="companylist.jsp">COMPANIES</a>
    <a href="placedstudents.jsp">PLACED STUDENTS</a>
    <a href="home.jsp">LOGOUT</a>
</div>

<!-- CONTENT -->
<div class="content">
    <a href="addStudent.jsp" class="btn">ADD STUDENT</a>

    <div class="card">
        <h3>STUDENTS</h3>

        <table>
            <tr>
                <th>PRN</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Action</th>
            </tr>

        <%
            PreparedStatement ps = con.prepareStatement("SELECT * FROM student");
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
        %>
            <tr>
                <td>
                    <a href="studentDetails.jsp?prn=<%=rs.getString("prn")%>">
                        <%=rs.getString("prn")%>
                    </a>
                </td>
                <td><%=rs.getString("fname")%></td>
                <td><%=rs.getString("lname")%></td>
                <td><%=rs.getString("email")%></td>
                <td>
                    <a class="action" href="editStudent.jsp?prn=<%=rs.getString("prn")%>">Edit</a> |
                    <a class="action" href="deleteStudent.jsp?prn=<%=rs.getString("prn")%>" 
                       onclick="return confirm('Are you sure?')">Delete</a>
                </td>
            </tr>
        <%
            }
            rs.close();
            ps.close();
            con.close();
        %>

        </table>

    </div>
</div>

</body>
</html>
