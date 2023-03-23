package com.oss.servlet;

import com.oss.entities.*;
import com.oss.helper.*;
import com.oss.dao.*;
import java.io.*;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class CheckoutServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            User currentuser = (User) session.getAttribute("user");
            int userid = currentuser.getUserid();
            int cartid = userid;
            String useremail = request.getParameter("useremail");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String country = request.getParameter("country");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            int zip = Integer.parseInt(request.getParameter("zip"));
            String cardname = request.getParameter("cardname");
            String cardno = request.getParameter("cardno");
            String expire = request.getParameter("expire");
            String cvv = request.getParameter("cvv");
//            calculation
            CartDao cdao = new CartDao(ConnectionProvider.getConnection());
            ProductDao productdao = new ProductDao(ConnectionProvider.getConnection());
            List<Cart> cartlist = cdao.getCartByUserid(cartid);
            if (cartlist.isEmpty()) {
                Message msg = new Message("text-center alert alert-danger", "your cart is empty");
                session.setAttribute("checkouterror", msg);
                response.sendRedirect("./user/CartPage.jsp");
                return;
            }
//            fetch all products by product id from cart
//              create empty list
            List<OrderProduct> oplist = new ArrayList<>();
            CategoryDao catdao = new CategoryDao(ConnectionProvider.getConnection());
            float totalprice = 0.0f;
            float totaldiscount = 0.0f;
            int totalitem = 0;
            DiscountDao ddao = new DiscountDao(ConnectionProvider.getConnection());
            List<Integer> pidlist = new ArrayList<>();
            for (Cart csingle : cartlist) {
//                get each product by product id
                Product product = productdao.getProductByProductid(csingle.getProductid());
                int quantity = csingle.getProductquantity();
                //update available product quantity
                int qty = productdao.getProductQuantityByProductid(csingle.getProductid());
                System.out.println("Before Update 102 : "+qty);
                if (qty != 0 && qty >= quantity) {
                    productdao.updateProductByProductid(csingle.getProductid(), qty - quantity);
                    System.out.println("Quantity Updated :"+productdao.getProductQuantityByProductid(csingle.getProductid()));
                } else if(qty < quantity){
                    String errormsg="Sorry !!! the product quantiy for "+product.getProductname()+"you have selected is insufficient(availabe only "+product.getQuantity()+") to process your request";
                    Message msg = new Message("text-center alert alert-danger", errormsg);
                    session.setAttribute("checkouterror", msg);
                    System.out.println("error line 67 : "+qty);
                    response.sendRedirect("./user/CartPage.jsp");
                    return;
                }
//                end
                float eachproductprice = product.getProductprice();
                totalitem += quantity;
                totalprice += eachproductprice * quantity;
                float discountvalue = ddao.getDiscountByCategory(product.getCategoryid());
                float netprice = (float) (quantity * (eachproductprice - (eachproductprice * (discountvalue / 100.0))));
                String productcategory = catdao.getCategoryById(product.getCategoryid()).getCategorytitle();
                totaldiscount += quantity * (eachproductprice * (discountvalue / 100.0));
                OrderProduct orderp = new OrderProduct(discountvalue, netprice, productcategory, product.getProductid(), product.getProductname(),
                        product.getProductdescription(), product.getProductprice(), csingle.getProductquantity(), product.getCategoryid(), product.getProductimage());
                oplist.add(orderp);
            }
//            end of calculation
//add to order table            
            OrderDao orderdao = new OrderDao(ConnectionProvider.getConnection());
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            Long orderid = new Long(timestamp.getTime());
            Order order = new Order(orderid.toString() + userid, userid, totalprice, totalitem, totaldiscount, address, cardno, city, state, zip, country);
            orderdao.addOrder(order);
            if (orderdao.isSuccess()) {
                System.out.println("done");
//                update user
                String combineAddress = address + " " + city + " " + state + "-" + zip + " " + country;
                User user = new User(userid, useremail, combineAddress, phone);
                UserDao udao = new UserDao(ConnectionProvider.getConnection());
                udao.updateUserByUserid(user);
                if (udao.isSuccess()) {
//                      update cart
                    CartDao cartdao = new CartDao(ConnectionProvider.getConnection());
                    ProductDao opdao = new ProductDao(ConnectionProvider.getConnection());
                    for (OrderProduct lst : oplist) {
                        cartdao.deleteCartItemByProductidAndCartid(lst.getProductid(), cartid);
                    }
                    for (OrderProduct op : oplist) {
                        opdao.addProductByOrderid(orderid.toString() + userid, op);
                    }
                    response.sendRedirect("./user/MyOrder.jsp");
                } else {
                    System.out.println("error in user update");
                }
            } else {
                System.out.println("not done");
                response.sendRedirect("./CartPage.jsp");
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
