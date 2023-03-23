<%@page import="com.oss.entities.OrderProduct"%>
<%@page import="com.oss.entities.Order"%>
<%@page import="com.oss.dao.OrderDao"%>
<%@page import="com.oss.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.oss.helper.ConnectionProvider"%>
<%@page import="com.oss.dao.CategoryDao"%>
<%@page import="com.oss.entities.Message"%>
<%@page import="com.oss.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="./header.jsp" %>
<script src="./../javascript/updateorder.js" defer type="text/javascript"></script>
<p><br></p>
<p>
<h5 class="text-center text-warning">Orders</h5>
</p>
<p><br></p>
<section class="container-fluid p-2" style="justify-content: center;">
    <%        
        int pageno = 1;
        int limit = 4;
        String spageno = request.getParameter("pageno");
        if (spageno != null) {
            pageno = Integer.parseInt(spageno);
        }
        int offset = (pageno - 1) * limit;
        OrderDao orderdao = new OrderDao(ConnectionProvider.getConnection());
        List<Order> orders = orderdao.getAllOrderPanding("not delivered", limit, offset);
        int i = 1;
        int j = 1;
        for (Order order : orders) {
    %>
    <table class="table">
        <thead class="thead-dark">
            <tr>
                <th scope="col text-center">#</th>
                <th scope="col">Order Date</th>
                <th scope="col">Expected Date</th>
                <th scope="col">Status</th>
                <th scope="col">Total Item</th>
                <th scope="col">Net Price</th>
                <th scope="col">Shipping Address</th>
                <th scope="col">Payment Method</th>
                <th scope="col">Update Order</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th scope="row"><%= i%></th>
                <th scope="row"><%=order.getDateoforder()%></th>
                <th scope="row"><input type="text" name="expecteddate" id="expecteddate<%=order.getOrderid()%>" disabled value="<%=order.getExpecteddate()%>"></th>
                <th scope="row"><input type="text" name="status" id="status<%=order.getOrderid()%>" disabled value="<%=order.getStatus()%>"></th>
                <th scope="row"><%=order.getTotalitem()%></th>
                <th scope="row"><%=order.getTotalprice() - order.getTotaldiscount()%></th>
                <th scope="row" style="text-transform: capitalize;">
                    <%=order.getShipaddress()%><br>
                    <%=order.getCity()%><br>
                    <%=order.getState()%>-<%=order.getZip()%><br>
                    <%=order.getCountry()%><br>
                </th>
                <th scope="row"><%=order.getPaymentmethod()%></th>
                <th scope="row">
                    <button onclick="makeDisable(<%=order.getOrderid()%>)" title="delete item" class="btn btn-success">
                        <img src="./../cartimg/ok.png" style="width: 10px; height: 10px;"></button>
                    <button onclick="updateOrder(<%=order.getOrderid()%>)" title="update Quantity" class="btn btn-primary">
                        <img src="./../cartimg/edit.png" style="width: 10px; height: 10px;">
                    </button>
                </th>
            </tr>
            <tr>
                <!--product in order-->
                <!--<table class="table">-->
        <thead class="thead-light">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Product Image</th>
                <th scope="col">Product Name</th>
                <th scope="col">Product Quantity</th>
                <th scope="col">Product Price</th>
                <th scope="col">Product Discount</th>
                <th scope="col">Product Category</th>
                <th scope="col">Product Net Price</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<OrderProduct> orderproducts = orderdao.getOrderProductByOrderid(order.getOrderid());
                for (OrderProduct orderproduct : orderproducts) {
            %>
            <tr>
                <th scope="row"><%=j%></th>
                <th scope="row"><img style="width: 50px; height: 50px;" src="./../productimg/<%=orderproduct.getProductimage()%>"></th>
                <th scope="row"><%=orderproduct.getProductname()%></th>
                <th scope="row"><%=orderproduct.getQuantity()%></th>
                <th scope="row"><%=orderproduct.getProductprice()%></th>
                <th scope="row"><%=orderproduct.getProductdiscount()%></th>
                <th scope="row"><%=orderproduct.getProductcategory()%></th>
                <th scope="row"><%=orderproduct.getNetprice()%></th>
            </tr>
            <%
                    j++;
                }
                j = 1;
            %>
        </tbody>
        <!--</table>-->
        <!--end of product in order-->
        </tr>
        </tbody>
    </table>
    <p><br></p>
    <p><br></p>
        <%
                i++;
            }
        %>
</section>
<!--manage order section end-->
<!--pagination for product-->
<section class="container">
    <ul class="pagination justify-content-center" style="margin:20px 0">
        <li class="page-item active" style="width: 50px;">
            <a class="page-link" href="./ManageOrder.jsp?pageno=1">1</a>
        </li>&nbsp;
        <%
            int itr = 1;
            int countorder = orderdao.countPendingOrders();
            int pagecount = 1;
            if (countorder % 4 == 0) {
                pagecount = ((int) (countorder / limit));
            } else {
                pagecount = ((int) (countorder / limit)) + 1;
            }
            for (itr = 2; itr <= pagecount; itr++) {
        %>
        <li class="page-item active" style="width: 50px;">
            <a class="page-link" href="./ManageOrder.jsp?pageno=<%=itr%>"><%=itr%></a>
        </li>&nbsp;
        <%
            }
        %>
    </ul>
</section>
<%@include file="./footer.jsp" %>
</body>
</html>