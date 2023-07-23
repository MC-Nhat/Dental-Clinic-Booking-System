/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Patient;

import DAL.UserDAO;
import Models.User;
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
public class ChangeProfileUser extends HttpServlet {

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
        try {
            int id = Integer.parseInt(request.getParameter("userId"));
            String fullName = request.getParameter("txtfullname");
            String phoneNumber = request.getParameter("txtphonenumber");
            phoneNumber = phoneNumber.replace("[^0-9]", "");
            String email = request.getParameter("txtemail");
            String gender = request.getParameter("gender");

            UserDAO dao = new UserDAO();
            if (phoneNumber.length() != 10) {
                request.setAttribute("report1", "Số điện thoại không hợp lệ!");
                request.getRequestDispatcher("changeProfileUser.jsp").forward(request, response);
                return;

            } else {
                dao.updateProfileUser(id, fullName, phoneNumber, email, gender);
                response.sendRedirect("TreatmentCourseController");               
//            request.getRequestDispatcher("profileUser.jsp").forward(request, response);
                HttpSession session = request.getSession();

                // Cập nhật thông tin người dùng trong phiên làm việc
                User user = (User) session.getAttribute("User");
                user.setFullName(fullName);
                user.setPhoneNumber(phoneNumber);
                user.setGender(gender);
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
