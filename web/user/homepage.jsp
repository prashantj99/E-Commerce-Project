<%@page import="com.oss.dao.*"%>
<%@page import="com.oss.entities.*"%>
<%@page import="com.oss.helper.*"%>
<%@page import="java.util.List"%>
<style>
    body{
        overflow-x: hidden!important;
    }
</style>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--start of header-->
<%@include  file="./commonheader.jsp"%>
<!--end of header-->
<div  id="searchproductbox" style="background-color: #ecf0f1;">
    <!--start of banner-->
    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="./../images/electronics.jpg" class="d-block w-100" alt="electronics">
            </div>
            <div class="carousel-item">
                <img src="./../images/banner.jpg" class="d-block w-100" alt="mens">
            </div>
            <div class="carousel-item">
                <img src="./../images/phones.jpg" class="d-block w-100" alt="phones">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <!--end of banner-->
    <hr>
    <!--start category section-->
    <section id="categorysection" class="container-fuild">
        <h3 class="text-center p-3" style="color:#e67e22;">Shop By Category</h3>
        <hr>
        <%                CategoryDao cdao = new CategoryDao(ConnectionProvider.getConnection());
            List<Category> cats = cdao.getAllCategory();
            int countCategory = cdao.countCategory();
//                out.println(cats.size());
            int rows;
            if (countCategory % 4 == 0) {
                rows = countCategory / 4;
            } else {
                rows = countCategory / 4 + 1;
            }
            int j = 0;
            for (int i = 0; i < rows; i++) {
        %>
        <div class="mt-2" style="justify-content: center; display: flex; flex-wrap: wrap;">
            <%
                for (; j < countCategory; j++) {
                    Category c = cats.get(j);
            %>
            <div class="col-md-3">
                <div class="card border-primary" style="width: 18rem; height: 400px; overflow-y: hidden;">
                    <img style="width: 100%; height: 50%;" class="card-img-top" src="./../categoryimg/<%=c.getCategoryimage()%>" alt="Card image cap">
                    <div class="card-body">
                        <h6 class="card-title"><%=c.getCategorytitle()%></h6>
                        <p class="card-text">
                            <%=WordEditor.getLessWord(c.getCategorydescription())%>
                        </p>
                        <a href="./ViewProduct.jsp?categoryid=<%=c.getCategoryid()%>" class="btn btn-secondary">Shop Now</a>
                    </div>
                </div>
            </div>
            <%
//                    System.out.println(j);
                    if (j == 3) {
                        j++;
                        break;
                    }
                }
            %>
        </div>
        <hr>
        <%
            }
        %>
    </section>
    <p><hr></p>
</div>
<%@include file="./footer.jsp" %>
</body>
</html>