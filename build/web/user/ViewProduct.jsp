<%-- 
    Document   : ViewProduct
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="./Error.jsp" %>
<%@page import="java.io.File"%>
<%@page import="com.oss.dao.DiscountDao"%>
<%@page import="com.oss.entities.Category"%>
<%@page import="com.oss.dao.CategoryDao"%>
<%@page import="com.oss.helper.WordEditor"%>
<%@page import="java.util.List"%>
<%@page import="com.oss.entities.Product"%>
<%@page import="com.oss.helper.ConnectionProvider"%>
<%@page import="com.oss.dao.ProductDao"%>
<%@page import="com.oss.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User currentuser = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./../commonlinkpage.jsp" %>
        <link rel="stylesheet" href="./../css/commonstyle.css">
        <script src="./../javascript/jquery-3.6.0.js" defer></script>
        <script src="./../javascript/fetchproduct.js" defer></script>
        <script src="./../javascript/addToCart.js" defer></script>
        <script src="./../javascript/fetchsearchproduct.js" type="text/javascript" defer></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous"></script>
        <title>Online Shopping Site | Home Page</title>
    </head>
    <body>
        <%
            if (currentuser == null) {
        %>

        <%@include file="./normalheader.jsp" %>

        <%
            }
        %>
        <%
            if (currentuser != null) {
        %>
        <nav class="container-fluid bg-primary text-white">
            <br>
            <div class="row">
                <div class="col-md-3">
                    <a class="navbar-brand text-white" href="./homepage.jsp">Online Shopping Site</a>
                </div>
                <div class="col-md-6">
                    <form action="./SearchProductPage.jsp" class="input-group"  id="hideoncontact">
                        <input required id="keyword" name="keyword" type="text" class="form-control" placeholder="search product by name keyword e.g. mobile" aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button  style="background-color: orange;" class="btn btn-outline-white text-white" type="submit">
                                <img style="width: 20px; height: 20px;" src="./../images/magnifying-glass.png" alt="search">
                            </button>
                        </div>
                    </form>
                </div>
                <div class="col-md-3">
                    <div class="row">
                        <div class="col-md-2">
                            <div class="dropdown">
                                <button class="dropbtn text-center" style="width: 41px; height:41px; border-radius: 50%; padding: 0px;">
                                    <img style="width: 100%; height: 100%;" src="./../images/userdefault.png" alt="logo">
                                </button>
                                <div class="dropdown-content">
                                    <a href="#" class="text-center" title="<%=currentuser.getUsername()%>">
                                        Hello <%=currentuser.getUsername()%>
                                    </a>
                                    <a href="./MyOrder.jsp" class="text-center">Orders</a>
                                    <a href="./CartPage.jsp" class="text-center">
                                        <img style="width: 20px; height: 20px;" src="./../images/shopping-cart.png">
                                    </a>
                                    <a href="./../LogoutServlet" class="text-center">Logout</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2 text-center">
                            <a class="nav-link text-white" href="./ContactUs.jsp" class="text-center" title="contact us">
                                <img src="./../images/contactus.png" style="width: 30px; height: 30px;" >
                            </a>
                        </div>
                        <div class="col-md-2 text-center">
                            <a class="nav-link text-white" href="./AboutUs.jsp" class="text-center" title="aboutus">
                                <img src="./../images/question.png" style="width: 30px; height: 30px;" >
                            </a>
                        </div>
                        <div class="col-md-8"></div>
                    </div><!--edited-->
                </div>
            </div>
        </nav>
        <%
            }
        %>
        <!--end of header-->
        <%@include file="./../commoncategoryheader.jsp" %>
        <section class="container-fuild">
            <%                    int cid = 1;
                String scid = request.getParameter("categoryid");
                if (scid != null) {
                    cid = Integer.parseInt(scid);
                }
                CategoryDao cdao1 = new CategoryDao(ConnectionProvider.getConnection());
                Category cathead = cdao1.getCategoryById(cid);
            %>
            <div class="container">
                <h1 class="text-center">
                    <%=cathead.getCategorytitle()%>
                </h1>
                <p class="text-center">
                    <%=cathead.getCategorydescription()%> 
                </p>
            </div>
            <hr>
            <div class="container">
                <div class="row">
                    <div class="col-md-2">
                        <!--filter product-->
                        <h4>Filter Product</h4>
                        <div class="row">
                            <h6>Select Price Range</h6>
                            <!--<form>-->
                            <div class="row">
                                <div class="form-group ">
                                    <label for="from">From</label>
                                    <select id="from" class="form-control">
                                        <%
                                            for (int i = 500; i < 1000000; i += 500) {
                                        %>
                                        <option value="<%=i%>"><%=i%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="form-group ">
                                    <label for="to">To</label>
                                    <select id="to" class="form-control">
                                        <%
                                            for (int i = 1000; i < 1000000; i += 500) {
                                        %>
                                        <option value="<%=i%>"><%=i%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                <input type="hidden" id="categoryid" value="<%=cid%>"/>
                                <button class="btn btn-primary" id="callfilter">Apply</button>
                            </div>
                            <!--</form>-->
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="row p-5" style="justify-content: space-around;" id="fetchproductscetion">
                            <%
                                int pageno = 1;
                                int limit = 4;
                                String spageno = request.getParameter("pageno");
                                if (spageno != null) {
                                    pageno = Integer.parseInt(spageno);
                                }
                                int offset = (pageno - 1) * limit;
                                ProductDao pdao = new ProductDao(ConnectionProvider.getConnection());
                                List<Product> plist = pdao.getProductByCategory(cid, offset, limit);
                                for (Product p : plist) {
                            %>
                            <!--start of product card-->
                            <div class="col-md-5">
                                <!--start of product-->
                                <div class="card m-2 p-1 border-primary" style="width: 18rem; height: 500px;">

                                    <img style="width: 100%; height: 45%" class="card-img-top" src="./../productimg/<%= p.getProductimage()%>" alt="Product image">

                                    <div class="card-body">
                                        <h5 class="card-title"><%=p.getProductname()%></h5>
                                        <p class="card-text">
                                            <%
                                                //                                                get short description of product
                                                int mypid = p.getProductid();
                                                int mycat = p.getCategoryid();
                                                String link = "<a href='./ViewProductDetails.jsp?productid=" + mypid + "&category=" + mycat + "'>More</a>";
                                                out.println(WordEditor.getLessWord(p.getProductdescription()) + "..." + link);
                                            %>
                                        </p>
                                        <div class="row">
                                            <h6 class="text-primary">&#8377; 
                                                <%
                                                    DiscountDao ddao = new DiscountDao(ConnectionProvider.getConnection());
                                                    float op = p.getProductprice();
                                                    float discount = ddao.getDiscountByCategory(p.getCategoryid());
                                                    float d = (float) (op - op * (discount / 100.0));
                                                    out.println(d);
                                                %>
                                                &nbsp;&nbsp;</h6> <h6><strike class="text-secondary">&#8377; <%=p.getProductprice()%></strike></h6>    
                                        </div>
                                        <div class="row">
                                            <%=discount + "%"%><span class="text-success"> OFF</span>
                                        </div>
                                        <!--add to cart logic-->
                                        <div class="row">
                                            <%
                                                if (currentuser != null) {
                                            %>
                                            <button class=" btn text-white" style="width: 100%; height: 40px; background-color: orange;" 
                                                    onclick="addToCart(<%=currentuser.getUserid()%>,<%=p.getProductid()%>,<%=1%>)">
                                                <img style="width: 20px;height:20px" src="./../images/shopping-cart.png" alt="logo"> Add To Cart
                                            </button>
                                            <%
                                            } else {
                                            %>
                                            <a class=" btn text-white" style="width: 100%; height: 40px; background-color: orange;" 
                                               href="./../LoginPage.jsp">
                                                <img style="width: 20px;height:20px" src="./../images/shopping-cart.png" alt="logo"> Add To Cart
                                            </a>
                                            <%
                                                }
                                            %>
                                        </div>
                                    </div>
                                </div>
                                <!--end of product-->
                            </div>
                            <!--end of product card-->
                            <%                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--pagination for product-->
        <section class="container">
            <ul class="pagination justify-content-center" style="margin:20px 0">
                <li class="page-item active" style="width: 50px;">
                    <a class="page-link" href="./ViewProduct.jsp?categoryid=<%=cid%>&pageno=1">1</a>
                </li>&nbsp;
                <%
                    int i = 1;
                    int countproduct = pdao.countProduct(cid);
                    int pagecount = 1;
                    if (countproduct % 4 == 0) {
                        pagecount = ((int) (countproduct / limit));
                    } else {
                        pagecount = ((int) (countproduct / limit)) + 1;
                    }
                    for (i = 2; i <= pagecount; i++) {
                %>
                <li class="page-item active" style="width: 50px;">
                    <a class="page-link" href="./ViewProduct.jsp?categoryid=<%=cid%>&pageno=<%=i%>"><%=i%></a>
                </li>&nbsp;
                <%
                    }
                %>
            </ul>
        </section>
        <%@include file="./footer.jsp" %>
    </body>
</html>
















































