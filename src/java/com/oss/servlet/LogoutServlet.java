package com.oss.servlet;

import com.oss.entities.*;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class LogoutServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            User currentuser = (User) session.getAttribute("user");
            if (currentuser != null) {
                if (currentuser.getUsertype().equals("admin")) {
                    currentuser = null;
                    session.setAttribute("user", null);
                    Message msg = new Message("alert alert-success text-center", "You are successfully Logout");
                    session.setAttribute("msg", msg);
                    response.sendRedirect("./LoginPage.jsp");
                } else {
                    currentuser = null;
                    session.setAttribute("user", null);
                    response.sendRedirect("./user/homepage.jsp");
                }
            } else {
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
    }
}
