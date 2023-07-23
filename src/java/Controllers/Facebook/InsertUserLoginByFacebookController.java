/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Facebook;

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
public class InsertUserLoginByFacebookController extends HttpServlet {

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
            HttpSession session = request.getSession();
            try {
                String idFb = request.getParameter("idFacebook");
                String name = request.getParameter("accountName");
                String email = request.getParameter("gmail");
                String phone = request.getParameter("numberPhone");
                String gender = request.getParameter("gender");
                boolean checkgmail = UserDAO.checkEmail(email);
                if (checkgmail == false) {
                    request.setAttribute("id", idFb);
                    request.setAttribute("name", name);
                    request.setAttribute("logbyfb", true);
                    String message = "Email này đã được sử dụng để đăng kí, xin vui lòng nhập email khác.";
                    request.setAttribute("message", message);
                    request.getRequestDispatcher("additional-info.jsp").forward(request, response);
                } else {
                    boolean result = UserDAO.insertUserLoginByFacebook(idFb, name, email, phone, gender);
                    if (result) {
                        User user = UserDAO.getUserLoginByFacebook(idFb);
                        session.setAttribute("User", user);
                        String message = "Đăng nhập thành công.";
                        request.setAttribute("message", message);
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    } else {
                        out.println("<html><body>");
                        out.println("<script>");
                        out.println("alert('Lỗi hệ thống, vui lòng thử lại sau.');");
                        out.println("window.location.href='login.jsp';");  // Thay 'your_jsp_page.jsp' bằng trang JSP bạn muốn chuyển hướng sau khi thông báo
                        out.println("</script>");
                        out.println("</body></html>");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
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
