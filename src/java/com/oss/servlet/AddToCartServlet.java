package com.oss.servlet;

import com.oss.dao.CartDao;
import com.oss.entities.Cart;
import com.oss.entities.User;
import com.oss.helper.ConnectionProvider;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
public class AddToCartServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session=request.getSession();
            User currentuser=(User)session.getAttribute("user");
//            from server user id
            int fuserid=Integer.parseInt(request.getParameter("userid"));
//            from session user id
            int userid=currentuser.getUserid();
//            validate session
            if(userid!=fuserid){
                out.println("undone");
                response.sendError(500);
                return;
            }
            int productid=Integer.parseInt(request.getParameter("productid"));
            int productquantity=Integer.parseInt(request.getParameter("productquantity"));
            CartDao cdao=new CartDao(ConnectionProvider.getConnection());
            Cart cart=new Cart(userid, productid, productquantity);
            cdao.addToCart(cart);
            if(cdao.isSuccess()){
                out.println("done");
            }else{
                out.println("undone");
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
