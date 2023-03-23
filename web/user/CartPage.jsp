<%@page import="com.oss.entities.Message"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : CartPage
--%>
<%@page import="com.oss.dao.DiscountDao"%>
<%@page import="com.oss.entities.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.oss.entities.Product"%>
<%@page import="com.oss.dao.CartDao"%>
<%@page import="com.oss.helper.ConnectionProvider"%>
<%@page import="com.oss.dao.ProductDao"%>
<%@page import="com.oss.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="./commonheader.jsp"%>
<%@include file="./../commoncategoryheader.jsp" %>
    <%    
        Message msg = (Message) session.getAttribute("checkouterror");
        if (msg != null) {
    %>
<div class="<%=msg.getMsgClass()%>" role="alert">
    <%=msg.getContent()%>
</div>
<%
        session.removeAttribute("checkouterror");
    }
%>
<p><br></p>
<p><br></p>
<!--start of cart-->
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8" id="cart_msg">
            <!--Cart Message--> 
        </div>
        <div class="col-md-2"></div>
    </div>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-7">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 style="color:#e67e22;">Your's Cart</h3>
                    <br>
                    <hr>

                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-2 col-xs-2"><b>Action</b></div>
                        <div class="col-md-2 col-xs-2"><b>Product Image</b></div>
                        <div class="col-md-2 col-xs-2"><b>Product Name</b></div>
                        <div class="col-md-2 col-xs-2"><b>Quantity</b></div>
                        <div class="col-md-2 col-xs-2"><b>Product Price</b></div>
                        <div class="col-md-2 col-xs-2"><b>Price in &#8377;</b></div>
                    </div>
                    <div class="row">
                        <!--divider-->
                        <hr>
                    </div>
                    <div id="cart_checkout"></div>
                    <%                            CartDao cdao = new CartDao(ConnectionProvider.getConnection());
                        ProductDao productdao = new ProductDao(ConnectionProvider.getConnection());
                        int cartid = currentuser.getUserid();
                        List<Cart> cartlist = cdao.getCartByUserid(cartid);
                        float totalprice = 0.0f;
                        for (Cart csingle : cartlist) {
                            Product p = productdao.getProductByProductid(csingle.getProductid());
                    %>
                    <!--cart action btn-->
                    <div class="row">
                        <div class="col-md-2">
                            <div class="btn-group">
                                <button onclick="deleteItem(<%=p.getProductid()%>)" title="delete item" class="btn btn-danger">
                                    <img src="./../cartimg/trash.png" style="width: 10px; height: 10px;"></button>
                                <button onclick="updateItem(<%=p.getProductid()%>)" title="update Quantity" class="btn btn-primary">
                                    <img src="./../cartimg/edit.png" style="width: 10px; height: 10px;">
                                </button>
                            </div>
                        </div>
                        <!--product image-->
                        <div class="col-md-2"><img src="./../productimg/<%=p.getProductimage()%>" style="width: 50px; height: 50px;"></div>
                        <!--product name-->
                        <div class="col-md-2"><%=p.getProductname()%></div>
                        <!--product quantity-->
                        <div class="col-md-2"><input style="width: 100%; height: 100%;" type="number" id="<%=p.getProductid()%>" name="quantity" min="1" max="50" value="<%=csingle.getProductquantity()%>"></div>
                        <!--total product price-->
                        <%
                            DiscountDao ddao = new DiscountDao(ConnectionProvider.getConnection());
                            float op = p.getProductprice();
                            float discount = ddao.getDiscountByCategory(p.getCategoryid());
                            float d = (float) (op - op * (discount / 100.0));
                            totalprice += d * csingle.getProductquantity();
                        %>
                        <div class="col-md-2"><%=d * csingle.getProductquantity()%></div>
                        <!--each product price-->
                        <div class="col-md-2"><%=d%></div>
                    </div>    
                    <%
                        }
                    %> 
                    <div class="row">
                        <div class="col-md-8">
                            <br><br>
                            <hr>
                        </div>
                        <div class="col-md-4">
                            <b>Total &#8377; <%= totalprice%></b>
                        </div> 
                    </div> 
                </div>
                <!--redirect to checkout page-->
                <div class="row panel-footer float-right">
                    <a href="./homepage.jsp" style="width: 150px; height: 50px;" class="btn btn-primary text-white">
                        <img style="width: 50px; height: 50px;" src="./../images/buying.png" alt="Shop More">Continue Shopping 
                    </a>
                    <p>
                        &nbsp;&nbsp;
                    </p>    
                    <!--edited 22-03-2021-->
                    <!--check is empty cart-->
                    <%
                        if (cartlist.isEmpty()) {
                    %>
                    <a href="#" onclick="errorMsg()" style="width: 150px; height: 50px;" class="btn btn-primary text-white">
                        <img style="width: 50px; height: 50px;" src="./../cartimg/checkout.png" alt="ready to checkout"> CheckOut 
                    </a>
                    <%
                    } else {
                    %>
                    <a href="./CheckOut.jsp" style="width: 150px; height: 50px;" class="btn btn-primary text-white">
                        <img style="width: 50px; height: 50px;" src="./../cartimg/checkout.png" alt="ready to checkout"> CheckOut 
                    </a>
                    <%
                        }
                    %>
                    <br>
                </div>
            </div>
        </div>
        <!--order summary-->
        <div class="col-md-3">
            <ul class="list-group">
                <li class="list-group-item bg-secondary text-white">Cart Summary</li>
                <li class="list-group-item"><p>Shipping and additional costs are calculated based pn the values you have selected</p></li>
                <li class="list-group-item">Cart Subtotal <span class="float-right">&#8377; <%=totalprice%></span></li>
                <li class="list-group-item">Total Items  <span class="float-right"><%=cdao.countCartItem(cartid)%></span></li>
                <li class="list-group-item">Tax <span class="float-right">&#8377; 0</span></li>
            </ul>
        </div>
    </div>
</div>
<%@include file="./footer.jsp" %>
<script type="text/javascript">
    function updateItem(productid) {
        var id = String('#' + productid);
        console.log(id);
        var d = $(id).val();
        console.log("q : " + d);
        $.ajax({
            url: './../CartOperationServlet',
            data: {productid: parseInt(productid), quantity: parseInt(d), operation: 'update'},
            success: function (data, textStatus, jqXHR) {
                console.log(data);
                if (data === 'done') {
                    alert("Cart Updated");
                }
                location.reload();
            }
        });
    }
    function deleteItem(productid) {
        $.ajax({
            url: './../CartOperationServlet',
            data: {productid: parseInt(productid), operation: 'delete'},
            success: function (data, textStatus, jqXHR) {
                console.log(data);
                if (data === 'done') {
                    alert("Cart Item Deleted");
                }
                location.reload();
            }
        });
    }
    function errorMsg() {
        alert("Error Yout Cart is Empty!!!");
    }
</script>
</body>
</html>