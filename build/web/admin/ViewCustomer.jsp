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
<!--end of header-->
<section class="container">
    <div class="row" style="justify-content: center;">
        <h4 class="text-center text-warning">
            Your Customers
        </h4>
    </div>
    <p><br></p>
    <p><hr></p>
    <p><br></p>
    <div class="row bg-dark text-white" style="justify-content: center; height:40px;">
        <div class="col-md-2"><b>User Name</b></div>
        <div class="col-md-2"><b>User Email</b></div>
        <div class="col-md-2"><b>User Address</b></div>
        <div class="col-md-2"><b>User Phone Number</b></div>
    </div>
    <p><br></p>
        <%        UserDao myuserdao = new UserDao(ConnectionProvider.getConnection());
            List<User> userlist = myuserdao.getAllUser("normal");
            for (User usr : userlist) {
        %>
    <div class="row" style="justify-content: center;">
        <div class="col-md-2"><%=usr.getUsername()%></div>
        <div class="col-md-2"><%=usr.getUseremail()%></div>
        <div class="col-md-2"><%=usr.getAddress()%></div>
        <div class="col-md-2"><%=usr.getPhone()%></div>
    </div>
    <p><br></p>
    <p><hr></p>
        <%
            }
        %>
</section>
<%@include file="./footer.jsp" %>
</body>
</html>