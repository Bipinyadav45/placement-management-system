/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.question;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author defaultuser0
 */
public class QuestionServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet QuestionServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuestionServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     //   processRequest(request, response);
       
    int testId = 0;
    int qno = 1;

    try {
        testId = Integer.parseInt(request.getParameter("test_Id"));
    } catch (Exception e) {
        response.getWriter().println("Invalid Test ID");
        return;
    }

    if (request.getParameter("qno") != null) {
        try {
            qno = Integer.parseInt(request.getParameter("qno"));
            if (qno <= 0) qno = 1;  // Ensure qno is always 1 or more
        } catch (Exception e) {
            qno = 1;  // Default to question 1 in case of an error
        }
    }

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        // Load MySQL Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish connection to the database
        String host = System.getenv("DB_HOST");

if (host != null) {
    // 🌐 Railway (Online DB)
    String port = System.getenv("DB_PORT");
    String db = System.getenv("DB_NAME");
    String user = System.getenv("DB_USER");
    String pass = System.getenv("DB_PASS");

    String url = "jdbc:mysql://" + host + ":" + port + "/" + db;
    con = DriverManager.getConnection(url, user, pass);

} else {
    // 💻 Localhost
    String url = "jdbc:mysql://localhost:3306/test_db";
    String user = "root";
    String pass = "spdt";

    con = DriverManager.getConnection(url, user, pass);
}

        // Get the total number of questions for the current test
        ps = con.prepareStatement("SELECT COUNT(*) FROM questions WHERE test_id=?");
        ps.setInt(1, testId);
        rs = ps.executeQuery();

        int totalQuestions = 0;
        if (rs.next()) {
            totalQuestions = rs.getInt(1);
        }

        rs.close();
        ps.close();

        // Fetch the current question based on qno (pagination)
        ps = con.prepareStatement("SELECT * FROM questions WHERE test_id=? LIMIT ?,1");
        ps.setInt(1, testId);
        ps.setInt(2, qno - 1);  // OFFSET based on the question number

        rs = ps.executeQuery();

        // If question exists, set the request attributes
        if (rs.next()) {
            request.setAttribute("qno", qno);
            request.setAttribute("question", rs.getString("question"));
            request.setAttribute("op1", rs.getString("option1"));
            request.setAttribute("op2", rs.getString("option2"));
            request.setAttribute("op3", rs.getString("option3"));
            request.setAttribute("op4", rs.getString("option4"));
        }

        // Set additional attributes required by JSP
        request.setAttribute("test_Id", testId);
        request.setAttribute("totalQuestions", totalQuestions);

        // Forward the request to the JSP page
        RequestDispatcher rd = request.getRequestDispatcher("questions.jsp");
        rd.forward(request, response);

    } catch (Exception e) {
        e.printStackTrace();
        response.getWriter().println("Error loading question");
    } finally {
        try {
            // Close all resources
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
