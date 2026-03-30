/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.placement;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author defaultuser0
 */
public class AddCompanyServlet extends HttpServlet {

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
            out.println("<title>Servlet AddCompanyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCompanyServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
    //    processRequest(request, response);

     String companyName = request.getParameter("companyName");
        String role = request.getParameter("jobRole");
        String pkg = request.getParameter("package");
        String criteria = request.getParameter("criteria");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            // 2. Load driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 3. DB connection
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
    String url = "jdbc:mysql://localhost:3306/pms_db";
    String user = "root";
    String pass = "spdt";

    con = DriverManager.getConnection(url, user, pass);
}
            // 4. SQL (cid auto-increment → not included)
            String sql = "INSERT INTO company (cname, role, package, criteria) VALUES (?,?,?,?)";
            ps = con.prepareStatement(sql);

            ps.setString(1, companyName);
            ps.setString(2, role);
            ps.setString(3, pkg);
            ps.setString(4, criteria);

            ps.executeUpdate();

            // 5. Redirect
            response.sendRedirect("companylist.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
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
