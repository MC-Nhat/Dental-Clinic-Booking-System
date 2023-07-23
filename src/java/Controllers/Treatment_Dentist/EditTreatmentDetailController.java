/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Treatment_Dentist;

import DAL.TreatmentCourseDetailDAO;
import DAL.UserDAO;
import Models.TreatmentCourseDetail;
import Models.User;
import Util.SendMail;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class EditTreatmentDetailController extends HttpServlet {

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
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String idTreatment =(String) session.getAttribute("idTreatment");
            String idDetail = request.getParameter("idDetail");
            final String DateDetail = request.getParameter("editDateDetail");
            final String TimeDetail = request.getParameter("editTimeDetail");
            String ServiceDetail = request.getParameter("editServiceDetail");
            String DescriptionDetail = request.getParameter("editDescriptionDetail");
            String StatusDetail = request.getParameter("editStatusDetail");
            String StatusPaidDetail = request.getParameter("editStatusPaidDetail");
            
            TreatmentCourseDetail den = TreatmentCourseDetailDAO.getTreatmentDetailByID(idDetail);
            String denOld = den.getDescription();
            if (DescriptionDetail == null || DescriptionDetail.isEmpty()) {
                DescriptionDetail = denOld; 
            }
            
            boolean check = TreatmentCourseDetailDAO.updateTreatmentDetail(idDetail, DateDetail, TimeDetail,
                    ServiceDetail, DescriptionDetail, StatusDetail, StatusPaidDetail);
            
            //gui mail cho khach hang
            LocalDate localDate = LocalDate.parse(DateDetail);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            final String formattedDate = localDate.format(formatter);
                
            int idPatient = TreatmentCourseDetailDAO.getIDPatientByTreatmentID(idTreatment);
            final User patient = UserDAO.getPatient(idPatient);
            if (check) {
                Runnable myRunnable = new Runnable() {
                    public void run() {
                        // Các công việc được thực thi trong luồng này
                        SendMail.sendEmail(patient.getEmail(), "Mail from Dental Clinic System", "Chào anh/chị,<br>"
                                + "<br>"
                                + "Xin thông báo lịch hẹn khám của quý khách đã được THAY ĐỔI. Vui lòng đọc kĩ những thay đổi sau đây để anh/chị đến khám đúng lịch hẹn.<br>"
                                + "Dưới đây là thông tin chi tiết lịch hẹn khám của bạn:<br>"
                                + "<br>" 
                                + "Khách hàng: " + patient.getFullName() + "<br>"
                                + "Ngày hẹn: " + formattedDate + "<br>"
                                + "Thời gian: " + TimeDetail + "<br>"
                                + "Địa chỉ: Quận 9, Thành phố Hồ Chí Minh<br>"
                                + "<br>"
                                + "Chúng tôi rất mong được gặp bạn vào ngày hẹn trên. Để đảm bảo quá trình hẹn được diễn ra thuận lợi, vui lòng lưu ý các thông tin sau:<br>"
                                + "<br>"
                                + "1. Đảm bảo bạn có đến đúng giờ để không làm ảnh hưởng đến lịch trình của chúng tôi và các khách hàng khác.<br>"
                                + "2. Mang theo tất cả các tài liệu, giấy tờ cần thiết hoặc bất kỳ mục đích đặc biệt nào liên quan đến cuộc hẹn của bạn.<br>"
                                + "3. Trong trường hợp bạn không thể tham dự cuộc hẹn này, vui lòng liên hệ với chúng tôi để chúng ta có thể sắp xếp lại một thời gian thích hợp khác.<br>"
                                + "<br>"
                                + "Nếu bạn có bất kỳ câu hỏi hoặc yêu cầu bổ sung nào, xin vui lòng liên hệ với chúng tôi qua email hoặc số điện thoại dưới đây.<br>"
                                + "<br>"
                                + "Email: DentalClinic@gmail.com<br>"
                                + "Số điện thoại: +84 374 312 384<br>"
                                + "<br>"
                                + "Chúng tôi rất mong được gặp bạn và hỗ trợ bạn trong cuộc hẹn sắp tới. Xin vui lòng cho chúng tôi biết nếu có bất kỳ thay đổi nào trong lịch trình của bạn.<br>"
                                + "<br>"
                                + "Trân trọng,<br>"
                                + "Nha Khoa DentCare", "Thông tin lịch hẹn");
                    }
                };
                Thread thread = new Thread(myRunnable);
                thread.start();
            }
            request.getRequestDispatcher("MainController?action=ViewTreatmentDetailByCustomer").forward(request, response);
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
