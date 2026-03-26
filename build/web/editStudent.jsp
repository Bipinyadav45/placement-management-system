<%-- 
    Document   : editStudent
    Created on : 30 Jan 2026, 9:22:14 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String prn = request.getParameter("prn");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
  Class.forName("com.mysql.cj.jdbc.Driver");
  con = DriverManager.getConnection(
      "jdbc:mysql://localhost:3306/student_db","root","spdt");

  ps = con.prepareStatement("SELECT * FROM student WHERE prn=?");
  ps.setString(1, prn);
  rs = ps.executeQuery();

  if(rs.next()){
%>

<h2>Edit Student</h2>

<form action="updateStudent.jsp" method="post">
  <input type="hidden" name="prn" value="<%=rs.getString("prn")%>">

  First Name:
  <input type="text" name="fname" value="<%=rs.getString("fname")%>"><br><br>

  Last Name:
  <input type="text" name="lname" value="<%=rs.getString("lname")%>"><br><br>

  Email:
  <input type="email" name="email" value="<%=rs.getString("email")%>"><br><br>

  <input type="submit" value="Update Student">
</form>

<%
  }
} catch(Exception e){
  out.println(e);
}
%>
