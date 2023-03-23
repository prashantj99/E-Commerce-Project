package com.oss.servlet;

import com.oss.dao.UserDao;
import com.oss.entities.EncryptPassword;
import com.oss.entities.Message;
import com.oss.entities.User;
import com.oss.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateForgotPassword extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession sessionObj = request.getSession(true);
            User user = (User) sessionObj.getAttribute("sessionuser");
//            if session is out 
            if (user == null) {
                Message forgotmsg = new Message("alert alert-danger text-center", "Your session has been invalidated please try again !!!");
                sessionObj.setAttribute("forgotmsg", forgotmsg);
                System.err.println("error in session validation !!!");
                response.sendRedirect("./forgotpassword.jsp");
            } else {
                String sessionotp = (String) sessionObj.getAttribute("authotp");
                String reqotp = request.getParameter("otp").trim();
//                validate otp
                if (!reqotp.equals(sessionotp)) {
//                    resubmit form with correct otp
                    Message msg = new Message("alert alert-danger text-center", "Wrong OTP !!!");
                    sessionObj.setAttribute("successmsg", msg);
                    response.sendRedirect("./verify.jsp");
                }
                String emailtoupdate = request.getParameter("useremail").trim();
                String passwordtoupdate = request.getParameter("userpassword");
//                if()
//                if session is valid then update user
                UserDao dao = new UserDao(ConnectionProvider.getConnection());
                String encpassword=EncryptPassword.cryptWithMD5(passwordtoupdate);
                user.setUserpassword(encpassword);
                dao.updateUserPasswordByUserid(user);
                if (dao.isSuccess()) {
                    Message msg = new Message("alert alert-success text-center", "Password Updated successfully");
                    sessionObj.setAttribute("msg", msg);
                    System.out.println("succes in session validation");
                    response.sendRedirect("./LoginPage.jsp");
                } else {
                    System.err.println("error in update user  !!!");
                    response.sendRedirect("./forgotpassword.jsp");
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
