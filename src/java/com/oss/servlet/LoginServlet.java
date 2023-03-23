package com.oss.servlet;

import com.oss.dao.UserDao;
import com.oss.entities.*;
import com.oss.helper.ConnectionProvider;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String email = request.getParameter("useremail");
            String password = request.getParameter("userpassword");
            //            encrypt password
            String encpassword=EncryptPassword.cryptWithMD5(password);
            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            System.out.println(email);
            System.out.println(password);
            System.out.println(encpassword);
            User user = dao.getUserByEmailAndPassword(email, encpassword);
            if (dao.isSuccess()) {
                session.setAttribute("user", user);
                if (user != null) {
                    if (user.getUsertype().equals("admin")) {
                        response.sendRedirect("./admin/adminpage.jsp");
                    } else {
                        response.sendRedirect("./user/homepage.jsp");
                    }
                }
            } else {
                session.setAttribute("user", null);
                Message msg = new Message("alert-danger text-center", "Your Login is Unsuccessfull !!");
                session.setAttribute("msg", msg);
                response.sendRedirect("./LoginPage.jsp");
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
    }// </editor-fold>

}
