<%@page import="com.oss.helper.*"%>
<%@page import="com.oss.entities.*"%>
<%@page import="com.oss.dao.*"%>
<%@page import="java.util.*"%>
<style>
    body{
        overflow-x: hidden!important;
    }
</style>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--start of header-->
<%@include  file="./commonheader.jsp"%>
<%@include file="./../commoncategoryheader.jsp" %>
<!--end of header-->
<%    
    String keyword = request.getParameter("keyword").trim().toLowerCase();
    String[] keywords = keyword.split(" ");
    ProductDao dao = new ProductDao(ConnectionProvider.getConnection());
    int pageno = 1;
    int limit = 3;
    String spageno = request.getParameter("pageno");
    if (spageno != null) {
        pageno = Integer.parseInt(spageno);
    }
    int offset = (pageno - 1) * limit;
    Set<Integer> pids = dao.getProductByKeyword(keywords,limit,offset);
%>
<div class="row">
    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Result for keywords &nbsp;&nbsp;</span> 
    <%
        for (String key : keywords) {
            out.println(" " + "<span class='text-warning' > \" " + key + "\"");
        }
    %>
</div>
</h6>
<div class="container">
    <div class="row p-5" >
        <div class="col-md-12">
            <div class="row p-5"  id="fetchproductscetion">
                <%
                    ProductDao pdao = new ProductDao(ConnectionProvider.getConnection());
                    for (Integer pid : pids) {
                        Product p = pdao.getProductByProductid(pid);
                %>
                <!--start of product card-->
                <div class="col-md-4">
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
<!--pagination for product-->
<section class="container">
    <ul class="pagination justify-content-center" style="margin:20px 0">
        <li class="page-item active" style="width: 50px;">
            <a class="page-link" href="./SearchProductPage.jsp?keyword=<%=keyword %>&pageno=1">1</a>
        </li>&nbsp;
        <%
            int i = 1;
            int countproduct = 40;
            int pagecount = 1;
            if (countproduct % limit == 0) {
                pagecount = ((int) (countproduct / limit));
            } else {
                pagecount = ((int) (countproduct / limit)) + 1;
            }
            for (i = 2; i <= pagecount; i++) {
        %>
        <li class="page-item active" style="width: 50px;">
            <a class="page-link" href="./SearchProductPage.jsp?keyword=<%=keyword%>&pageno=<%=i%>"><%=i%></a>
        </li>&nbsp;
        <%
            }
        %>
    </ul>
</section>
<p><br></p>
<p><hr></p>
<%@include file="./footer.jsp" %>
</body>
</html>
