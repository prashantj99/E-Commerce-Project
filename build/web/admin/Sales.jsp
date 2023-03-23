<%-- 
    Document   : Sales
--%>
<%@page import="com.oss.dao.OrderDao"%>
<%@page import="com.oss.entities.Product"%>
<%@page import="com.oss.dao.CategoryDao"%>
<%@page import="com.oss.dao.ProductDao"%>
<%@page import="com.oss.dao.UserDao"%>
<%@page import="com.oss.helper.ConnectionProvider"%>
<%@page import="com.oss.entities.Message"%>
<%@page import="com.oss.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--header-->
<%@include file="./header.jsp" %>
<script src="./../javascript/fetchsalesreport.js" defer type="text/javascript"></script>
<!--end of header-->
<section class="container">
    <div class="row" style="justify-content: center;">
        <h4 class="text-center text-warning">
            Sales Report
        </h4>
    </div>
    <p><br></p>
    <p><br></p>
    <div class="row  text-white" style="justify-content: center; height:40px;">
        <div class="col-md-6">
            <select id="month" class="form-control float-right">
                <option selected value="1">January</option>
                <%                    String[] month = {"Febuary", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
                    for (int i = 2; i <= 12; i++) {
                %>
                <option value="<%=i%>"><%=month[i - 2]%></option>
                <%
                    }
                %>
            </select>
        </div>
        <div class="col-md-6">
            <select id="year" class="form-control float-left">
                <option selected value="2020"><%=2020%></option>
                <%
                    for (int i = 2021; i <= 2030; i++) {
                %>
                <option  value="<%= i%>"><%=i%></option>
                <%
                    }
                %>
            </select>
        </div>
        <div class="container  text-white" style="justify-content: center; height:40px;">
            <p><br></p>
            <p><br></p>
        </div>
        <div class="row  text-white" style="justify-content: center; height:40px;">
            <button class="btn btn-outline-primary" onclick="fetchReport()">Apply</button>
        </div>
    </div>
    <p><br></p>
    <p><br></p>
    <p><br></p>
    <!--start of record-->
    <section class="container-fluid" id="salesrecord">
        <!--sales record-->
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
    </section>
    <p><br></p>
    <p><br></p>
    <div class="row" style="justify-content: center; height:40px;">
        <button class="btn btn-warning" onclick="openWindow()">Print</button>
    </div>
    <!--end of record-->
</section>
<%@include file="./footer.jsp" %>
</body>
</html>