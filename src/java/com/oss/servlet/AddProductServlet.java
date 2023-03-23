package com.oss.servlet;

import com.oss.dao.ProductDao;
import com.oss.entities.*;
import com.oss.helper.ConnectionProvider;
import java.io.*;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
@MultipartConfig
public class AddProductServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           String productname=request.getParameter("productname");
           String productdescription=request.getParameter("productdescription");
           float productprice=Float.parseFloat(request.getParameter("productprice"));
           int quantity=Integer.parseInt(request.getParameter("quantity"));
           int categoryid=Integer.parseInt(request.getParameter("categoryid"));
           Part part=request.getPart("productimage");
           String productimage=part.getSubmittedFileName();
           Product p=new Product(productname, productdescription, productprice, quantity,categoryid,productimage);
           ProductDao dao=new ProductDao(ConnectionProvider.getConnection());
           String path=request.getRealPath("productimg")+File.separator+part.getSubmittedFileName();
           System.out.println(path);
           dao.addProduct(p);
           if(dao.isSuccess()){
               try {
//                   uploading file

                   FileOutputStream fos=new FileOutputStream(path);
                    
                   InputStream is=part.getInputStream();
                   
//                   reading data
                    byte[] data=new byte[is.available()];
                           
                    is.read(data);
                    
//                    writing data to target file
                    fos.write(data);
                   
//                    closing 
                    fos.flush();
                    fos.close();
                   
               } catch (Exception e) {
                   System.out.println("error in upload");
                   e.printStackTrace();
               }
               HttpSession session=request.getSession();
               Message msg=new Message("alert-success text-center","Product Added Successfully");
               session.setAttribute("pmsg", msg);
               response.sendRedirect("./admin/AddProduct.jsp");
           }else{
               HttpSession session=request.getSession();
               Message msg=new Message("alter-danger text-align","Product not Added !!!");
               session.setAttribute("pmsg", msg);
               response.sendRedirect("./admin/AddProduct.jsp");
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
