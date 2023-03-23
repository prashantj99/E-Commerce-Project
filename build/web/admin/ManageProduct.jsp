<%-- 
    Document   : ManageProduct
--%>
<%@page import="com.oss.dao.DiscountDao"%>
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
<script src="./../javascript/updateproduct.js" type="text/javascript"></script>
<!--end of header-->
<section class="container">
    <div class="row" style="justify-content: center;">
        <h4 class="text-center text-warning">
            Manage Product
        </h4>
    </div>
    <p><br></p>
    <p><hr></p>
    <p><br></p>
    <div class="row bg-dark text-white" style="justify-content: center; height:40px;">
        <div class="col-md-2"><b>Product Image</b></div>
        <div class="col-md-2"><b>Product Name</b></div>
        <div class="col-md-2"><b>Product Price</b></div>
        <div class="col-md-2"><b>Product Quantity</b></div>
        <div class="col-md-2"><b>Product Discount</b></div>
        <div class="col-md-2"><b>Product Action</b></div>
    </div>
    <p><br></p>
        <%            
            int pageno = 1;
            int limit = 4;
            String spageno = request.getParameter("pageno");
            if (spageno != null) {
                pageno = Integer.parseInt(spageno);
            }
            int offset = (pageno - 1) * limit;
            DiscountDao ddao = new DiscountDao(ConnectionProvider.getConnection());
            ProductDao pdao = new ProductDao(ConnectionProvider.getConnection());
            List<Product> products = pdao.getAllProduct(limit,offset);
            for (Product product : products) {
        %>
    <div class="row" style="justify-content: center;">
        <div class="col-md-2">
            <img style="width: 50px; height: 50px;" src="./../productimg/<%=product.getProductimage()%>"/>
        </div>
        <div class="col-md-2"><%=product.getProductname()%></div>
        <div class="col-md-2"><%=product.getProductprice()%></div>
        <div class="col-md-2"><input type="text" id="quantity<%=product.getProductid()%>" disabled value="<%=product.getQuantity()%>"></div>
        <div class="col-md-2"><%=ddao.getDiscountByCategory(product.getCategoryid())%> % <span class="text-success">OFF</span></div>
        <div class="col-md-2">
            <button onclick="makeDisableProduct(<%=product.getProductid()%>)" title="delete item" class="btn btn-success">
                <img src="./../cartimg/ok.png" style="width: 10px; height: 10px;"></button>
            <button onclick="updateProduct(<%=product.getProductid()%>)" title="update Quantity" class="btn btn-primary">
                <img src="./../cartimg/edit.png" style="width: 10px; height: 10px;">
            </button>
        </div>
    </div>
    <p><br></p>
    <p><hr></p>
    <%
        }
    %>
</section>
<!--pagination for product-->
<section class="container">
    <ul class="pagination justify-content-center" style="margin:20px 0">
        <li class="page-item active" style="width: 50px;">
            <a class="page-link" href="./ManageProduct.jsp?pageno=1">1</a>
        </li>&nbsp;
        <%
            int i = 1;
            int countproduct = pdao.countProduct();
            int pagecount = 1;
            if (countproduct % 4 == 0) {
                pagecount = ((int) (countproduct / limit));
            } else {
                pagecount = ((int) (countproduct / limit)) + 1;
            }
            for (i = 2; i <= pagecount; i++) {
        %>
        <li class="page-item active" style="width: 50px;">
            <a class="page-link" href="./ManageProduct.jsp?pageno=<%=i%>"><%=i%></a>
        </li>&nbsp;
        <%
            }
        %>
    </ul>
</section>
<%@include file="./footer.jsp" %>
</body>
</html>