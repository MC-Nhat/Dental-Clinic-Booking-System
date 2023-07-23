/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Patient;

import DAL.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class AddPatient extends HttpServlet {

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

            String name = request.getParameter("txtname");
            String email = request.getParameter("txtemail");

            String phoneStr = request.getParameter("txtphone");
            phoneStr = phoneStr.replaceAll("[^0-9]", "");

            String phone = phoneStr;


            int sta = Integer.parseInt(request.getParameter("status"));
            String roll = request.getParameter("txtroll");
            String pass = request.getParameter("txtpass");
            String passAgain = request.getParameter("txtpass2");
            String gender = request.getParameter("txtgender");
            boolean check = false;

            if (dao.checkEmailExists(email)) {
                request.setAttribute("report2", "Email đã tồn tại!");
                request.getRequestDispatcher("add-patient.jsp").forward(request, response);
                return;
            }
            if (!email.endsWith("@gmail.com")) {
                request.setAttribute("report2", "Email phải có đuôi là @gmail.com!");
                request.getRequestDispatcher("add-patient.jsp").forward(request, response);
                return;
            }
             if (pass.length() < 8 || !pass.matches(".*[A-Z].*")) {
                request.setAttribute("report4", "Mật khẩu phải có ít nhất 8 ký tự và có 1 chữ cái viết hoa");
                request.getRequestDispatcher("add-patient.jsp").forward(request, response);
                return;
            }
            if (phoneStr.length() != 10) {
                request.setAttribute("report1", "Số điện thoại phải có 10 chữ số!");
                request.getRequestDispatcher("add-patient.jsp").forward(request, response);
                return;
            }

            if (!roll.matches("P\\d+")) {
                request.setAttribute("report", "Mã roll phải bắt đầu bằng chữ P và theo sau là các chữ số!");
                request.getRequestDispatcher("add-patient.jsp").forward(request, response);
                return;
            }

            if (dao.checkRollExists(roll)) {
                request.setAttribute("report", "Mã roll đã tồn tại!");
                request.getRequestDispatcher("add-patient.jsp").forward(request, response);
                return;
            }
            
            if (pass.equals(passAgain)) {
                check = UserDAO.insertPatient(name, email, phone, sta, 5, roll, pass, gender);
                if (check) {
                    request.getRequestDispatcher("MainController?action=patient").forward(request, response);
                } else {
                    request.getRequestDispatcher("MainController?action=patient").forward(request, response);
                }
            } else {
                request.setAttribute("report3", "Mật khẩu không trùng khớp!");
                request.getRequestDispatcher("add-patient.jsp").forward(request, response);
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
