/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Treatment_Dentist;

import DAL.TreatmentCourseDAO;
import Models.TreatmentCourse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class SearchTreatmentCourseController extends HttpServlet {

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
            String txtSearch = request.getParameter("txt");
            String idDentistTreatment = request.getParameter("idDentistTreatment");
            ArrayList<TreatmentCourse> listTreatment = TreatmentCourseDAO.searchTreatmentCourseByNamePatient(idDentistTreatment,txtSearch);

            if (listTreatment != null && !listTreatment.isEmpty()) {
                for (TreatmentCourse list : listTreatment) {
                    out.print("<tr>\n"
+ "                             <td>" + list.getId() + "</td>\n"
+ "                             <td>" + list.getNamecustomer() + "</td>\n"
+ "                             <td>" + list.getNameTreatment() + "</td>\n");
                    if(list.isStatus() == true){
                        out.print("<td style=\"color: red; font-weight: bold;\">Đã hoàn thành</td>");
                    } else {
                        out.print("<td style=\"color: #35BA67; font-weight: bold;\">Chưa hoàn thành</td>");
                    }
                    out.print("<td><a href=\"MainController?action=ViewTreatmentDetailByCustomer&idTreatment=" + list.getId() + "&nameCus=" + list.getNamecustomer()+ "\" class=\"btn btn-primary\">Chi tiết</a></td>");
                    out.print("</tr>");
                }
            }

            //request.setAttribute("TreatmentList", listTreatment);
            //request.getRequestDispatcher("view-patients-of-dentist.jsp").forward(request, response);

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
