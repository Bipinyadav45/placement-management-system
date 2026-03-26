<%-- 
    Document   : index
    Created on : 27 Jan 2026, 7:56:53 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@page import="java.sql.*"%>

<%
String message = (String) request.getAttribute("message");
String messageType = (String) request.getAttribute("messageType");
%>

<!DOCTYPE html>
<html>
<head>
<title>Create Account</title>

<style>
body{
    font-family: Arial, sans-serif;
    background:#f2f4f7;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}
.container{
    background:white;
    padding:30px;
    width:350px;
    border-radius:10px;
    box-shadow:0 0 10px rgba(0,0,0,0.1);
    text-align:center;
}
h2{ margin-bottom:20px; }

input{
    width:100%;
    padding:10px;
    margin:10px 0;
    border:1px solid #ccc;
    border-radius:5px;
    font-size:14px;
}

button{
    width:100%;
    padding:12px;
    background:#2e8b57;
    border:none;
    color:white;
    font-size:16px;
    border-radius:5px;
    cursor:pointer;
}
button:hover{ background:#256f46; }

p{ margin-top:15px; font-size:14px; }
a{ color:#2a6df4; text-decoration:none; }

.message{
    font-size:14px;
    margin-bottom:15px;
    padding:10px;
    border-radius:5px;
    transition:opacity 0.5s;
}

.success{
    color:#155724;
    background:#d4edda;
    border:1px solid #c3e6cb;
}

.error{
    color:#721c24;
    background:#f8d7da;
    border:1px solid #f5c6cb;
}
</style>

<script>
function validateForm() {

    let name = document.forms["regForm"]["name"].value.trim();
    let email = document.forms["regForm"]["email"].value.trim();
    let password = document.forms["regForm"]["password"].value;
    let confirm = document.forms["regForm"]["confirm"].value;

    let errorMsg="";

    if(name=="")
        errorMsg+="Full Name required\n";
    else if(!/^[a-zA-Z\s]+$/.test(name))
        errorMsg+="Name only letters allowed\n";

    if(email=="")
        errorMsg+="Email required\n";
    else if(!/^\S+@\S+\.\S+$/.test(email))
        errorMsg+="Invalid email\n";

    if(password.length<6)
        errorMsg+="Password minimum 6 characters\n";

    if(password!=confirm)
        errorMsg+="Passwords do not match\n";

    if(errorMsg!=""){
        alert(errorMsg);
        return false;
    }

    return true;
}

/* AUTO HIDE MESSAGE */
window.onload=function(){
    let msg=document.getElementById("msgbox");
    if(msg){
        setTimeout(function(){
            msg.style.opacity="0";
            setTimeout(function(){
                msg.style.display="none";
            },500);
        },3000);
    }
}
</script>

</head>

<body>

<div class="container">

<h2>Create Account</h2>

<% if(message!=null && !message.isEmpty()) { %>

<div id="msgbox" class="message <%= "success".equals(messageType) ? "success" : "error" %>">
<%= message %>
</div>

<% } %>

<form name="regForm" action="registerprocess.jsp" method="post" onsubmit="return validateForm()">

<input type="text" name="name" placeholder="Full Name" required>

<input type="email" name="email" placeholder="Email" required>

<input type="password" name="password" placeholder="Password" required>

<input type="password" name="confirm" placeholder="Confirm Password" required>

<button type="submit">Register</button>

</form>

<p>Already have an account? <a href="loginoption.jsp">Login</a></p>

</div>

</body>
</html>