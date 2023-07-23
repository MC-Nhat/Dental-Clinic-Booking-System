/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Dentist;

import DAL.DentistDAO;
import DAL.UserDAO;
import Util.PasswordEncoder;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class CreateDentistController extends HttpServlet {

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
            UserDAO dao = new UserDAO();
            
            String fullname = request.getParameter("createNameDentist");   
            String email = request.getParameter("createEmailDentist");
            String pass = PasswordEncoder.toSHA1(request.getParameter("createPassDentist"));
            String passAgain = PasswordEncoder.toSHA1(request.getParameter("createPassAgainDentist"));
            String phone = request.getParameter("createPhoneDentist");
            String img = "image/" + request.getParameter("createImageDentist");
            String experience = request.getParameter("createExperienceDentist");
            String degree = request.getParameter("createDegreeDentist");
            int status = Integer.parseInt(request.getParameter("createStatusDentist"));
            String gender = request.getParameter("gender");
            String roleDentist = request.getParameter("roleDentist");
            
            boolean checkemail = dao.checkEmailExists(email);
            if (checkemail) {
                request.setAttribute("reportEmail", "Email đã tồn tại!");
                request.getRequestDispatcher("addDentist.jsp").forward(request, response);
            }
            if (pass.length() < 8 || !pass.matches(".*[A-Z].*")) {
                request.setAttribute("reportPass", "Mật khẩu phải có ít nhất 8 ký tự và có 1 chữ cái viết hoa");
                request.getRequestDispatcher("addDentist.jsp").forward(request, response);
                return;
            }
            
            boolean check = false;
            if (pass.equals(passAgain)) {
                check = DentistDAO.insertDentist(fullname, phone, email, pass, degree, experience, img, status, gender, roleDentist);
                if (check) {
                    request.getRequestDispatcher("MainController?action=dentist").forward(request, response);
                }
                else request.getRequestDispatcher("MainController?action=dentist").forward(request, response);
            }
            else{
                request.setAttribute("reportPassAgain", "Mật khẩu không trùng khớp. Xin mời nhập lại");
                request.getRequestDispatcher("addDentist.jsp").forward(request, response);
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
