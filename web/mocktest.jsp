<%-- 
    Document   : mockTest.jsp
    Created on : 15 Feb 2026, 8:51:13 am
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Placement Management System</title>

<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        display: flex;
        height: 100vh;
    }

    .sidebar {
        width: 230px;
        background: linear-gradient(to bottom, #1c2b36, #2f4353);
        color: white;
        padding-top: 20px;
    }

    .sidebar h3 {
        padding-left: 20px;
        margin-bottom: 20px;
        font-size: 18px;
    }

    .sidebar a {
        display: block;
        padding: 14px 20px;
        text-decoration: none;
        color: white;
        font-size: 15px;
        transition: 0.3s;
    }

    .sidebar a:hover {
        background-color: #3f5c85;
    }

    .active {
        background-color: #3f5c85;
    }

    .main {
        flex: 1;
        background: linear-gradient(to right, #e6e9f0, #eef1f5);
        display: flex;
        flex-direction: column;
    }

    .navbar {
        background-color: #4b61c9;
        color: white;
        padding: 18px;
        font-size: 22px;
        text-align: right;
        letter-spacing: 1px;
    }

    .content {
        flex: 1;
        text-align: center;
        margin-top: 120px;
    }

    .content h1 {
        font-size: 36px;
        color: #2c3e50;
        margin-bottom: 20px;
    }

    .content p {
        font-size: 18px;
        color: #555;
        width: 60%;
        margin: auto;
        line-height: 28px;
    }

    .button-group {
        margin-top: 35px;
    }

    .btn {
        padding: 12px 28px;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
        margin: 0 10px;
        display: inline-block;
        transition: 0.3s;
    }

    .btn-primary {
        background-color: #3f7fd6;
        color: white;
    }

    .btn-primary:hover {
        background-color: #356ac0;
    }

    .btn-secondary {
        background-color: #e0e0e0;
        color: #333;
    }

    .btn-secondary:hover {
        background-color: #cfcfcf;
    }

</style>
</head>

<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h3>LOGIN ▾</h3>
        <a href="adminlogin.jsp">Admin Login</a>
        <a href="studentlogin.jsp">Student Login</a>
        <a href="recruiterlogin.jsp">Recruiter Login</a>
        <a href="mockTest.jsp" class="active">Mock Test</a>
    </div>

    <!-- Main Content -->
    <div class="main">
        
        <!-- Navbar -->
        <div class="navbar">
            PLACEMENT PORTAL
        </div>

        <!-- Center Content -->
        <div class="content">
            <h1>Prepare for Your Placement with Mock Tests</h1>
            <p>
                Practice with our mock tests to assess your skills and improve your
                performance for actual placements.
            </p>

            <!-- Updated Buttons -->
            <div class="button-group">

                <!-- Direct Redirect to Dashboard -->
                <button class="btn btn-primary"
                        onclick="location.href='mocktest-dashboard.jsp'">
                    Start Mock Test
                </button>

                <button class="btn btn-secondary"
                        onclick="location.href='result.jsp'">
                    View Result
                </button>

            </div>

        </div>

    </div>

</body>
</html>
