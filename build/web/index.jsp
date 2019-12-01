<%-- 
    Document   : index.jsp
    Created on : Nov 21, 2019, 8:46:19 PM
    Author     : User
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="jdbc.koneksi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JWP - Penjualan Buku</title>
        
        <link rel="stylesheet" href="assets/css/bootstrap.css">
        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>
        <!--NAVBAR-->
        <nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">
            <div class="container-fluid">
                <div class="row w-100 text-center">
                    <div class="col-md-4 col-12 pr-0 my-1">
                        <a class="navbar-brand" href="index.jsp">
                        <img src="assets/img/logo.png" alt="logo" width="50px"> <strong>Perpustakaan Daring</strong></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                    </div>
                    <div class="collapse navbar-collapse text-center" id="navbarSupportedContent">
                        <div class="col-md-6 col-12 pr-0 my-1">
                            <form class="searchBox" action="#">
                                <input type="search" class="form-control w-100" placeholder="Cari sesuatu di sini">
                                <button type="submit"><img src="assets/img/search.png" width="15px" style="padding-bottom: 5px;"></button>
                            </form>
                        </div>
                        
                        <div class="col-md-2 offset-md-3 col-12 pr-0 my-1">
                            <a class="nav-link btn btn-outline-light" href="login.jsp">Masuk</a>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
        
        <br><br><br>
        
        <div class="container mt-5">
            <div class="row mx-5 mb-3">
                <div class="col-md-8 p-0">
                    <!--CAROUSEL / SLIDER-->
                   <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img class="d-block w-100" src="assets/img/Slide1.jpg" alt="1 slide" height="300px">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="assets/img/Slide2.jpg" alt="2 slide" height="300px">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="assets/img/Slide3.jpg" alt="3 slide" height="300px">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                     </div>
                </div>
                <div class="col-md-4 p-0">
                    <div class="row">
                        <div class="col-md-12">
                            <img class="d-block" src="assets/img/Banner1.jpg" width="100%" height="150px">
                        </div>
                        <div class="col-md-12">
                            <img class="d-block" src="assets/img/Banner2.jpg" width="100%" height="150px">
                        </div>
                    </div>
                </div>
            </div>
            
            <br>
            
            <!--REKOMENDASI BUKU-->
            <div class="row mx-3 mb-3 justify-content-center">
                <div class="col-md-12">
                    <div class="hr-sect">
                        <h2 class="text-dark">Rekomendasi Buku</h2>
                    </div>
                </div>
                <div class="col-md-2 col-6 mb-2">
                    <div class="card">
                        <div class="card-img">
                            <a href="login.jsp">
                                <img class="d-block rounded-top" src="assets/img/Buku8.jpg" width="100%" height="230px">
                            </a>
                        </div>
<!--                        <div class="card-body">
                            <h5>Test Image</h5>
                        </div>-->
                    </div>
                </div>
                <div class="col-md-2 col-6 mb-2">
                    <div class="card">
                        <div class="card-img">
                            <a href="login.jsp">
                                <img class="d-block rounded-top" src="assets/img/Buku9.jpg" width="100%" height="230px">
                            </a>
                        </div>
<!--                        <div class="card-body">
                            <h5>Test Image</h5>
                        </div>-->
                    </div>
                </div>
                <div class="col-md-2 col-6 mb-2">
                    <div class="card">
                        <div class="card-img">
                            <a href="login.jsp">
                                <img class="d-block rounded-top" src="assets/img/Buku10.jpg" width="100%" height="230px">
                            </a>
                        </div>
<!--                        <div class="card-body">
                            <h5>Test Image</h5>
                        </div>-->
                    </div>
                </div>
                <div class="col-md-2 col-6 mb-2">
                    <div class="card">
                        <div class="card-img">
                            <a href="login.jsp">
                                <img class="d-block rounded-top" src="assets/img/Buku11.jpg" width="100%" height="230px">
                            </a>
                        </div>
<!--                        <div class="card-body">
                            <h5>Test Image</h5>
                        </div>-->
                    </div>
                </div>
                <div class="col-md-2 col-6 mb-2">
                    <div class="card">
                        <div class="card-img">
                            <a href="login.jsp">
                                <img class="d-block rounded-top" src="assets/img/Buku1.jpg" width="100%" height="230px">
                            </a>
                        </div>
<!--                        <div class="card-body">
                            <h5>Test Image</h5>
                        </div>-->
                    </div>
                </div>
            </div>
            
            <br>
            
            <div class="row mx-3 mb-3 text-center">
                <!--BUKU POPULER-->
                <div class="col-md-6 mb-3">
                    <div class="hr-sect">
                        <h3 class="text-dark">Buku Teropuler</h3>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-4 mb-4">
                            <a href="login.jsp">
                                <img class="d-block" src="assets/img/Buku3.jpg" width="100%">
                            </a>
                        </div>
                        <div class="col-md-4 mb-4">
                            <a href="login.jsp">
                                <img class="d-block" src="assets/img/Buku4.jpg" width="100%">
                            </a>
                        </div>
                        <div class="col-md-4 mb-4">
                            <a href="login.jsp">
                                <img class="d-block" src="assets/img/Buku5.jpg" width="100%">
                            </a>
                        </div>
                        <div class="col-md-4 mb-4">
                            <a href="login.jsp">
                                <img class="d-block" src="assets/img/Buku6.jpg" width="100%">
                            </a>
                        </div>
                        <div class="col-md-4 mb-4">
                            <a href="login.jsp">
                                <img class="d-block" src="assets/img/Buku7.jpg" width="100%">
                            </a>
                        </div>
                        <div class="col-md-4 mb-4">
                            <a href="login.jsp">
                                <img class="d-block" src="assets/img/Buku11.jpg" width="100%">
                            </a>
                        </div>
                    </div>
                </div>
                
                <!--PENULIS TERBAIK-->
                <div class="col-md-6 mb-3">
                    <div class="hr-sect">
                        <h3 class="text-dark">Penulis Terfavorit</h3>
                    </div>
                    
                    <div class="row justify-content-center mt-4">
                        <div class="col-md-4 mb-4">
                            <div class="card">
                                <div class="card-body p-2">
                                    <div class="card-img">
                                        <img class="d-block" src="assets/img/Penulis1.jpg" height="150px" width="100%">
                                    </div>
                                    <p class="m-0 pt-2">J.K. Rowling</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 mb-4">
                            <div class="card">
                                <div class="card-body p-2">
                                    <div class="card-img">
                                        <img class="d-block" src="assets/img/Penulis2.jpg" height="150px" width="100%">
                                    </div>
                                    <p class="m-0 pt-2">Sapardi Djoko Damono</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 mb-4">
                            <div class="card">
                                <div class="card-body p-2">
                                    <div class="card-img">
                                        <img class="d-block" src="assets/img/Penulis3.jpg" height="150px" width="100%">
                                    </div>
                                    <p class="m-0 pt-2">Tere Liye</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 mb-4">
                            <div class="card">
                                <div class="card-body p-2">
                                    <div class="card-img">
                                        <img class="d-block" src="assets/img/Penulis4.jpg" height="150px" width="100%">
                                    </div>
                                    <p class="m-0 pt-2">Valerie Patkar</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 mb-4">
                            <div class="card">
                                <div class="card-body p-2">
                                    <div class="card-img">
                                        <img class="d-block" src="assets/img/Penulis5.jpg" height="150px" width="100%">
                                    </div>
                                    <p class="m-0 pt-2">Eka Kurniawan</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                    
                <!--DAFTAR BUKU-->
                <div class="col-md-12 mb-3">
                    <div class="hr-sect">
                        <h3 class="text-dark">Buku-Buku Lainya</h3>
                    </div>
                    
                    <div class="row">
                        <%
                        //GET DATA DARI DATABASE
                        try {
                            koneksi connect     = new koneksi();
                            Connection conn     = connect.bukaKoneksi();
                            Statement st        = conn.createStatement();
                            String sqlGetBuku   = "SELECT * FROM books";
                            ResultSet rs        = st.executeQuery(sqlGetBuku);

                            while(rs.next()) {
                               out.print("<div class='col-md-3 mb-4'>"
                                            +"<a href='login.jsp'>"
                                                + "<img class='d-block' src='assets/img/"+rs.getString(7)+"' width='100%' height='300px'>"
                                            +"</a>"
                                        +"</div>");
                            }
                        }
                        catch(Exception e) {
                        }
                        %>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
    </body>
</html>
