<%@page errorPage="./Error.jsp" %>
<%@page import="com.oss.entities.*"%>
<%@page import="com.oss.dao.*"%>
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
        <%@include file="./../commoncategoryheader.jsp" %>
        <div class="container">
            <p><br></p>
            <p><br></p>
            <p><br></p>
        </div>
        <div class="container">
            <%                    int pid = Integer.parseInt(request.getParameter("productid"));
                int cid = Integer.parseInt(request.getParameter("category"));
                ProductDao pdao = new ProductDao(ConnectionProvider.getConnection());
                Product p = pdao.getProductByProductid(pid);
                CategoryDao cdao1 = new CategoryDao(ConnectionProvider.getConnection());
                Category cathead = cdao1.getCategoryById(cid);
            %>
            <div class="row">
                <div class="col-md-3">
                    <img src="./../productimg/<%=p.getProductimage()%>" style="width: 70%; height: 60%">
                </div>
                <div class="col-md-6 p-4">
                    <h4 class="text-dark">
                        <%=p.getProductname()%>
                    </h4>
                    <p clsss="text-justify">
                        <%=cathead.getCategorytitle()%>
                    </p>
                    <!--seprator-->
                    <p><hr></p>
                    <p>
                    <h6><%=cathead.getCategorytitle()%></h6>
                    <%=p.getProductdescription()%>
                    </p>
                    <div class="container">
                        <p><br></p>
                    </div>
                    <!--star rating-->
                    <div class="row">
                        <%
                            ReviewDao rwdao = new ReviewDao(ConnectionProvider.getConnection());
                            List<Review> rws = rwdao.getProductReview(p.getProductid());
                            if (rws.size() != 0) {
                                int starcount = 0;
                                for (Review r : rws) {
                                    starcount += r.getStarcount();
                                }
                                int avg = (int) (starcount / rws.size());
                                for (int i = 1; i <= avg; i++) {
                        %>
                        <div class="col-md-1"><img src="./../productimg/star.png" style="width: 20px; height: 20px;"></div>
                            <%
                                    }
                                }
                            %>
                        (Total Review <%=rws.size()%>)
                    </div>
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
                    <!--cart logic-->
                    <div class="row" style="width: 50%">
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
                    <!--end cart logic-->
                </div>
            </div>
        </div>
        <div class="container">
            <p><br></p>
            <p><hr></p>
            <p><br></p>
        </div>
        <div class="container">
            <p><br></p>
            <p><br></p>
        </div>
        <div class="container">
            <div clas="row">
                <h5>Customer Review</h5>
            </div>
            <%
                if (rws.size() != 0) {
                    UserDao usrd = new UserDao(ConnectionProvider.getConnection());
                    for (Review rev : rws) {
            %>
            <div class="container">
                <p class="text-justify">@<%=usrd.getUsernameByid(rev.getUserid())%></p>
                <p class="text-justify text-warning" style="height: 50px;"><%=rev.getComment()%></p>
            </div>
            <p><br></p>
            <p><br></p>
                <%
                        }
                    }
                %>
        </div>
        <div class="container">
            <p><br></p>
            <p><br></p>
        </div>
        <%@include  file="./footer.jsp" %>
    </body>
</html>















