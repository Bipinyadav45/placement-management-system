<%-- 
    Document   : register
    Created on : 15 Mar 2026, 2:49:07 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Placement Management System</title>

    <style>
        body{
            margin:0;
            font-family: Arial, sans-serif;
            background:#f4f6f9;
        }

        /* HEADER */
        .header{
            background:#3f51b5;
            color:white;
            padding:15px;
            font-size:22px;
            text-align:right;
        }

        /* SIDEBAR */
        .sidebar{
            width:220px;
            height:100vh;
            background:#263238;
            position:fixed;
            left:0;
            top:0;
            color:white;
            padding-top:60px;
        }

        .sidebar a{
            display:block;
            color:white;
            padding:15px;
            text-decoration:none;
        }

        .sidebar a:hover{
            background:#37474f;
        }

        /* DROPDOWN */
        .dropdown-container {
            display: none;
            background-color: #37474f;
            padding-left: 15px;
        }

        .dropdown-container a {
            padding: 10px 15px;
            display: block;
            color: white;
            text-decoration: none;
        }

        .dropdown-container a:hover {
            background: #455a64;
        }

        /* MAIN CONTENT AS HERO SECTION */
        .content{
            margin-left:240px;
            height:calc(100vh - 60px);
            display:flex;
            justify-content:center;
            align-items:center;
            background:linear-gradient(to right, #eef2f7, #f8fafc);
            text-align:center;
        }

        .hero h1{
            font-size:42px;
            color:#2c3e50;
            margin-bottom:10px;
        }

        .hero p{
            font-size:18px;
            color:#555;
            margin-bottom:30px;
        }

        .hero-buttons{
            display:flex;
            justify-content:center;
            gap:15px;
        }

        .btn{
            padding:12px 28px;
            text-decoration:none;
            border-radius:6px;
            font-size:16px;
        }

        .btn.primary{
            background:#2e86de;
            color:white;
        }

        .btn.primary:hover{
            background:#1b5fbf;
        }

        .btn.secondary{
            background:#ecf0f1;
            color:#2c3e50;
        }

        .btn.secondary:hover{
            background:#dcdfe3;
        }
    </style>
</head>

<body>

    <!-- HEADER -->
    <div class="header">
        PLACEMENT PORTAL
    </div>

    <!-- SIDEBAR -->
    <div class="sidebar">
        <a href="#" class="dropdown-btn">LOGIN &#9662;</a>
        <div class="dropdown-container">
            <a href="adminlogin.jsp">Admin Login</a>
            <a href="studentlogin.jsp">Student Login</a>
            <a href="recruiterlogin.jsp">Recruiter Login</a>
             <a href="mocktest.jsp">Mock Test</a>
        </div>
    </div>

    <!-- HERO CONTENT -->
    <div class="content">
        <div class="hero">
            <h1>
                Welcome to <br>
                Placement Management System!
            </h1>

            <p>Connecting Students with Career Opportunities</p>

            <div class="hero-buttons">
                <a href="index.jsp" class="btn primary">Get Started</a>
            </div>
        </div>
    </div>

    <!-- JS FOR DROPDOWN -->
    <script>
        var dropdown = document.getElementsByClassName("dropdown-btn");
        for (var i = 0; i < dropdown.length; i++) {
            dropdown[i].addEventListener("click", function() {
                var container = this.nextElementSibling;
                if (container.style.display === "block") {
                    container.style.display = "none";
                } else {
                    container.style.display = "block";
                }
            });
        }
    </script>

</body>
</html>
