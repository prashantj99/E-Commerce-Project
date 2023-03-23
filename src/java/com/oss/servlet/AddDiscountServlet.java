package com.oss.servlet;

import com.oss.dao.*;
import com.oss.entities.*;
import com.oss.helper.ConnectionProvider;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class AddDiscountServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            float discount = Float.parseFloat(request.getParameter("discount"));
            String discountdescription = request.getParameter("discountdescription");
            int categoryid = Integer.parseInt(request.getParameter("categoryid"));
            Discount d = new Discount(discount, discountdescription, categoryid);
            DiscountDao dao = new DiscountDao(ConnectionProvider.getConnection());
            dao.saveDiscount(d);
            if (dao.isSuccess()) {
                HttpSession session = request.getSession();
                Message msg = new Message("alert-success text-center", "Discount Added Successfully");
                session.setAttribute("dmsg", msg);
                response.sendRedirect("./admin/AddDiscount.jsp");
            } else {
                HttpSession session = request.getSession();
                Message msg = new Message("alter-danger text-align", "Discount not Added !!!");
                session.setAttribute("dmsg", msg);
                response.sendRedirect("./admin/AddDiscount.jsp");
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
