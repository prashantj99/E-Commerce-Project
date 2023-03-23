<nav class="container-fluid bg-primary text-white">
    <div class="row">
        <br>
    </div>
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
                <a href="./../RegistrationPage.jsp" class=" btn btn-outline-primary text-white">
                    <img src="../images/signup.png" style="width: 30px; height: 30px;">
                    Sign Up
                </a>                
                <a href="./../LoginPage.jsp" class=" btn btn-outline-primary text-white">
                    <img src="../images/login.png" style="width: 30px; height: 30px;">
                    Login
                </a>
                <a class="nav-link text-white" href="./AboutUs.jsp" class="text-center" title="About Us">
                    <img src="./../images/question.png" style="width: 30px; height: 30px;" >
                </a>
            </div>
        </div>
    </div>
</nav>
