<%@page import="com.oss.entities.User"%>
<%@page errorPage="./Error.jsp" %>
<%
    User currentuser = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./../commonlinkpage.jsp" %>
        <link rel="stylesheet" href="./../css/commonstyle.css">
        <script src=".././javascript/jquery-3.6.0.js"></script>
        <script src="./../javascript/fetchsearchproduct.js" type="text/javascript" defer></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous"></script>
        <script src="./../javascript/addToCart.js" defer></script>
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