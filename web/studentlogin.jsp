<%-- 
    Document   : studentlogin
    Created on : 2 Feb 2026, 3:45:40 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Login Page</title>

<style>
body{
    margin:0;
    padding:0;
    font-family: Arial, sans-serif;
    background:#eef3f8;
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}
.container{
    width:360px;
    background:#5c63a7;
    padding:30px;
    border-radius:12px;
}
.container h2{
    color:#fff;
    text-align:center;
    margin-bottom:25px;
}
label{
    color:#fff;
    font-size:14px;
}
input[type=text], input[type=password]{
    width:100%;
    padding:10px;
    margin-top:5px;
    margin-bottom:18px;
    border:none;
    border-radius:6px;
}
input[type=submit]{
    width:100%;
    padding:10px;
    border:none;
    border-radius:20px;
    background:#fff;
    color:#5c63a7;
    font-size:16px;
    font-weight:bold;
    cursor:pointer;
}
input[type=submit]:hover{
    background:#e0e4ff;
}
.error{
    color:yellow;
    text-align:center;
    margin-top:10px;
}
</style>

<script>
function validateForm(){
    let username = document.forms["loginForm"]["username"].value.trim();
    let password = document.forms["loginForm"]["password"].value;

    if(username === "" || password === ""){
        alert("All fields are required");
        return false;
    }
    return true;
}
</script>

</head>

<body>

<div class="container">
    <h2>Student Login Page</h2>

    <!-- 🔥 FORM ACTION ADDED -->
    <form name="loginForm" action="studentlogin.jsp" method="post" onsubmit="return validateForm()">
        <label>Email</label>
        <input type="text" name="username">

        <label>Password</label>
        <input type="password" name="password">

        <input type="submit" name="login" value="Log In">
    </form>

<%
if(request.getParameter("login") != null){

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if(username == null || password == null || username.equals("") || password.equals("")){
        out.println("<div class='error'>All fields are required</div>");
    } else {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            // ==========================
            // Dynamic DB connection
            // ==========================
            String host = System.getenv("DB_HOST");
            String port = System.getenv("DB_PORT");
            String db   = System.getenv("DB_NAME");
            String user = System.getenv("DB_USER");
            String pass = System.getenv("DB_PASS");

            String url;
            if(host == null){ // Local fallback
                url = "jdbc:mysql://localhost:3306/register";
                user = "root";
                pass = "spdt";
            } else { // Online deploy
                url = "jdbc:mysql://" + host + ":" + port + "/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
            }

            con = DriverManager.getConnection(url, user, pass);

            ps = con.prepareStatement(
                "SELECT * FROM users WHERE email=? AND password=?"
            );
            ps.setString(1, username);
            ps.setString(2, password);

            rs = ps.executeQuery();

            if(rs.next()){
                
                // ✅ Session setup
                int user_id = rs.getInt("id");
                session.setAttribute("student_id", String.valueOf(user_id));
                session.setAttribute("studentUser", username);

                // ✅ Redirect
                response.sendRedirect("myprofile.jsp");

            } else {
                out.println("<div class='error'>Invalid Email or Password</div>");
            }

        } catch(Exception e){
            out.println("<div class='error'>DB Error: " + e.getMessage() + "</div>");
        } finally {
            try{ if(rs!=null) rs.close(); } catch(Exception e){}
            try{ if(ps!=null) ps.close(); } catch(Exception e){}
            try{ if(con!=null) con.close(); } catch(Exception e){}
        }

    }
}
%>

</div>

</body>
</html>