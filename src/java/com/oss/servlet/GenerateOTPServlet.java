package com.oss.servlet;

import com.oss.dao.UserDao;
import com.oss.entities.*;
import com.oss.helper.ConnectionProvider;
import com.oss.helper.SendEmail;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GenerateOTPServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            //feth form value
            String email = request.getParameter("useremail");
//           get user from database whose email is this
            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            User user = dao.getUserByEmail(email);
            if (user == null) {
                Message forgotmsg = new Message("alert alert-danger text-center", "Failed to send verification email please enter registered email !!!");
                session.setAttribute("forgotmsg", forgotmsg);
                System.out.println("Failed to send verification email please enter registered email !!!");
                response.sendRedirect("./forgotpassword.jsp");
                return;
            }
            //get the 6-digit code
            String otp = SendEmail.getRandom();
            //call the send email method
//           please provide reciver email and organization mail and password
            String orgmail = "sender email";
            String orgpass = "sender password";
            boolean test = SendEmail.sendEmail(email, orgmail, orgpass, otp);
            //check if the email send successfully
            if (test) {
                Message successmsg = new Message("alert alert-success text-center", "Your are verified Enter New Password and OTP send to your registered mail You Have only 5 minutes to submit");
                session.setAttribute("successmsg", successmsg);
                session.setAttribute("authotp", otp);
                HttpSession sessionObj = request.getSession(true);
                sessionObj.setMaxInactiveInterval(5 * 60);
                sessionObj.setAttribute("sessionuser", user);
                response.sendRedirect("./verify.jsp");
            } else {
                Message forgotmsg = new Message("alert alert-danger text-center", "You have an error in sending email");
                session.setAttribute("forgotmsg", forgotmsg);
                System.out.println("Failed to send verification email");
                response.sendRedirect("./forgotpassword.jsp");
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
