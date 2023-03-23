<%-- 
    Document   : fetchcurrentprevorder
--%>
<%@page errorPage="./Error.jsp" %>
<%@page import="com.oss.entities.*"%>
<%@page import="java.util.List"%>
<%@page import="com.oss.dao.OrderDao"%>
<%@page import="com.oss.helper.ConnectionProvider"%>
<!--current order-->
<%
    OrderDao myorderdao = new OrderDao(ConnectionProvider.getConnection());
    String orderstatus=request.getParameter("orderstatus");
    User currentuser=(User)session.getAttribute("user");
    int userid=currentuser.getUserid();
    if(currentuser==null){
        response.sendRedirect("./Error.jsp");
    }
    List<Order> orders = myorderdao.getAllOrderPanding(orderstatus,userid);
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
                <!--empty-->
            </td>
            <%
            } else {
            %>
            <td  class="text-right">
                <button class="btn btn-outline-success" onclick="printInvoice(<%=order.getOrderid()%>)">Print Invoice</button>
            </td>
            <td  class="text-left">
                <a  class="btn btn-outline-primary" href="./AddReview.jsp?orderid=<%=order.getOrderid() %>">Add Review</a>
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