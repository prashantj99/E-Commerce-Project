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
<!--end of header-->        <!--summary section-->
<section class="container-fulid" style="background-color: #ecf0f1!important; padding: 20px!important;">
    <div class="row" style="margin-bottom: 10px;">
        <div class="col-md-2">
            <!--empty-->
        </div>
        <!--total customer-->
        <div class="col-md-2">
            <div class="card">
                <div class="card-body">
                    <div class="container text-center">
                        <img src=".././images/groupuser.png" style="max-width: 100px;">
                    </div>
                    <h5 class="text-center">Customer</h5>
                    <%                                UserDao countdao = new UserDao(ConnectionProvider.getConnection());

                    %>
                    <h5 class="text-center"><%=countdao.countUsers()%></h5>
                    <h6 class="text-center">
                        <a href=".././admin/ViewCustomer.jsp" class="btn btn-primary text-white text-center">Click Here</a>
                    </h6>
                </div>
            </div>
        </div>
        <div class="col-md-2">
            <div class="card">
                <div class="card-body">
                    <div class="container text-center">
                        <img src=".././images/sales.png" style="max-width: 100px;">
                    </div>
                    <h5 class="text-center">Sales</h5>
                    <h5 class="text-center">120</h5>
                    <h6 class="text-center">
                        <a href=".././admin/Sales.jsp" class="btn btn-primary text-white text-center">Click Here</a>
                    </h6>
                </div>
            </div>
        </div>
        <!--total product-->
        <div class="col-md-2">
            <div class="card">
                <div class="card-body">
                    <div class="container text-center">
                        <img src=".././images/producticon.png" style="max-width: 100px;">
                    </div>
                    <h5 class="text-center">Manage Product</h5>
                    <%
                        ProductDao countPdao = new ProductDao(ConnectionProvider.getConnection());
                    %>
                    <h5 class="text-center"><%=countPdao.countProduct()%></h5>
                    <h6 class="text-center">
                        <a href=".././admin/ManageProduct.jsp" class="btn btn-primary text-white text-center">Click Here</a>
                    </h6>
                </div>
            </div>
        </div>
        <!--total category-->
        <div class="col-md-2">
            <div class="card">
                <div class="card-body">
                    <div class="container text-center">
                        <img src=".././images/category.png" style="max-width: 100px;">
                    </div>
                    <h5 class="text-center">Category</h5>
                    <%
                        CategoryDao countCdao = new CategoryDao(ConnectionProvider.getConnection());
                    %>
                    <h5 class="text-center"><%=countCdao.countCategory()%></h5>
                    <h6 class="text-center">
                        <a href=".././admin/AddCategory.jsp" class="btn btn-primary text-white text-center">Click Here</a>
                    </h6>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <!--empty-->
    </div>
</section>
<br>
<hr>
<!--list of product having zero quantity-->
<section class="container-fulid" style="background-color: #ecf0f1!important; padding: 20px!important;">
    <h3 class="text-center text-warning">Out Of Stock Product</h3>
    <br>
    <div class="container">
        <div class="row bg-dark" style="justify-content: center; height: 40px;">
            <div class="col-md-2 text-white"><b>#</b></div>
            <div class="col-md-2 text-white"><b>Product Image</b></div>
            <div class="col-md-2 text-white"><b>Product Name</b></div>
            <div class="col-md-2 text-white"><b>Product Price</b></div>
            <div class="col-md-2 text-white"><b>Product Quantity</b></div>
            <div class="col-md-2 text-white"><b>Product Category</b></div>
        </div>
        <br><br>
        <%
            CategoryDao cats = new CategoryDao(ConnectionProvider.getConnection());
            ProductDao empdao = new ProductDao(ConnectionProvider.getConnection());
            List<Product> prodt = empdao.getProductHavingQuantityZero(0);
            int i = 1;
            for (Product p : prodt) {
        %>
        <div class="row" style="justify-content: center;">
            <div class="col-md-2"><%= i%></div>
            <div class="col-md-2">
                <img style="width: 50px; height: 50px;" src="./../productimg/<%=p.getProductimage()%>"/>
            </div>
            <div class="col-md-2"><%=p.getProductname()%></div>
            <div class="col-md-2"><%=p.getProductprice()%></div>
            <div class="col-md-2"><%=p.getQuantity()%></div>
            <div class="col-md-2"><%=cats.getCategoryById(p.getCategoryid()).getCategorytitle()%></div>
        </div>
        <%
                i++;
            }
            i = 1;
        %>
    </div>
</section>
<%@include file="./footer.jsp" %>
</body>
</html>
