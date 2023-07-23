/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author Admin
 */
@Getter
@Setter
@ToString
public class TreatmentCourseDetail {

    private int id;
    private String nameTreatment;
    private String treatmentdate;
    private String treatmenttime;
    private String nameService;
    private String description;
    private boolean status;
    private boolean statusPaid;
    private boolean statusFeedBack;

    public TreatmentCourseDetail(int id, String treatmentdate, String treatmenttime, String nameService, String description, boolean status, boolean statusPaid) {
        this.id = id;
        this.treatmentdate = treatmentdate;
        this.treatmenttime = treatmenttime;
        this.nameService = nameService;
        this.description = description;
        this.status = status;
        this.statusPaid = statusPaid;
        
    }

    public TreatmentCourseDetail(int id, String nameTreatment, String treatmentdate, String treatmenttime, String nameService, String description, boolean status, boolean statusPaid, boolean statusFeedBack) {
        this.id = id;
        this.nameTreatment = nameTreatment;
        this.treatmentdate = treatmentdate;
        this.treatmenttime = treatmenttime;
        this.nameService = nameService;
        this.description = description;
        this.status = status;
        this.statusPaid = statusPaid;
        this.statusFeedBack = statusFeedBack;
    }
    
    
    public TreatmentCourseDetail(String nameTreatment, String treatmentdate, String treatmenttime, String nameService, String description, boolean status, boolean statusPaid) {
        this.nameTreatment = nameTreatment;
        this.treatmentdate = treatmentdate;
        this.treatmenttime = treatmenttime;
        this.nameService = nameService;
        this.description = description;
        this.status = status;
        this.statusPaid = statusPaid;
    }
}
