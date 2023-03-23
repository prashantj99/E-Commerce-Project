<%-- 
    Document   : FetchSalesReport
--%>
<%@page import="com.oss.entities.OrderProduct"%>
<%@page import="java.util.List"%>
<%@page import="com.oss.helper.ConnectionProvider"%>
<%@page import="com.oss.dao.OrderDao"%>
<%@include file="./../commonlinkpage.jsp" %>
<div class="container-fluid" style="justify-content: center;">
    <div class="row bg-dark text-white" style="justify-content: center; height:40px;">
        <div class="col-md-2"><b>Month</b></div>
        <div class="col-md-2"><b>Year</b></div>
        <div class="col-md-2"><b>Orders Made</b></div>
        <div class="col-md-2"><b>Product Sold</b></div>
        <div class="col-md-2"><b>Total Income</b></div>
    </div>
    <p><br></p>
</div>
<%
    int year=Integer.parseInt(request.getParameter("year"));
    int month=Integer.parseInt(request.getParameter("month"));
    OrderDao lstdao=new OrderDao(ConnectionProvider.getConnection());
    List<String> orderids=lstdao.getAllOrderByMonthYear(month, year);
    int totalordermade=lstdao.countTotalOrderByYearMonth(month, year);
    int totalproductsold=0;
    float totalincome=0.0f;
    String[] months = {"January","Febuary", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
    for(String orderid : orderids){
        List<OrderProduct> ordpdts=lstdao.getOrderProductByOrderid(orderid);
        for(OrderProduct pdt : ordpdts){
            totalproductsold+=pdt.getQuantity();
            totalincome+=pdt.getNetprice();
        }
    }
%>
<div class="container-fluid" style="justify-content: center;">
    <div class="row" style="justify-content: center;">
        <div class="col-md-2"><b><%=months[month]%></b></div>
        <div class="col-md-2"><b><%=year%></b></div>
        <div class="col-md-2"><%=totalordermade %></div>
        <div class="col-md-2"><%=totalproductsold %></div>
        <div class="col-md-2"><%=totalincome %></div>
    </div>
</div>