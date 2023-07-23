/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author Admin
 */
public class Service {
    private int id;
    private String name;
    private String mota;
    private float price;
    private boolean status;
//    private String comment;

//    public Service(int id, String name, String mota, float price, String comment) {
//        this.id = id;
//        this.name = name;
//        this.mota = mota;
//        this.price = price;
//        this.comment = comment;
//    }
//
//    public String getComment() {
//        return comment;
//    }
//
//    public void setComment(String comment) {
//        this.comment = comment;
//    }

    
    public Service(int id, String name, String mota, float price, boolean status) {
        this.id = id;
        this.name = name;
        this.mota = mota;
        this.price = price;
        this.status = status;
    }
    public Service(int id, String name){
        this.id = id;
        this.mota = mota;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Service{" + "id=" + id + ", name=" + name + ", mota=" + mota + ", price=" + price + '}';
    }

   

    

    
    

    
    
}
