<%@page import="com.oss.entities.Category"%>
<%@page import="com.oss.dao.CategoryDao"%>
<%@page import="com.oss.entities.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.oss.helper.ConnectionProvider"%>
<%@page import="com.oss.dao.OrderDao"%>
<%@page import="com.oss.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="./commonheader.jsp"%>
<script src="./../javascript/printinvoice.js" defer></script>
<script src="./../javascript/fetchcurrprevorder.js" defer></script>
<%@include file="./../commoncategoryheader.jsp" %>
<div class="container-fluid">
    <!--start of order banner-->
    <div class="row p-5">
        <h2 class="col-md-6">
            Your Orders
        </h2>
    </div>
    <!--end of order banner-->
    <!--start of customer order-->
    <div class="row pl-5">
        <button onclick="currentOrder()" class="btn btn-outline-primary">Current Order</button>
        <p>
            &nbsp;&nbsp;&nbsp;
        </p>
        <button onclick="previousOrder()" class="btn btn-outline-primary">Previous Order</button>
    </div>
    <hr>
    <div class="container" id="orderbox">
        <!--current order-->
        <%                OrderDao myorderdao = new OrderDao(ConnectionProvider.getConnection());
            List<Order> orders = myorderdao.getAllOrderByUserid(currentuser.getUserid());
            int i = 1;
            for (Order order : orders) {
        %>
        <table class="table table-striped" style="width: 100%">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Sipping Address</th>
                    <th scope="col">Status</th>
                    <th scope="col">Payment Method</th>
                    <th scope="col">Order Summary</th>
                </tr>
            </thead>
            <tbody>

                <tr>
                    <th scope="row"><%=i%></th>
                    <td>
                        <%=order.getShipaddress()%><br> 
                        <%=order.getCity()%><br>
                        <%=order.getState()%>-<%=order.getZip()%> <br>
                        <%=order.getCountry()%><br>
                    </td>
                    <td>
                        <%=order.getStatus()%>
                    </td>
                    <td>
                        <%
                            String py = order.getPaymentmethod();
                            out.println("XXXX-XXX" + py.substring(8, py.length()));
                        %>
                    </td>
                    <td class="row">
                        <div class="col-md-12">
                            <ul class="list-group">
                                <li class="list-group-item">Order Subtotal <span class="float-right">&#8377; <%=order.getTotalprice()%></span></li>
                                <li class="list-group-item">Total discount <span class="float-right">- &#8377; <%=order.getTotaldiscount()%></span></li>
                                <li class="list-group-item">Total Items  <span class="float-right"> <%=order.getTotalitem()%></span></li>
                                <li class="list-group-item">Grand Total  <span class="float-right"> &#8377; <%=order.getTotalprice() - order.getTotaldiscount()%></span></li>
                            </ul>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <!--empty-->
                    </td>
                    <%
                        if (order.getStatus().equals("not delivered")) {
                    %>
                    <td  class="text-right">
                        <button class="btn btn-outline-success" onclick="printInvoice(<%=order.getOrderid()%>)">Print Invoice</button>
                    </td>
                    <td  class="text-right">
                        <!--<a  class="btn btn-outline-primary" href="./AddReview.jsp">Add Review</a>-->
                    </td>
                    <%
                    } else {
                    %>
                    <td  class="text-right">
                        <button class="btn btn-outline-success" onclick="printInvoice(<%=order.getOrderid()%>)">Print Invoice</button>
                    </td>
                    <td  class="text-left">
                        <a  class="btn btn-outline-primary" href="./AddReview.jsp?orderid=<%=order.getOrderid()%>">Add Review</a>
                    </td>
                    <%
                        }
                    %>
                </tr>
                <%
                        i++;
                    }
                    i = 1;
                %>
            </tbody>
        </table>
    </div>
    <!--end of customer order-->
</div>
<!--order section end here-->
<%@include file="./footer.jsp" %>
</body>
</html>
