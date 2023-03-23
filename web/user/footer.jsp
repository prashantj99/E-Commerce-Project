<%@page import="com.oss.entities.Category"%>
<%@page import="com.oss.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.oss.helper.ConnectionProvider"%>
<p><br></p>
<p><br></p>
<p><br></p>
<style>
    #button-addon1 {
        color: #ffc371;
    }

    i {
        color: #ffc371;
    }

    .form-control::placeholder {
        font-size: 0.95rem;
        color: #aaa;
        font-style: italic;
    }

    .form-control.shadow-0:focus {
        box-shadow: none;
    }
</style>
<footer  style="background-color: #74b9ff;">
    <div class="container py-5">
        <div class="row py-4">
            <div class="col-lg-4 col-md-6 mb-4 mb-lg-0"><img src="./../images/map.jpg" alt="" width="180" class="mb-3">
                <p class="font-italic text-muted">We aim to be Earth's most customer centric company.
                    Our mission is to continually raise the bar of the customer experience by using the internet and technology to help consumers</p>
                <ul class="list-inline mt-4">
                    <li class="list-inline-item"><a href="#" target="_blank" title="twitter"><i class="fa fa-twitter">Twitter</i></a></li>
                    <li class="list-inline-item"><a href="#" target="_blank" title="facebook"><i class="fa fa-facebook">FaceBook</i></a></li>
                    <li class="list-inline-item"><a href="#" target="_blank" title="instagram"><i class="fa fa-instagram">Instagram</i></a></li>
                </ul>
            </div>
            <div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
                <h6 class="text-uppercase font-weight-bold mb-4">Shop</h6>
                <ul class="list-unstyled mb-0">
                    <%
                        CategoryDao cdao100 = new CategoryDao(ConnectionProvider.getConnection());
                        List<Category> cats100 = cdao100.getAllCategory();
                        for (Category c100 : cats100) {
                    %>
                    <li class="mb-2"><a href="./ViewProduct.jsp?categoryid=<%=c100.getCategoryid()%>" class="text-muted"><%=c100.getCategorytitle()%></a></li>
                        <%
                            }
                        %>
                </ul>
            </div>
            <div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
                <h6 class="text-uppercase font-weight-bold mb-4">Company</h6>
                <ul class="list-unstyled mb-0">
                    <li class="mb-2"><a href="./AboutUs.jsp" class="text-muted">About Us</a></li>
                    <li class="mb-2"><a href="./../LoginPage.jsp" class="text-muted">Login</a></li>
                    <li class="mb-2"><a href="./../RegistrationPage.jsp" class="text-muted">Register</a></li>
                </ul>
            </div>
            <div class="col-lg-4 col-md-6 mb-lg-0">
                <h6 class="text-uppercase font-weight-bold mb-4">Newsletter</h6>
                <p class="text-muted mb-4">Comming Soon...</p>
            </div>
        </div>
    </div>
    <!-- Copyrights -->
    <div class="bg-light py-4">
        <div class="container text-center">
            <p class="text-muted mb-0 py-2 text-dark">© 2021 <a href="http://localhost:8080/Online_Shopping_Site/">Online Shopping Site</a> All rights reserved.</p>
        </div>
    </div>
</footer>