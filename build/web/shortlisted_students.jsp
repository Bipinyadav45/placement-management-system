<%-- 
    Document   : shortlisted_students
    Created on : 23 Mar 2026, 6:18:50 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Shortlisted Students</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<style>
body { background: #f4f6f9; }
.sidebar { width:220px;height:100vh;background:#1e2a38;position:fixed;color:white; }
.sidebar h3 { padding:20px;text-align:center; }
.sidebar a { display:block;color:white;padding:12px 20px;text-decoration:none; }
.sidebar a:hover { background:#2f4050; }
.content { margin-left:230px;padding:25px; }
</style>
</head>

<body>

<div class="sidebar">
    <h3>Recruiter</h3>

    <!-- ✅ FIXED LINKS -->
    <a href="<%= request.getContextPath() %>/recruiter_dashboard.jsp">Dashboard</a>

    <a href="<%= request.getContextPath() %>/ShortlistServlet?view=shortlisted">
        Shortlisted Students
    </a>

    <a href="<%= request.getContextPath() %>/jobpostings.jsp">Job Postings</a>

    <a href="<%= request.getContextPath() %>/home.jsp">Logout</a>
</div>

<div class="content">

<h2>Shortlisted Students</h2>

<table class="table table-bordered mt-3">
<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Branch</th>
<th>Action</th>
</tr>

<%
List<Map<String, String>> students =
    (List<Map<String, String>>) request.getAttribute("students");

if (students != null && !students.isEmpty()) {
    for (Map<String, String> s : students) {
%>

<tr>
<td><%= s.get("id") %></td>
<td><%= s.get("name") %></td>
<td><%= s.get("email") %></td>
<td><%= s.get("branch") %></td>

<td>
    <!-- ✅ FIXED URL -->
    <a href="<%= request.getContextPath() %>/ShortlistServlet?id=<%= s.get("id") %>&status=rejected"
       class="btn btn-danger btn-sm">
       Reject
    </a>
</td>
</tr>

<%
    }
} else {
%>

<tr>
<td colspan="5" style="text-align:center; color:red;">
    No shortlisted students
</td>
</tr>

<%
}
%>

</table>

</div>

</body>
</html>