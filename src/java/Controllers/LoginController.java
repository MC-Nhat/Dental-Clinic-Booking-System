/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.UserDAO;
import Models.User;
import Util.PasswordEncoder;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class LoginController extends HttpServlet {

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
        String url = "";
        HttpSession session = request.getSession();
        session.setAttribute("activeLink", "dashboardLink");
        try {
            String accountName = request.getParameter("accountName");
            String password = request.getParameter("password");
            String remember = request.getParameter("remember");
            if (remember != null) {
                Cookie emailCookie = new Cookie("emailCookie", accountName);
                Cookie passwordCookie = new Cookie("passwordCookie", password);
                emailCookie.setMaxAge(86400);
                passwordCookie.setMaxAge(86400);
                response.addCookie(emailCookie);
                response.addCookie(passwordCookie);
            }
            String encryptedpassword = PasswordEncoder.toSHA1(password.trim());

            UserDAO dao = new UserDAO();
            User user = dao.checkLogin(accountName, encryptedpassword);
            if (user != null) {
                session.setAttribute("User", user);
                session.setAttribute("role", user.getRoleID());
                if (user.getRoleID() == 1) {
                    url = "DashBoardController";
                } else if (user.getRoleID() == 2) {
                    url = "GetAppointmentController";
                } else if (user.getRoleID() == 4) {
                    url = "GetAdvisoryController";
                } else if (user.getRoleID() == 3) {
                    url = "MarketingDentistController";
                } else if (user.getRoleID() == 5) {
                    url = "index.jsp";

                }
            } else {
                request.setAttribute("SIGNUP_FAIL", "Invalid email/phone number or password");
                url = "login.jsp";
            }
        } catch (Exception e) {

        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
