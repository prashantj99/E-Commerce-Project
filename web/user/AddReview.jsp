<%-- 
    Document   : AddReview
--%>
<%@page import="com.oss.entities.OrderProduct"%>
<%@page import="com.oss.entities.Order"%>
<%@page import="com.oss.dao.OrderDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="./commonheader.jsp"%>
<script src="./../javascript/sendreviewtoserver.js"></script>
<script src="./../javascript/fetchnxtproductforreview.js"></script>
<style>
    body{
        overflow-x: hidden!important;
    }
</style>
<%@include file="./../commoncategoryheader.jsp" %>
<div class="row">
    <p><br></p>
</div>
<section class="row" >
    <div class="col-md-3">

    </div>
    <div class="col-md-6">
        <!--current product-->
        <div class="row" style="justify-content: center; overflow-x: hidden;">
            <%                String orderid = request.getParameter("orderid");
                OrderDao orderdao = new OrderDao(ConnectionProvider.getConnection());
                //                List<Order> orders=orderdao.getAllOrderByUserid(currentuser.getUserid());
                List<OrderProduct> orderproducts = orderdao.getOrderProductByOrderid(orderid);
            %>
            <section class="banner container-fluid" id="productbox">
                <div class="row" style="justify-content: center;">
                    <div class="col-md-2">
                        <img style="width: 50px; height: 50px;" src="./../productimg/<%=orderproducts.get(0).getProductimage()%>">
                    </div>
                    <div class="col-md-10">
                        <p class="text-justify"><%=orderproducts.get(0).getProductdescription()%></p>
                    </div>
                </div>
                <div class="container">
                    <p><br></p>
                </div>
                <div class="container">
                    <div class="form-group">
                        <label for="comment">Comment</label>
                        <textarea name="comment" class="form-control" id="comment" rows="3" required></textarea>
                    </div>
                    <div class="container">
                        <!--<p><br></p>-->
                    </div>
                    <!--<div class="container">-->
                    <div clas="row" style="justify-content: flex-start;">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="star" id="star1" value="1">
                            <label class="form-check-label" for="star1">Very Bad</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="star" id="star2" value="2">
                            <label class="form-check-label" for="star2">Bad</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input checked class="form-check-input" type="radio" name="star" id="star3" value="3">
                            <label class="form-check-label" for="star3">Better</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="star" id="star4" value="4">
                            <label class="form-check-label" for="star4">Good</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="star" id="star5" value="5">
                            <label class="form-check-label" for="star5">Very Good</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="star" id="star6" value="6">
                            <label class="form-check-label" for="star6">Excellent</label>
                        </div>
                    </div>
                    <div class="row" style="justify-content: flex-end">
                        <button class="btn btn-warning" onclick="addReview(<%=orderproducts.get(0).getProductid()%>,<%=currentuser.getUserid()%>)">Submit</button>
                    </div>
                    <!--</div>-->
            </section>
        </div>
        <div class="container">
            <p><br></p>
            <p><br></p>
        </div>
        <div class="row" style="justify-content: center;">
            <ul class="pagination ">
                <li class="page-item active">
                    <a class="page-link" onclick="getNxt(<%=orderproducts.get(0).getOrderid()%>,<%=orderproducts.get(0).getProductid()%>)" href="#"><%= 1%></a>
                </li>
                <%
                    int i = 1;
                    for (i = 1; i < orderproducts.size(); i++) {
                %>
                <li class="page-item">
                    <a class="page-link" onclick="getNxt(<%=orderproducts.get(i).getOrderid()%>,<%=orderproducts.get(i).getProductid()%>)" href="#"><%= i + 1%></a>
                </li>
                <%
                        i++;
                    }
                %>
            </ul>
        </div>
    </div>    
</section>
<%@include file="./footer.jsp" %>
</body>
</html>