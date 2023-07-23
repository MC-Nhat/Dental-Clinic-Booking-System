/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Appointment;

import DAL.AppointmentDAO;
import Models.Appointment;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import Util.SendMail;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class CreateAppointmentController extends HttpServlet {

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

//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            String namePatient = request.getParameter("patient");   
//            String nameDentist = request.getParameter("dentist");
//            String date = request.getParameter("createDateAppoint");
//            String description = request.getParameter("createDescriptionAppoint");
//            AppointmentDAO appointDAO = new AppointmentDAO();
//            ArrayList<Appointment> listAppoint = appointDAO.getAllAppointment();
//            /*
//            for (Appointment appoint : listAppoint) {
//                if (appoint.getDate().equals(date)) {
//                    
//                }
//            }
//            */            
//            boolean check = appointDAO.insertAppointment(namePatient, nameDentist, Date.valueOf(date), description, "0");
//            if (check) {
//                request.getRequestDispatcher("MainController?action=searchAppointmentByDate").forward(request, response);
//            }
//            else request.getRequestDispatcher("MainController?action=searchAppointmentByDate").forward(request, response);
//        }
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            try {
                int userid = Integer.parseInt(request.getParameter("userid"));
                int denid = Integer.parseInt(request.getParameter("dentistid"));
                String date = request.getParameter("txtDate");
                final String time = request.getParameter("txtTime");
                final String note = request.getParameter("txtNote");
                final String email = request.getParameter("useremail");
                final String username = request.getParameter("username");
                LocalDate localDate = LocalDate.parse(date);
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                final String formattedDate = localDate.format(formatter);
                int check = AppointmentDAO.ReceiveAppointment(userid, denid, date, time, note);
                if (check == 1) {
                    Runnable myRunnable = new Runnable() {
                        public void run() {
                            // Các công việc được thực thi trong luồng này
                            SendMail.sendEmail(email, "Mail from Dental Clinic System", "Chào anh/chị,<br>"
                                    + "<br>"
                                    + "Xin chân thành cảm ơn vì đã đặt lịch hẹn với chúng tôi. Dưới đây là thông tin chi tiết về cuộc hẹn của bạn:<br>"
                                    + "<br>"
                                    + "Khách hàng: " + username + "<br>"
                                    + "Ngày hẹn: " + formattedDate + "<br>"
                                    + "Thời gian: " + time + "<br>"
                                    + "Chú thích (nếu có): " + note + "<br>"
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
                    out.println("<html><body>");
                    out.println("<script>");
                    out.println("alert('Bạn đã đặt lịch hẹn thành công, chúng tôi sẽ liên hệ bạn sớm nhất có thể.');");
                    out.println("window.location.href='index.jsp';");  // Thay 'your_jsp_page.jsp' bằng trang JSP bạn muốn chuyển hướng sau khi thông báo
                    out.println("</script>");
                    out.println("</body></html>");
                } else if (check == 0) {
                    out.println("<html><body>");
                    out.println("<script>");
                    out.println("alert('Đặt lịch hẹn thất bại, vui lòng thử lại sau');");
                    out.println("window.location.href='index.jsp';");  // Thay 'your_jsp_page.jsp' bằng trang JSP bạn muốn chuyển hướng sau khi thông báo
                    out.println("</script>");
                    out.println("</body></html>");
                } else if (check == 2) {
                    out.println("<html><body>");
                    out.println("<script>");
                    out.println("alert('Đặt lịch hẹn thất bại, có vẻ như bạn đã đặt lịch hẹn trước đó. Nếu bạn muốn thay đổi lịch hẹn, xin vui lòng hãy liên hệ cho chúng tôi qua hotline số điện thoại +84 374 312 384 để được hỗ trợ cập nhật trực tiếp.');");
                    out.println("window.location.href='index.jsp';");  // Thay 'your_jsp_page.jsp' bằng trang JSP bạn muốn chuyển hướng sau khi thông báo
                    out.println("</script>");
                    out.println("</body></html>");
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
