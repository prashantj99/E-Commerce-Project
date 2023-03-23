package com.oss.servlet;

import com.oss.dao.OrderDao;
import com.oss.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateOrderServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String orderid = request.getParameter("orderid");
            String expdate = request.getParameter("expecteddate");
            String status = request.getParameter("status");
            Timestamp expecteddate = Timestamp.valueOf(expdate);
            OrderDao orderdao = new OrderDao(ConnectionProvider.getConnection());
            orderdao.updateOrderByOrderid(orderid, expecteddate, status);
            if (orderdao.isSuccess()) {
                out.println("done");
            } else {
                out.println("undone");
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
