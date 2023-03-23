package com.oss.servlet;

import com.oss.dao.ReviewDao;
import com.oss.entities.Review;
import com.oss.helper.ConnectionProvider;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
public class AddReviewServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String comment=request.getParameter("comment");
            int starcount=Integer.parseInt(request.getParameter("starcount"));
            int productid=Integer.parseInt(request.getParameter("productid"));
            int userid=Integer.parseInt(request.getParameter("userid"));
            ReviewDao dao=new ReviewDao(ConnectionProvider.getConnection());
            Review rw=new Review(productid, userid, comment, starcount);
            dao.addReview(rw);
            if(dao.isSuccess()){
                out.println("done");
            }else{
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
