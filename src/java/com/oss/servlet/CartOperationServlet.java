package com.oss.servlet;

import com.oss.dao.CartDao;
import com.oss.entities.User;
import com.oss.helper.ConnectionProvider;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class CartOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session=request.getSession();
            User currentuser=(User)session.getAttribute("user");
            int quantity=1;
            int cartid =currentuser.getUserid();
            int productid = Integer.parseInt(request.getParameter("productid"));
            if(request.getParameter("quantity")!=null){
                quantity=Integer.parseInt(request.getParameter("quantity"));
            }else{
                response.sendRedirect("./user/CartPage.jsp");
            }
            String operation = request.getParameter("operation");
            CartDao cdao = new CartDao(ConnectionProvider.getConnection());
            if (operation.trim().equals("update")) {
//                update operation
                cdao.updateProductQuantityByProductidAndCartid(productid, cartid,quantity);
                if (cdao.isSuccess()) {
                    out.println(cdao.getQuantityByProductidAndCartid(productid, cartid));
                } else {
                    out.println("error in update");
                }
            } else if (operation.trim().equals("delete")) {
//                delete operation      
                cdao.deleteCartItemByProductidAndCartid(productid, cartid);
                if (cdao.isSuccess()) {
                    out.println("done");
                } else {
                    out.println("error in delete");
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
