/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Feedback;

import DAL.DentistDAO;
import DAL.FeedbackDentistDAO;
import DAL.FeedbackServiceDAO;
import DAL.ServiceDAO;
import DAL.TreatmentCourseDetailDAO;
import Models.Dentist;
import Models.Service;
import Models.User;
import Util.SendMail;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class AddFeedBackController extends HttpServlet {

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
            HttpSession session = request.getSession();
            final User user = (User) session.getAttribute("User");
            int treatmentCourseDetailID = Integer.parseInt(request.getParameter("treatmentCourseDetailID"));
            int dentistID = Integer.parseInt(request.getParameter("dentistID"));
            int serviceID = Integer.parseInt(request.getParameter("serviceID"));
            int dentistRate = Integer.parseInt(request.getParameter("dentistRate"));
            int serviceRate = Integer.parseInt(request.getParameter("serviceRate"));
            String dentistFeedback = request.getParameter("dentistFeedback");
            String serviceFeedback = request.getParameter("serviceFeedback");
            FeedbackDentistDAO feedbackDentistDAO = new FeedbackDentistDAO();
            FeedbackServiceDAO feedbackServiceDAO = new FeedbackServiceDAO();
            DentistDAO dentistDAO = new DentistDAO();
            Dentist dentist = dentistDAO.getDentistByID(Integer.toString(dentistID));
            Service service = ServiceDAO.getServiceById(serviceID);
            TreatmentCourseDetailDAO.UpdateStatusFeedBack(treatmentCourseDetailID);
            feedbackDentistDAO.addFeedBackDentist(user.getId(), dentistID, dentistRate, dentistFeedback);
            feedbackServiceDAO.addFeedBackService(user.getId(), serviceID, serviceRate, serviceFeedback);
            final String content = "<!DOCTYPE html>\n"
                    + "<html lang=\"en\">\n"
                    + "<head>\n"
                    + "</head>\n"
                    + "<body>\n"
                    + "    <h3 style=\"color: blue;\">CẢM ƠN BẠN ĐÃ GỬI FEEDBACK</h3>\n"
                    + "    <div>Nha Sĩ:" + dentist.getFullName() + " - " + dentistRate + "&#9733;</div>\n"
                    + "    <div>Dịch Vụ:" + service.getName() + " - " + serviceRate + "&#9733;</div>\n"
                    + "    <h5 style=\"color: red;\">Nha Khoa chúng tôi xin chân thành cảm ơn những đánh giá của bạn. Chúng thật sự có ích"
                    + " với chúng tôi trong việc cải thiện trải nghiệm khách hàng!</h5>\n"
                    + "</body>\n"
                    + "</html>";
            Runnable myRunnable = new Runnable() {
                public void run() {
                    // Các công việc được thực thi trong luồng này
                    SendMail.sendEmail(user.getEmail(), "Mail from Dental Clinic System", content, "Thanks Mail");
                }
            };
            Thread thread = new Thread(myRunnable);
            thread.start();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher("TreatmentCourseController").forward(request, response);
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
