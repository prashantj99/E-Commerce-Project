package com.oss.servlet;

import com.oss.dao.ContactUsDao;
import com.oss.entities.ContactUs;
import com.oss.entities.Message;
import com.oss.helper.ConnectionProvider;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
//servlet to handle contactus form

public class ContactUsServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
//            get all form parameters
//first name
            String fname = request.getParameter("fname");
//last name
            String lname = request.getParameter("lname");
//email
            String email = request.getParameter("email");
//country
            String country = request.getParameter("country");
            if(!country.equals("India")){
                response.sendError(500);
            }
//subject/msg
            String subject = request.getParameter("subject");
//saving to database
            ContactUs c=new ContactUs(fname, lname, email, subject);
             ContactUsDao dao=new ContactUsDao(ConnectionProvider.getConnection());
             dao.addContactUs(c);
             if(dao.isSuccess()){
                 Message msg=new Message("alert alert-success","Your Query Has been Successfully submitted please wait we will reply you very soon :)");
                 HttpSession session=request.getSession();
                 session.setAttribute("contactmsg", msg);
                 response.sendRedirect("./user/ContactUs.jsp");
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
    }// </editor-fold>

}
