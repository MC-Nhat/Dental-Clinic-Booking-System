/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.AppointmentDAO;
import DAL.DentistDAO;
import DAL.FeedbackServiceDAO;
import DAL.TreatmentCourseDAO;
import DAL.UserDAO;
import Models.Appointment;
import com.google.gson.Gson;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet("/dashboard")
public class DashBoardController extends HttpServlet {

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
        session.setAttribute("activeLink", "dashboardLink");
        try{
            TreatmentCourseDAO treatmentcourseDAO = new TreatmentCourseDAO();
            UserDAO userDAO = new UserDAO();
            AppointmentDAO appointmentDAO = new AppointmentDAO();
            ArrayList<Appointment> list = appointmentDAO.getAllAppointment();
            ArrayList<Integer> listRate = FeedbackServiceDAO.getRates();
            Date date = new java.sql.Date(123, 7, 20);
            int month[] = new int[30];
            for (Appointment appointment : list) {
                if (date.getDate() > appointment.getDate().getDate()) {
                    month[29 - (date.getDate() - appointment.getDate().getDate())]++;
                }
            }
            Gson gson = new Gson();
            String jsonData = gson.toJson(month);
            session.setAttribute("appData", jsonData);
            request.setAttribute("oneStar", listRate.get(0));
            request.setAttribute("twoStar", listRate.get(1));
            request.setAttribute("threeStar", listRate.get(2));
            request.setAttribute("fourStar", listRate.get(3));
            request.setAttribute("fiveStar", listRate.get(4));
            request.setAttribute("REVENUE", treatmentcourseDAO.getRevenue());
            request.setAttribute("PATIENT", userDAO.getAllNumberPatient());
            request.setAttribute("DENTIST", DentistDAO.getAllDentist().size());
            url = "admin.jsp";
        }catch(Exception e){
            e.printStackTrace();
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
