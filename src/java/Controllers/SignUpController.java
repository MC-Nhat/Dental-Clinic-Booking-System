/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.UserDAO;
import Util.PasswordEncoder;
import Util.SendMail;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class SignUpController extends HttpServlet {

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
            String fullName = request.getParameter("fullName");
            final String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phoneNumber");

            String password = PasswordEncoder.toSHA1(request.getParameter("password"));

            UserDAO dao = new UserDAO();
            String success = dao.signup(fullName, email, password, phoneNumber);
            //request.setAttribute("SIGNUP_SUCCESS", success);
            if (!success.equals("")) {
                response.getWriter().write("success");
                final String content = "<!DOCTYPE html>\n"
                        + "<html lang=\"en\">\n"
                        + "<head>\n"
                        + "</head>\n"
                        + "<body>\n"
                        + "    <h3 style=\"color: blue;\">CẢM ƠN BẠN ĐÃ ĐĂNG KÍ </h3>\n"
                        + "    <div>Họ Và Tên:" + fullName + "</div>\n"
                        + "    <div>Số Điện Thoại: 0" + phoneNumber + "</div>\n"
                        + "    <div>Mã Bệnh Nhân:" + success + "</div>\n"
                        + "    <h3 style=\"color: red;\">Hãy ghi nhớ mã bệnh nhân để thuận tiện trong quá trình trị liệu nhé!</h3>\n"
                        + "</body>\n"
                        + "</html>";
                Runnable myRunnable = new Runnable() {
                    public void run() {
                        // Các công việc được thực thi trong luồng này
                        SendMail.sendEmail(email, "Đăng Kí Thành Công", content, "SignUp");
                    }
                };
                Thread thread = new Thread(myRunnable);

                // Khởi chạy luồng
                thread.start();

            } else {
                response.getWriter().write("fail");
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
