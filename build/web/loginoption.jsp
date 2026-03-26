<%-- 
    Document   : loginoption
    Created on : 15 Mar 2026, 3:53:26 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            text-align: center;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .login-options {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .login-btn {
            text-decoration: none;
            padding: 10px 20px;
            background-color: white;
            color: #007bff;
            border-radius: 5px;
            font-size: 16px;
            border: 1px solid #007bff;
            transition: background-color 0.3s, color 0.3s;
        }

        .login-btn:hover {
            background-color: #007bff;
            color: white;
        }

        .active {
            background-color: #007bff;
            color: white;
        }

        .back-btn {
            display: block;
            margin-top: 20px;
            text-decoration: none;
            color: #555;
            font-size: 14px;
        }

        .back-btn:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Where would you like to login?</h2>
        <div class="login-options">
            <a href="adminlogin.jsp" class="login-btn">Admin Login</a>
            <a href="studentlogin.jsp" class="login-btn">Student Login</a>
            <a href="recruiterlogin.jsp" class="login-btn">Recruiter Login</a>
        </div>
        <div style="margin-top:15px;">
    <a href="javascript:history.back()" style="margin-right:20px;">Go Back</a>
    <a href="home.jsp">Home</a>
</div>
    </div>
</body>
</html>