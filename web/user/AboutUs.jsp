<%-- 
    Document   : AboutUs
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="./commonheader.jsp" %>
<style>
    body {
        font-family: Arial, Helvetica, sans-serif;
        margin: 0;
        overflow-x: hidden!important;
    }

    html {
        box-sizing: border-box;
    }

    *, *:before, *:after {
        box-sizing: inherit;
    }

    .column {
        float: left;
        width: 33.3%;
        margin-bottom: 16px;
        padding: 0 8px;
    }

    .card {
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        margin: 8px;
    }

    .about-section {
        padding: 50px;
        text-align: center;
        background-color: #474e5d;
        color: white;
    }

    .container {
        padding: 0 16px;
    }

    .container::after, .row::after {
        content: "";
        clear: both;
        display: table;
    }

    .title {
        color: grey;
    }

    .button {
        border: none;
        outline: 0;
        display: inline-block;
        padding: 8px;
        color: white;
        background-color: #000;
        text-align: center;
        cursor: pointer;
        width: 100%;
    }

    .button:hover {
        background-color: #555;
    }

    @media screen and (max-width: 650px) {
        .column {
            width: 100%;
            display: block;
        }
    }
</style>
<div class="about-section">
    <h1>About Us</h1>
    <p>
      With the increase of competition in market and  eventually change in taste of customer our manual 
      system of selling products becoming slow and slow down. This Online Shopping Site is a web
      application that allows users to view the required product and buy them. Users can search or 
      filter the product with available features. The admin is also an important role in the application.
      Admin can add the new product in the database and can track the record of all the products and orders.
      An online shopping site will allow the an individual to advertise and sell their goods on the internet.
      And make it possible to make their goods  available to large group of customer via world wide web.  
    </p>
</div>
<p><br></p>
<p><br></p>
<h2 style="text-align:center">My Motivator and Guide</h2>
<div class="row">
    <section class="text-center container">
        
    </section>
    <div class="row" style="justify-content: center; width: 100%;">
        <div class="card" style="width: 250px;">
            <img src="./../images/bussiness-man.png" alt="Jane" style="width:100%">
            <div class="container">
                <h4>Mr. Sanjeev Kumar</h4>
                <p class="title">Project Guide</p>
                <p>10+ years of Experience in <strong>IT Industry</strong></p>
                <p>example@gmail.com</p>
                <p><button class="button">+91 98XXXXXXXX</button></p>
            </div>
        </div>
    </div>
</div>