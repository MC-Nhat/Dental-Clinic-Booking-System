/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DAL.SendDAO;
import Models.User;
import Util.SendMail;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class javaMailController extends HttpServlet {

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
        try {
            /* TODO output your page here. You may use following sample code. */
            final String name = request.getParameter("gmail");
            SendDAO dao = new SendDAO();
            
            User user = dao.checkMail(name);
            if (user != null) {
                session.setAttribute("gmail", name);
                final String random = dao.getSoNgauNhien();
                session.setAttribute("code", random);
                Runnable myRunnable = new Runnable() {
                    public void run() {
                        // Các công việc được thực thi trong luồng này
                        SendMail.sendEmail(name, "Mail from Dental Clinic System", "Your verification code is: " + random, "forgot password");
                    }
                };
                Thread thread = new Thread(myRunnable);
                thread.start();
                url = "confirmEmail.jsp";
                
            } else {
                request.setAttribute("EMAIL_FAIL", "Email Không Tồn Tại");
                url = "forgotPassword.jsp";
            }
        } catch (Exception e) {
           
        }finally{
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
