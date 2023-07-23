/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

/**
 *
 * @author Admin
 */
public class Constants {

    public static String FACEBOOK_APP_ID = "254936600471264";
    public static String FACEBOOK_APP_SECRET = "638057edae9007c5c4b31067ce51868f";
    public static String FACEBOOK_REDIRECT_URL = "http://localhost:8084/SWP391-SE1743/login-facebook";
    public static String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";

    //Dùng để lưu client_id, client_secret, redirect_uri của ứng dung JSPServet-AccessGoogle
    public static String GOOGLE_CLIENT_ID = "48607043062-12cu71hg20p1gljop1vm7s6fjnjmcv3b.apps.googleusercontent.com";
    public static String GOOGLE_CLIENT_SECRET = "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";
    public static String GOOGLE_REDIRECT_URI = "http://localhost:8084/SWP391-SE1743/login-google";
    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
    public static String GOOGLE_GRANT_TYPE = "authorization_code";
}
