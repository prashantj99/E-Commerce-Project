<%@page import="com.oss.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.oss.dao.CategoryDao"%>
<%@page import="com.oss.helper.ConnectionProvider"%>
<div class="container-fluid bg-dark" style="align-items: center; justify-content: center;">
    <ul class="nav bg-dark text-white" style="width: 100%">
        <li class="nav-item">
            <a class="nav-link text-white text-center" href="./adminpage.jsp">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-white text-center" href="./AddCategory.jsp">Add Category</a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-white text-center" href="./AddProduct.jsp">Add Product</a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-white text-center" href="./ManageProduct.jsp">Manage Product</a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-white text-center" href="./AddDiscount.jsp">Add Discount</a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-white text-center" href="./ManageOrder.jsp">Manage Order</a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-white text-center" href="./ViewCustomer.jsp">View Customers</a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-white text-center" href="./Sales.jsp">Sales Report</a>
        </li>
    </ul>
    <div class="row">
        <div class="col-md-2">
            
        </div>
    </div>
</div>