/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class MainController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final String LOGIN = "LoginController";
    private final String SIGNUP = "SignUpController";
    private final String LOGOUT = "LogoutController";
    private final String SEND = "javaMailController";
    private final String MAIL = "confirmMailController";

    private final String DENTIST = "DentistController";
    private final String DENTISTPROFILE = "DentistProfileController";
    private final String DENTISTEDIT = "EditDentistController";
    private final String DENTISTCREATE = "CreateDentistController";
    private final String DENTISTDELETE = "DeleteDentistController";
    private final String MARKETINGDENTIST = "MarketingDentistController";
    private final String MARKETINGDENTISTFROFILE = "MarketingDentistProfileController";

    private final String GETEMPLOYEEBYID = "GetEmployeeByIDController";
    private final String EDITEMPLOYEECONTROLLER = "EditEmployeeController";
    private final String ADDEMPLOYEECONTROLLER = "AddEmployeeController";
    private final String GETEMPLOYEES = "GetEmployeesController";
    private final String SEARCHEMPLOYEEBYROLE = "SearchEmployeeByRoleController";
    private final String SEARCHEMPLOYEEBYNAME = "SearchEmployeeByNameController";
    private final String DELETEEMPLOYEEBYID = "DeleteEmployeeController";

    private final String SERVICECONTROLLER = "loadServiceController";
    private final String SERVICEMARKETINGCONTROLLER = "loadServiceMarketingController";
    private final String ADDSERVICECONTROLLER = "addServiceController";
    private final String EDITSERVICECONTROLLER = "editServiceController";
    private final String DELETESERVICECONTROLLER = "deleteServiceController";
    private final String UPDATESERVICECONTROLLER = "updateServiceController";
    private final String SEARCHSERVICENAME = "SearchServiceByNameController";
    private final String SEARCHSERVICEUSERNAME = "SearchServiceUserByNameController";
    private final String VIEWSERVICEUSER = "ServiceUserController";

    private final String VIEWFEEDBACKDENTIST = "ViewFeedbackDentistController";
    private final String VIEWFEEDBACKSERVICE = "ViewFeedbackServiceController";
    private final String SEARCHFEEDBACKDENTIST = "SearchFeedbackDentistController";
    private final String SEARCHFEEDBACKSERVICE = "SearchFeedbackServiceController";
    private final String DELETEFEEDBACKDENTIST = "DeleteFeedbackDentistController";
    private final String DELETEFEEDBACKSERVICE = "DeleteFeedbackServiceController";

    private final String PATIENT = "Patient";
    private final String SEARCHPATIENT = "SearchPatient";
    private final String CREATEPATIENT = "AddPatient";
    private final String DELETEPATIENT = "DeletePatient";

    private final String SEARCHAPPOINTMENTBYDATE = "SearchAppointmentController";
    private final String APPOINTMENTPAGE = "appointments.jsp";
    private final String CHECKAPPOINTMENTDATE = "CheckAppointmentDateController";
    private final String CREATEAPPOINTMENT = "CreateAppointmentController";
    private final String CREATEAPPOINTMENTPAGE = "addAppointment.jsp";
    private final String APPOINTMENTEDIT = "EditAppointmentController";
    private final String APPOINTMENTCREATE = "CreateAppointmentController";

    private final String CHANGEPASSWORDPAGE = "changePassword.jsp";
    private final String CHANGEPASSWORDUSER = "changePasswordUser.jsp";
    private final String CHANGEPASSWORD = "ChangePasswordController";
    private final String CHANGEPROFILEUSER = "ChangeProfileUser";
     private final String SAVEPROFILEUSER = "UserProfileController";

    private final String CUSTOMER_DENTIST_PAGE = "customer-dentists.jsp";
    private final String CUSTOMER_SHOW_DENTIST = "ShowDentistController";
    private final String CUSTOMER_DENTIST_PROFILE_PAGE = "profileDentistByCustomer.jsp";
    private final String CUSTOMER_DENTIST_PROFILE = "profileDentistByCustomerController";

    private final String TREATMENT = "TreatmentCourseController";

    private final String LOADBILL = "BillController";
    private final String SEARCHUSERSTATUS = "SearchUserStatus";

    private final String TREATMENTOFDENTIST = "ViewTreatmentOfDentistController";
    private final String TREATMENTDETAILOFDENTIST = "ViewTreatmentDetailOfDentistController";
    private final String EDITTREATMENTDETAIL = "EditTreatmentDetailController";
    private final String ADDTREATMENTDETAIL = "AddTreatmentDetailController";
    private final String SEARCHTREATMENTCOURSE = "SearchTreatmentCourseController";

    private final String INSERTUSERLOGINBYGOOGLE = "InsertUserLoginByGoogleController";
    private final String INSERTUSERLOGINBYFACEBOOK = "InsertUserLoginByFacebookController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
     String url = "";
        try {
            String action = request.getParameter("action");
            if (action.equals("Login")) {
                url = LOGIN;
            } else if (action.equals("sendMail")) {
                url = SEND;
            } else if (action.equals("codeMail")) {
                url = MAIL;
            } else if (action.equals("dentist")) {
                url = DENTIST;
            } else if (action.equals("dentistProfile")) {
                url = DENTISTPROFILE;
            } else if (action.equals("saveDentist")) {
                url = DENTISTEDIT;
            } else if (action.equals("createDentist")) {
                url = DENTISTCREATE;
            } else if (action.equals("deleteDentist")) {
                url = DENTISTDELETE;
            } else if (action.equals("marketingdentist")) {
                url = MARKETINGDENTIST;
            } else if (action.equals("MarketingdentistProfile")) {
                url = MARKETINGDENTISTFROFILE;
            } else if (action.equals(request)) {
                url = SIGNUP;
            } else if (action.equals("GetEmployees")) {
                url = GETEMPLOYEES;
            } else if (action.equals("Search Employee By Role")) {
                url = SEARCHEMPLOYEEBYROLE;
            } else if (action.equals("Search Employee By Name")) {
                url = SEARCHEMPLOYEEBYNAME;
            } else if (action.equals("GetEmPloyeeByID")) {
                url = GETEMPLOYEEBYID;
            } else if (action.equals("Edit Employee")) {
                url = EDITEMPLOYEECONTROLLER;
            } else if (action.equals("Service")) {
                url = SERVICECONTROLLER;
            } else if (action.equals("ServiceMarketing")) {
                url = SERVICEMARKETINGCONTROLLER;
            } else if (action.equals("AddService")) {
                url = ADDSERVICECONTROLLER;
            } else if (action.equals("EditService")) {
                url = EDITSERVICECONTROLLER;
            } else if (action.equals("DeleteService")) {
                url = DELETESERVICECONTROLLER;
            } else if (action.equals("UpdateService")) {
                url = UPDATESERVICECONTROLLER;
            } else if (action.equals("Search Service By Name")) {
                url = SEARCHSERVICENAME;
            } else if (action.equals("Search Service User By Name")) {
                url = SEARCHSERVICEUSERNAME;
            } else if (action.equals("ViewService")) {
                url = VIEWSERVICEUSER;
            } else if (action.equals("View Feedback Dentist")) {
                url = VIEWFEEDBACKDENTIST;
            } else if (action.equals("View Feedback Service")) {
                url = VIEWFEEDBACKSERVICE;
            } else if (action.equals("Search Feedback Dentist")) {
                url = SEARCHFEEDBACKDENTIST;
            } else if (action.equals("Search Feedback Service")) {
                url = SEARCHFEEDBACKSERVICE;
            } else if (action.equals("Delete Feedback Dentist")) {
                url = DELETEFEEDBACKDENTIST;
            } else if (action.equals("Delete Feedback Service")) {
                url = DELETEFEEDBACKSERVICE;
            } else if (action.equals("Add Employee")) {
                url = ADDEMPLOYEECONTROLLER;
            } else if (action.equals("patient")) {
                url = PATIENT;
            } else if (action.equals("Tìm kiếm")) {
                url = SEARCHPATIENT;
            } else if (action.equals("Create")) {
                url = CREATEPATIENT;
            } else if (action.equals("Logout")) {
                url = LOGOUT;
            } else if (action.equals("deletePatient")) {
                url = DELETEPATIENT;
            } else if (action.equals("DeleteEmployee")) {
                url = DELETEEMPLOYEEBYID;
            } else if (action.equals("searchAppointmentByDate")) {
                url = SEARCHAPPOINTMENTBYDATE;
            } else if (action.equals("appointment")) {
                url = APPOINTMENTPAGE;
            } else if (action.equals("Check Appointment Date")) {
                url = CHECKAPPOINTMENTDATE;
            } else if (action.equals("Create Appointment")) {
                url = CREATEAPPOINTMENT;
            } else if (action.equals("CreateAppointmentPage")) {
                url = CREATEAPPOINTMENTPAGE;
            } else if (action.equals("createAppoint")) {
                url = APPOINTMENTCREATE;
            } else if (action.equals("editAppoint")) {
                url = APPOINTMENTEDIT;
            } else if (action.equals("changePassPage")) {
                url = CHANGEPASSWORDPAGE;
            } else if (action.equals("changePassUser")) {
                url = CHANGEPASSWORDUSER;
            } else if (action.equals("saveChangePass")) {
                url = CHANGEPASSWORD;
            } else if (action.equals("customer_dentists_page")) {
                url = CUSTOMER_DENTIST_PAGE;
            } else if (action.equals("showDentist")) {
                url = CUSTOMER_SHOW_DENTIST;
            } else if (action.equals("showProfileDentistController")) {
                url = CUSTOMER_DENTIST_PROFILE;
            } else if (action.equals("showProfileDentist")) {
                url = CUSTOMER_DENTIST_PROFILE_PAGE;
            } else if (action.equals("TreatmentCourse")) {
                url = TREATMENT;
            } else if (action.equals("loadbill")) {
                url = LOADBILL;
            } else if (action.equals("Search")) {
                url = SEARCHUSERSTATUS;
            } else if (action.equals("ViewTreatmentByCustomer")) {
                url = TREATMENTOFDENTIST;
            } else if (action.equals("ViewTreatmentDetailByCustomer")) {
                url = TREATMENTDETAILOFDENTIST;
            } else if (action.equals("editDetail")) {
                url = EDITTREATMENTDETAIL;
            } else if (action.equals("addDetail")) {
                url = ADDTREATMENTDETAIL;
            } else if (action.equals("SearchTreatmentCourse")) {
                url = SEARCHTREATMENTCOURSE;
            } else if (action.equals("logbygg")) {
                url = INSERTUSERLOGINBYGOOGLE;
            } else if (action.equals("logbyfb")) {
                url = INSERTUSERLOGINBYFACEBOOK;
//            } else if (action.equals("changeProfileUser")) {
//                url = CHANGEPROFILEUSER;
            } else if (action.equals("saveChangeProfileUser")) {
                url = CHANGEPROFILEUSER ;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
