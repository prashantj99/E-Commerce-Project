<%@page errorPage="./Error.jsp" %>
<%@page import="com.oss.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./../commonlinkpage.jsp" %>
        <link rel="stylesheet" href="./../css/commonstyle.css">
        <title>Online Shopping Site | Checkout Page</title>
    </head>
    <body>
        <%
            User currentuser = (User) session.getAttribute("user");
            if (currentuser == null) {
                response.sendRedirect("./homepage.jsp");
                return;
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
                    <div class="input-group" style="width: 100%; height: 75%;" id="hideoncontact">
                        <input required id="keyword" name="keyword" type="text" class="form-control" placeholder="search product by name keyword e.g. mobile" aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button style="background-color: orange;" class="btn btn-outline-white text-white" onclick="fetchSearchProduct()">
                                <img style="width: 20px; height: 20px;" src="./../images/magnifying-glass.png" alt="search">
                            </button>
                        </div>
                    </div>
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
        <!--checkout form start-->
        <div class="container text-center">
            <h5 class="text-center" style="color: #2980b9;">Your Checkout Details</h5>
        </div>
        <br>
        <br>
        <div class="container" style="justify-content: center;">
            <form action="./../CheckoutServlet" style="width: 100%;" class="row" method="post">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="username">Your Name</label>
                        <input name="username" disabled type="text" class="form-control" id="username" value="<%=currentuser.getUsername()%>" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email address</label>
                        <input name="useremail" type="email" class="form-control" id="email" aria-describedby="emailHelp" value="<%=currentuser.getUseremail()%>" required>
                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone Number</label>
                        <input name="phone" type="tel" class="form-control" id="phone"  pattern="[1-9]{3}-[0-9]{3}-[0-9]{4}" value="<%=currentuser.getPhone()%>" required>
                        <small>Format: 123-450-0678</small>
                    </div>
                    <div class="form-group">
                        <label for="address">Your Shipping Address</label>
                        <textarea name="address" class="form-control" id="address" rows="3" placeholder="Enter Your Shipping Address"  required><%=currentuser.getAddress()%></textarea>
                    </div>
                    <div class="form-row">
                        <div class="col-3">
                            <select class="form-control" name="country"  required>
                                <option value="india">India</option>
                            </select>
                        </div>
                        <div class="col-4">
                            <input name="city" type="text" class="form-control" placeholder="City"  required>
                        </div>
                        <div class="col">
                            <input name="state" type="text" class="form-control" placeholder="State"  required>
                        </div>
                        <div class="col">
                            <input name="zip" type="text" class="form-control" placeholder="Zip"  required>
                        </div>
                        <!--edited-->
                    </div>
                    <br>
                    <div class="alert alert-warning">
                        Changes you have made will also reflected to your profile except card details
                    </div>
                </div>
                <div class="col-md-6">

                    <div class="container">
                        <div class="form-group">
                            <label for="cardname">Card Name</label>
                            <input name="cardname" type="text" class="form-control" id="cardname" placeholder="John Mone Dao">
                        </div>
                        <div class="form-group">
                            <label for="cardno">Credit Card Number</label>
                            <input name="cardno" type="text" class="form-control" id="cardno"  pattern="[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}" placeholder="1111-2222-3333-4444">
                        </div>
                        <div class="form-group">
                            <label for="expire">Expire Date</label>
                            <input name="expire" type="text" class="form-control" id="exampleInputPassword1" placeholder="05/2016">
                        </div>
                        <div class="form-group">
                            <label for="cvv">CVV</label>
                            <input name="cvv" type="password" class="form-control" id="exampleInputPassword1" placeholder="352">
                        </div>
                    </div>
                    <div class="container">
                        <button type="submit" class="btn btn-outline-success" style="width: 100%">Submit</button>
                    </div>
                </div>
        </div>                    
    </form>
</div>
<!--check out form end-->
<%@include file="./footer.jsp" %>
</body>
</html>
