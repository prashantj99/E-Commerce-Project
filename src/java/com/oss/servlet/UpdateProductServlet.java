package com.oss.servlet;

import com.oss.dao.ProductDao;
import com.oss.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateProductServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String pid = request.getParameter("productid").trim();
            String q = request.getParameter("quantity").trim();
            int productid = Integer.parseInt(pid);
            int quantity = Integer.parseInt(q);
            ProductDao dao = new ProductDao(ConnectionProvider.getConnection());
            dao.updateProductByProductid(productid, quantity);
            if (dao.isSuccess()) {
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
    }
}
