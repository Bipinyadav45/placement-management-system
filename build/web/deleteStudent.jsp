<%-- 
    Document   : deleteStudent
    Created on : 30 Jan 2026, 9:25:00 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String prn = request.getParameter("prn");

try{
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection con = DriverManager.getConnection(
      "jdbc:mysql://localhost:3306/student_db","root","spdt");

  PreparedStatement ps = con.prepareStatement(
      "DELETE FROM student WHERE prn=?");
  ps.setString(1, prn);

  ps.executeUpdate();

  response.sendRedirect("studentlist.jsp");

}catch(Exception e){
  out.println(e);
}
%>
