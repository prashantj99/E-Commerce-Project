package com.oss.servlet;

import com.oss.dao.CategoryDao;
import com.oss.entities.*;
import com.oss.helper.ConnectionProvider;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

@MultipartConfig
public class AddCategoryServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String categorytitle = request.getParameter("categorytitle");
            String categorydescription = request.getParameter("categorydescription");
            Part part = request.getPart("categoryimage");
            String categoryimage = part.getSubmittedFileName();
            Category c = new Category(categorytitle, categoryimage, categorydescription);
            CategoryDao dao = new CategoryDao(ConnectionProvider.getConnection());
            String path = request.getRealPath("categoryimg") + File.separator + part.getSubmittedFileName();
            System.out.println(path);
            dao.addCategory(c);
            if (dao.isSuccess()) {
                try {
//                   uploading file

                    FileOutputStream fos = new FileOutputStream(path);

                    InputStream is = part.getInputStream();

//                   reading data
                    byte[] data = new byte[is.available()];

                    is.read(data);

//                    writing data to target file
                    fos.write(data);

//                    closing 
                    fos.flush();
                    fos.close();

                } catch (Exception e) {
                    System.out.println("error in category upload");
                    e.printStackTrace();
                }
                HttpSession session = request.getSession();
                Message msg = new Message("alert-success text-center", "Category Added Successfully");
                session.setAttribute("cmsg", msg);
                response.sendRedirect("./admin/AddCategory.jsp");
            } else {
                HttpSession session = request.getSession();
                Message msg = new Message("alter-danger text-align", "Category not Added !!!");
                session.setAttribute("cmsg", msg);
                response.sendRedirect("./admin/AddCategory.jsp");
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
