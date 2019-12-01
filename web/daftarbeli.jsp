<%-- 
    Document   : daftarpinjam
    Created on : Nov 22, 2019, 1:41:30 PM
    Author     : User
--%>

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
                        <a class="navbar-brand" href="home.jsp">
                        <img src="assets/img/logo.png" alt="logo" width="50px"> <strong>Perpustakaan Daring</strong></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                    </div>
                    <div class="collapse navbar-collapse text-center" id="navbarSupportedContent">
                        <div class="col-md-6 col-12 pr-0 my-1">
                            <form class="searchBox" action="#">
                                <input type="search" class="form-control w-100" placeholder="Cari sesuatu di sini">
                                <button type="submit"><img src="assets/img/search.png" width="15px" style="padding-bottom: 5px;"></button>
                            </form>
                        </div>
                        <div class="col-md-2 offset-md-1 col-12 pr-0 my-1">
                            <a class="navbar-brand ml-5" href="home.jsp"><img src="assets/img/bookadd.png" width="50px"></a>     
                        </div>
                        <div class="col-md-2  col-12 pr-0 my-1">
                            <div class="navbar-brand dropdown ">
                                <img src="assets/img/admin-user.png" width="50px"> 
                                <a class="dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="text-decoration: none;">
                                    <%= session.getAttribute("nama") %>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="profil.jsp" style="text-decoration: none;">Profil</a>
                                    <a class="dropdown-item" href="home.jsp" style="text-decoration: none;">Beli Buku</a>
                                    <a class="dropdown-item disabled" href="daftarbeli.jsp" style="text-decoration: none;">Daftar Beli</a>
                                    <hr>
                                    <a class="dropdown-item" href="index.jsp" style="text-decoration: none;"><strong>Keluar</strong></a>
                                </div>
                            </div>     
                        </div>
                    </div>
                </div>
            </div>
        </nav>
        
        <br><br><br>
        
        <div class="container mt-5">
                <!--DAFTAR BUKU-->
                <div class="col-md-12 mb-3">
                    <div class="hr-sect">
                        <h3 class="text-dark">Daftar Buku Yang Dipinjam</h3>
                    </div>
                    <table class="table table-bordered table-responsive table-striped text-center">
                        <thead width="100%" class="w-100">
                            <tr>
                                <th width="2%">No</th>
                                <th width="5%">ISBN</th>
                                <th width="20%">Judul Buku</th>
                                <th width="10%">Penerbit</th>
                                <th width="10%">Harga</th>
                                <th width="10%">Qty</th>
                                <th width="10%">Total</th>
                            </tr>
                        <tbody width="100%" class="w-100">
                            <!--FUNGSI-->
                        </tbody>
                    </table>
                    <br>
                    <div class=" text-center">
                    <a class="text-primary" href="home.jsp">Kembali</a></div>
                  </div>
                </div>
            </div>
        </div>
        
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
    </body>
</html>

