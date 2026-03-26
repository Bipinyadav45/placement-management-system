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

try{
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection con = DriverManager.getConnection(
      "jdbc:mysql://localhost:3306/student_db","root","spdt");

  PreparedStatement ps = con.prepareStatement(
      "UPDATE student SET fname=?, lname=?, email=? WHERE prn=?");

  ps.setString(1, fname);
  ps.setString(2, lname);
  ps.setString(3, email);
  ps.setString(4, prn);

  ps.executeUpdate();

  response.sendRedirect("studentlist.jsp");

}catch(Exception e){
  out.println(e);
}
%>
