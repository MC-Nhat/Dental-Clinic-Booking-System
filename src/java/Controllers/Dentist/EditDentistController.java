/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Dentist;

import DAL.DentistDAO;
import DAL.UserDAO;
import Models.Dentist;
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
public class EditDentistController extends HttpServlet {

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
            // img, experience, degree null thì lấy giá trị củ
            String id = request.getParameter("editIDDentist");
            String fullname = request.getParameter("editNameDentist");
            String phone = request.getParameter("editPhoneDentist");
            String email = request.getParameter("editEmailDentist");
            String degree = request.getParameter("editDegreeDentist");
            String experience = request.getParameter("editExperienceDentist");
            String img = request.getParameter("editImageDentist");
            String gender = request.getParameter("gender");
            int status = Integer.parseInt(request.getParameter("editStatusDentist"));
            
            if (img != null && !img.isEmpty()) {
                img = "img/bacsi/" + img;
            }
            
            DentistDAO dentistDAO = new DentistDAO();
            Dentist den = dentistDAO.getDentistByID(id);
            
            String[] denOld = {den.getImg(), den.getExperience(), den.getDegree()};
            String[] denNew = {img, experience, degree};
            for (int i = 0; i < denNew.length; i++) {
                if (denNew[i] == null || denNew[i].isEmpty()) {
                    denNew[i] = denOld[i]; 
                }
            }
            
            String emailreal = request.getParameter("editEmailDentistReal");
            boolean checkemail = dao.checkEmailExists(email);
            if (!emailreal.equals(email)) {
                if (checkemail) {
                    request.setAttribute("reportEmail", "Email này đã được sử dụng!!!");
                    request.getRequestDispatcher("editDentist.jsp?dentistID=" + id).forward(request, response);
                }
            }

            boolean check = false;
            check = DentistDAO.updateDentist(Integer.parseInt(id), fullname, phone, email, denNew[2], denNew[1], denNew[0], status, gender);

            if (check) {
                request.getRequestDispatcher("MainController?action=dentist").forward(request, response);
            }
            else request.getRequestDispatcher("MainController?action=dentist").forward(request, response);    
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
