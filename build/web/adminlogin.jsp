<%-- 
    Document   : adminlogin
    Created on : 27 Jan 2026, 8:44:33 pm
    Author     : defaultuser0 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <style>
        body {
            margin:0;
            font-family: Arial, sans-serif;
            background:#f4f6f9;
            display:flex;
            justify-content:center;
            align-items:center;
            height:100vh;
        }

        .login-card {
            background:#3f51b5;
            padding:40px;
            width:350px;
            box-shadow:0 0 15px #ccc;
            border-radius:8px;
            color:white;
            text-align:center;
        }

        .login-card h2 {
            margin-bottom:30px;
        }

        input[type=text], input[type=password] {
            width:90%;
            padding:10px;
            margin:10px 0;
            border:none;
            border-radius:4px;
        }

        input[type=submit] {
            width:95%;
            padding:10px;
            background:#ff9800;
            color:white;
            border:none;
            border-radius:4px;
            cursor:pointer;
            margin-top:15px;
        }

        input[type=submit]:hover {
            background:#e68900;
        }
    </style>
</head>

<body>
    <div class="login-card">
        <h2>Admin Login</h2>
        <form action="AdminLoginServlet" method="post">
            <input type="text" name="username" placeholder="User Name" required><br>
            <input type="password" name="password" placeholder="Password" required><br>
            <input type="submit" value="Log In">
        </form>
    </div>
</body>
</html>
