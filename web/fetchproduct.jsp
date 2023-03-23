<%@page import="com.oss.entities.User"%>
<%@page import="com.oss.dao.DiscountDao"%>
<%@page import="com.oss.helper.WordEditor"%>
<%@page import="java.util.List"%>
<%@page import="com.oss.entities.Product"%>
<%@page import="com.oss.helper.ConnectionProvider"%>
<%@page import="com.oss.dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User currentuser = (User) session.getAttribute("user");
    int from = Integer.parseInt(request.getParameter("from"));
    int to = Integer.parseInt(request.getParameter("to"));
    ProductDao dao = new ProductDao(ConnectionProvider.getConnection());
    int cid = Integer.parseInt(request.getParameter("categoryid"));
    List<Product> product = dao.getProductByPrice(from, to, cid);
    for (Product p : product) {
%>
<div class="col-md-5">
    <!--start of product-->
    <div class="card m-2 p-1 border-primary" style="width: 18rem; height: 500px;">

        <img style="width: 100%; height: 45%" class="card-img-top" src="./../productimg/<%=p.getProductimage()%>" alt="Product image">

        <div class="card-body">
            <h5 class="card-title"><%=p.getProductname()%></h5>
            <p class="card-text">
                <%
//                                                get short description of product
                    int mypid = p.getProductid();
                    int mycat = p.getCategoryid();
                    String link = "<a href='./ViewProductDetails.jsp?productid=" + mypid + "&category=" + mycat + "'>more</a>";
                    out.println(WordEditor.getLessWord(p.getProductdescription()) + link);
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
<%
    }
%>