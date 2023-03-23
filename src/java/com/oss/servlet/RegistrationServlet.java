package com.oss.servlet;

import com.oss.dao.UserDao;
import com.oss.entities.EncryptPassword;
import com.oss.entities.Message;
import com.oss.entities.User;
import com.oss.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class RegistrationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String check = request.getParameter("confirmtc");
            if (check == null) {
                Message msg=new Message("text-center alert alert-danger","Error !!! Please Fill All Fields");
                session.setAttribute("regmsg", msg);
                response.sendRedirect("./RegistrationPage.jsp");
                return;
            }
            String username = request.getParameter("username").trim();
            String userpassword = request.getParameter("userpassword").trim();
            String chkpass = request.getParameter("chkpass").trim();
            if((!chkpass.equals(userpassword)) || userpassword.length()<8){
                Message msg=new Message("text-center alert alert-danger","Error in password !!!");
                session.setAttribute("regmsg", msg);
                response.sendRedirect("./RegistrationPage.jsp");
                return;
            }
//            encrypt password
            String encpassword=EncryptPassword.cryptWithMD5(userpassword);
            String useremail = request.getParameter("useremail").trim();
            String address = request.getParameter("address").trim();
            String phone = request.getParameter("phone").trim();
            if(phone.length()!=10){
                Message msg=new Message("text-center alert alert-danger","Error in Phone Number !!! please enter a valid phone number");
                session.setAttribute("regmsg", msg);
                response.sendRedirect("./RegistrationPage.jsp");
                return;
            }
            User ruser = new User(username, encpassword, useremail, address, phone);
            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            dao.registerUser(ruser);
            boolean status=dao.isSuccess();
            if (status) {
                response.sendRedirect("./LoginPage.jsp");
            } else if(status == false){
                Message msg=new Message("text-center alert alert-danger","Error try again!!! may be you are already registered");
                session.setAttribute("regmsg", msg);
                response.sendRedirect("./RegistrationPage.jsp");
            }else{
                response.sendError(500);
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
