<%-- 
    Document   : invoice
--%>
<%@page import="com.oss.entities.OrderProduct"%>
<%@page import="com.oss.entities.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.oss.dao.OrderDao"%>
<%@page import="com.oss.helper.ConnectionProvider"%>
<%@include file="./../commonlinkpage.jsp" %>
<%@page errorPage="./Error.jsp" %>
<div class="container" id="invoicebox">
    <!--current order-->
    <section class="container-fluid p-2" style="justify-content: center;">
        <%
            OrderDao orderdao = new OrderDao(ConnectionProvider.getConnection());
            String orderid = request.getParameter("orderid");
            Order order = orderdao.getOrderByOrderid(orderid);
            int j = 1;
        %>
        <div class="container-fluid">
            <div class="row" style="height: 80px; ">
                <div class="col-md-6" style="text-transform: capitalize;">
                    <h3 class="text-primary">Invoice</h3>
                    <h6 class="text-left">online shopping site</h6>
                    <h6 class="text-left">India</h6>
                </div>
                <div class="col-md-6">
                    <h3 class="text-right text-secondary">Online Shopping Site</h3>
                </div>
            </div>
            <div class="row" style="justify-content: center;">
                <table class="table table-borderless" >
                    <thead >
                        <tr>
                            <th colspan="2" scope="col">Bill To</th>
                            <th colspan="2" scope="col">Ship To</th>
                            <th colspan="3" scope="col">Invoice#</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <!--bill to-->
                            <td colspan="2" scope="row" style="text-transform: capitalize;">
                                <%=order.getShipaddress()%><br>
                                <%=order.getCity()%><br>
                                <%=order.getState()%>-<%=order.getZip()%><br>
                                <%=order.getCountry()%><br>
                            </td>
                            <!--ship to-->
                            <td colspan="2"  scope="row" style="text-transform: capitalize;">
                                <%=order.getShipaddress()%><br>
                                <%=order.getCity()%><br>
                                <%=order.getState()%>-<%=order.getZip()%><br>
                                <%=order.getCountry()%><br>
                            </td>
                            <td colspan="3">
                                <div class="col-md-12">
                                    <ul class="list-group" style="list-style-type: none;">
                                        <!--yyyy-mm-dd-->
                                        <li >Invoice Date <span class="float-right"><%=order.getDateoforder().toString().substring(0, 11)%></span></li>
                                        <li >Invoice No <span class="float-right"><%=order.getOrderid()%></span></li>
                                        <li >Total Items  <span class="float-right"> <%=order.getTotalitem()%></span></li>
                                        <li >Total Price  <span class="float-right"> &#8377; <%=order.getTotalprice() - order.getTotaldiscount()%></span></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <!--product in order-->
                            <!--<table class="table">-->
                    <thead class="thead-light">
                        <tr>
                            <th scope="col">#</th>
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
                            float totalprice = 0.0f;
                            for (OrderProduct orderproduct : orderproducts) {
                        %>
                        <tr>
                            <th scope="row"><%=j%></th>
                            <th scope="row"><%=orderproduct.getProductname()%></th>
                            <th scope="row"><%=orderproduct.getQuantity()%></th>
                            <th scope="row"><%=orderproduct.getProductprice()%></th>
                            <th scope="row"><%=orderproduct.getProductdiscount()%></th>
                            <th scope="row"><%=orderproduct.getProductcategory()%></th>
                            <th scope="row"><%=orderproduct.getNetprice()%></th>
                        </tr>
                        <%
                                totalprice += orderproduct.getNetprice();
                                j++;
                            }
                        %>
                        <tr>
                            <td colspan="5"></td>
                            <td scope="row">Grand Total</td>
                            <td>&#8377; <%=totalprice%></td>
                        </tr>
                    </tbody>
                    <!--</table>-->
                    <!--end of product in order-->
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="container-fluid">
                <div class="row" style="justify-content: center;">
                    <button type="button" class="btn btn-primary" onclick="window.print()">Print</button>
                </div>
            </div>
    </section>