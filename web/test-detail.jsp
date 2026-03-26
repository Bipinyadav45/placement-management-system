<%-- 
    Document   : test-detail
    Created on : 26 Feb 2026, 3:09:48 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String title = (String)request.getAttribute("title");
String level = (String)request.getAttribute("level");
String desc = (String)request.getAttribute("description");
String time = (String)request.getAttribute("duration");
Integer questions = (Integer)request.getAttribute("questions");
Integer testId = (Integer)request.getAttribute("id");   // IMPORTANT

if(title == null){
    title="Test Not Found";
}
%>

<html>
<head>
<title><%=title%></title>

<style>
body{
font-family:Arial;
background:#f4f6f9;
}

.box{
width:450px;
margin:100px auto;
padding:30px;
border-radius:15px;
box-shadow:0 0 15px gray;
text-align:center;
background:white;
}

.header{
background:linear-gradient(to right,#2d5be3,#2bb673);
color:white;
padding:20px;
border-radius:12px;
}

.btn{
background:#2d5be3;
color:white;
padding:12px 30px;
border:none;
border-radius:8px;
cursor:pointer;
margin-top:20px;
font-size:16px;
}

.btn:hover{
background:#1b3fa8;
}

.back{
display:inline-block;
margin-right:15px;
text-decoration:none;
color:#333;
font-weight:bold;
}
</style>

</head>

<body>

<div class="box">

<div class="header">
<h2><%=title%></h2>
<p>Level: <%=level%></p>
</div>

<br>

<p><%=desc%></p>

<p>
<b>Duration: <%=time%></b> | 
<b>Total Questions: <%=questions%></b>
</p>

<br>

<a class="back" href="mocktest-dashboard.jsp">Back</a>

<!-- IMPORTANT CHANGE -->
<form action="QuestionServlet" method="get">

<input type="hidden" name="test_Id" value="<%=testId%>">

<button class="btn" type="submit">
Start Test
</button>

</form>

</div>

</body>
</html>