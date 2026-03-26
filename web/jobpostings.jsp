<%-- 
    Document   : jobpostings
    Created on : 20 Mar 2026, 11:14:07 am
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="until.DBConnection"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Job Postings</title>

<style>
body{
    margin:0;
    font-family: Arial;
    background:#f4f6f9;
}

.sidebar{
    width:220px;
    height:100vh;
    background:#1e2a38;
    color:white;
    position:fixed;
}

.sidebar h2{ padding:20px; }

.sidebar a{
    display:block;
    color:white;
    padding:12px 20px;
    text-decoration:none;
}

.sidebar a:hover{ background:#34495e; }

.main{
    margin-left:220px;
    padding:20px;
}

.top-bar{
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.add-btn{
    background:#007bff;
    color:white;
    padding:8px 15px;
    text-decoration:none;
    border-radius:5px;
}

/* ✅ TABLE FIX */
table{
    width:100%;
    border-collapse:collapse;
    background:white;
    margin-top:20px;
}

th, td{
    padding:12px;
    border-bottom:1px solid #ddd;
    text-align:center;
    vertical-align:middle;   /* FIX */
}

th{ background:#f1f1f1; }

th:nth-child(1){ width:5%; }
th:nth-child(2){ width:25%; }
th:nth-child(3){ width:20%; }
th:nth-child(4){ width:20%; }
th:nth-child(5){ width:10%; }
th:nth-child(6){ width:20%; }

td:nth-child(2),
td:nth-child(3),
td:nth-child(4){
    text-align:left;
}

/* ✅ STATUS CENTER FIX */
td:nth-child(5){
    text-align:center;
}

/* ✅ BUTTON ALIGN FIX */
.btn{
    padding:6px 10px;
    border:none;
    color:white;
    border-radius:4px;
    cursor:pointer;
    display:inline-block;
    margin:2px;
}

td:last-child{
    text-align:center;
    white-space:nowrap;
}

.open{ background:green; }
.closed{ background:gray; }

.edit{ background:#007bff; }
.delete{ background:#dc3545; }

</style>
</head>

<body>

<div class="sidebar">
    <h2>Recruiter</h2>
    <a href="<%= request.getContextPath() %>/recruiter_dashboard.jsp">Dashboard</a>
    <a href="<%= request.getContextPath() %>/jobpostings.jsp">Job Postings</a>
    <a href="home.jsp">Logout</a>
</div>

<div class="main">

    <div class="top-bar">
        <h2>Job Postings</h2>
        <a href="addJob.jsp" class="add-btn">Add Job</a>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Company</th>
            <th>Location</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>

<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {

    con = DBConnection.getConnection();
    ps = con.prepareStatement("SELECT * FROM jobs");
    rs = ps.executeQuery();

    while(rs.next()){
%>

<tr>
    <td><%=rs.getInt("id")%></td>

    <td>
        <%=rs.getString("title")%>
    </td>

    <td><%=rs.getString("company")%></td>
    <td><%=rs.getString("location")%></td>

    <td>
        <%
        String status = rs.getString("status");
        if(status.equalsIgnoreCase("Open")){
        %>
            <button class="btn open">Open</button>
        <%
        } else {
        %>
            <button class="btn closed">Closed</button>
        <%
        }
        %>
    </td>

    <td>
        <a href="editJob.jsp?id=<%=rs.getInt("id")%>" class="btn edit">Edit</a>

        <a href="deleteJob.jsp?id=<%=rs.getInt("id")%>" 
           class="btn delete"
           onclick="return confirm('Are you sure you want to delete this job?');">
           Delete
        </a>
    </td>
</tr>

<%
    }

} catch(Exception e){
    out.println("Error: " + e);
} finally {
    if(rs!=null) rs.close();
    if(ps!=null) ps.close();
    if(con!=null) con.close();
}
%>

    </table>
</div>

</body>
</html>