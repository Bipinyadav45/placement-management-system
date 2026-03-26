<%-- 
    Document   : editJob
    Created on : 20 Mar 2026, 3:47:47 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="until.DBConnection"%>

<%
String id = request.getParameter("id");
String title="", company="", location="", status="Open";

if(id != null){
    try{
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM jobs WHERE id=?");
        ps.setInt(1, Integer.parseInt(id));
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            title = rs.getString("title");
            company = rs.getString("company");
            location = rs.getString("location");
            status = rs.getString("status");
        }
        con.close();
    }catch(Exception e){ out.println(e); }
}

if(request.getMethod().equalsIgnoreCase("POST")){
    String t = request.getParameter("title");
    String c = request.getParameter("company");
    String l = request.getParameter("location");
    String s = request.getParameter("status");
    try{
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("UPDATE jobs SET title=?, company=?, location=?, status=? WHERE id=?");
        ps.setString(1, t);
        ps.setString(2, c);
        ps.setString(3, l);
        ps.setString(4, s);
        ps.setInt(5, Integer.parseInt(id));
        ps.executeUpdate();
        response.sendRedirect("jobpostings.jsp");
    }catch(Exception e){ out.println(e); }
}
%>

<html>
<body>
<h2>Edit Job</h2>
<form method="post">
    Title: <input type="text" name="title" value="<%=title%>" required><br>
    Company: <input type="text" name="company" value="<%=company%>" required><br>
    Location: <input type="text" name="location" value="<%=location%>" required><br>
    Status: 
    <select name="status">
        <option <%=status.equals("Open")?"selected":""%>>Open</option>
        <option <%=status.equals("Closed")?"selected":""%>>Closed</option>
    </select><br>
    <button type="submit">Update Job</button>
</form>
</body>
</html>