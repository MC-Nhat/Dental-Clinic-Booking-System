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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class ChangePasswordController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String email = request.getParameter("EmailNow");
            String passnow = PasswordEncoder.toSHA1(request.getParameter("PassNow"));
            String passnew = PasswordEncoder.toSHA1(request.getParameter("PassNew"));
            String passnewagain = PasswordEncoder.toSHA1(request.getParameter("PassNewAgain"));

            UserDAO userDAO = new UserDAO();
            User user = userDAO.getUserByEmail(email);
            session.setAttribute("User", user);
            session.setAttribute("role", user.getRoleID());
            if (user.getRoleID() == 1) {
                if (!passnew.equals(passnewagain)) {
                    request.setAttribute("report2", "Mật khẩu không giống!!!");
                    request.getRequestDispatcher("MainController?action=changePassPage").forward(request, response);
                } else if (!user.getPassword().equals(passnow)) {
                    request.setAttribute("report1", "Mật khẩu không đúng!!!");
                    request.getRequestDispatcher("MainController?action=changePassPage").forward(request, response);
                } else {
                    userDAO.editPasswordUser(email, passnew);
                    request.getRequestDispatcher("MainController?action=Logout").forward(request, response);
                }
            } else if (user.getRoleID() == 4) {
                url = "GetAdvisoryController";
            } else if (user.getRoleID() == 3) {
                url = "MarketingDentistController";
            } else if (user.getRoleID() == 5) {
 
                if (!passnew.equals(passnewagain)) {
                    request.setAttribute("report2", "Mật khẩu không giống!!!");
                    request.getRequestDispatcher("MainController?action=changePassUser").forward(request, response);
                } else if (!user.getPassword().equals(passnow)) {
                    request.setAttribute("report1", "Mật khẩu không đúng!!!");
                    request.getRequestDispatcher("MainController?action=changePassUser").forward(request, response);
                } else {
                    userDAO.editPasswordUser(email, passnew);
                    request.getRequestDispatcher("MainController?action=Logout").forward(request, response);
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
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
