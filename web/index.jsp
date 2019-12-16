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
                        <img src="assets/img/logo.png" alt="logo" width="50px"> <strong>Ar-Rahman Store</strong></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                    </div>
                    <div class="collapse navbar-collapse text-center" id="navbarSupportedContent">
                        <div class="col-md-6 col-12 pr-0 my-1">
                            <form class="searchBox" action="caribuku.jsp" method="get">
                                <input type="search" name="keyword" class="form-control w-100" placeholder="Cari sesuatu di sini">
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
                        <h3 class="text-dark">Rekomendasi Buku</h3>
                    </div>
                </div>
                <%
                    //GET DATA DARI DATABASE
                    try {
                        koneksi connect     = new koneksi();
                        Connection conn     = connect.bukaKoneksi();
                        Statement st        = conn.createStatement();
                        String sqlGetBuku   = "SELECT * FROM books WHERE stok > 0 ORDER BY ISBN ASC LIMIT 0,5";
                        ResultSet rs        = st.executeQuery(sqlGetBuku);

                        while(rs.next()) {
                            out.print(" <div class='col-md-2 col-6 mb-2' data-toggle='modal' data-target='.bd-example-modal-lg"+rs.getString(1)+"' style='cursor: pointer;'>"
                                            + "<img class='d-block rounded' src='assets/img/"+rs.getString(7)+"' width='100%' height='225px'>"
                                        +"</div>");
                            out.print(" <div class='modal fade bd-example-modal-lg"+rs.getString(1)+"' tabindex='-1' role='dialog' aria-labelledby='myLargeModalLabel' aria-hidden='true'>"
                                            +"<div class='modal-dialog modal-lg'>"
                                                +"<div class='modal-content'>"
                                                    +"<div class='modal-header'>"
                                                        +"<h5 class='modal-title' id='exampleModalLabel'>Detail Buku</h5>"
                                                        +"<button type='button' class='close' data-dismiss='modal' aria-label='Close'>"
                                                            +"<span aria-hidden='true'>&times;</span>"
                                                        +"</button>"
                                                    +"</div>"
                                                    +"<div class='modal-body'>"
                                                        +" <div class='row'>"
                                                            +"<div class='col-md-4 offset-md-1'>"
                                                                +"<img src='assets/img/"+rs.getString(7)+"' width='100%'>"
                                                                +"<h5 class='text-center mt-3 mb-1'>Harga: Rp"+rs.getString(9)+",00</h5>"
                                                                +"<h6 class='text-center'>Stok: "+rs.getString(8)+" (<label class='text-success'>Tersedia</label>)</h6>"
                                                            +"</div>"
                                                            +"<div class='col-md-6'>"
                                                                +"<h5>"+rs.getString(2)+"</h5>"
                                                                +"<p>"+rs.getString(3)+"</p>"
                                                                +"<hr>"
                                                                +"<ul class='nav nav-tabs' role='tablist'>"
                                                                    +"<li class='nav-item'>"
                                                                        +"<a class='nav-link text-info active' href='#desc"+rs.getString(1)+"' role='tab' data-toggle='tab'>Deskripsi</a>"
                                                                    +"</li>"
                                                                    +"<li class='nav-item'>"
                                                                        +"<a class='nav-link text-info' href='#detail"+rs.getString(1)+"' role='tab' data-toggle='tab'>Detail</a>"
                                                                    +"</li>"
                                                                +"</ul>"
                                                                +"<div class='tab-content'>"
                                                                    +"<div role='tabpanel' class='tab-pane fade in active show' id='desc"+rs.getString(1)+"' style='max-height: 300px; overflow: hidden;overflow-y: auto;'>"
                                                                        +"<p class='p-3'>"+rs.getString(4)+"</p>"
                                                                    +"</div>"
                                                                    +"<div role='tabpanel' class='tab-pane fade' id='detail"+rs.getString(1)+"'>"
                                                                        +"<table class='table table-responsive table-striped'>"
                                                                            +"<br>"
                                                                                +"<tr>"
                                                                                    +"<td width='130px' class='text-muted'>Tanggal Terbit</td>"
                                                                                    +"<td width='240px'> : "+rs.getString(5)+"</td>"
                                                                               +"</tr>"
                                                                               +"<tr>"
                                                                                    +"<td width='130px' class='text-muted'>ISBN</td>"
                                                                                   +"<td width='240px'> : "+rs.getString(1)+"</td>"
                                                                                +"</tr>"
                                                                                +"<tr>"
                                                                                    +"<td width='130px' class='text-muted'>Bahasa</td>"
                                                                                    +"<td width='240px'> : Indonesia</td>"
                                                                                +"</tr>"
                                                                                +"<tr>"
                                                                                   +"<td width='130px' class='text-muted'>Penerbit</td>"
                                                                                   +"<td width='240px'>: "+rs.getString(6)+"</td>"
                                                                                +"</tr>"
                                                                            +"</table>"
                                                                        +"</div>"
                                                                    +"</div>"
                                                                +"</div>"
                                                            +"</div>"
                                                        +"</div>"
                                                        +"<div class='modal-footer'>"
                                                            +"<button type='button' class='btn btn-secondary' data-dismiss='modal'>Batal</button>"
                                                            +"<a href='login.jsp' class='btn btn-primary px-4'>Masuk</a>"
                                                        +"</div>"
                                                    +"</div>"
                                                +"</div>"
                                            +"</div>");
                        }
                    }
                    catch(Exception e) {
                    }
                %>
            </div>
            
            <br>
            
            <div class="row mx-3 mb-3 text-center">
                <!--BUKU POPULER-->
                <div class="col-md-6 mb-3">
                    <div class="hr-sect">
                        <h3 class="text-dark">Buku Terbaru</h3>
                    </div>
                    
                    <div class="row">
                        <%
                            //GET DATA DARI DATABASE
                            try {
                                koneksi connect     = new koneksi();
                                Connection conn     = connect.bukaKoneksi();
                                Statement st        = conn.createStatement();
                                String sqlGetBuku   = "SELECT * FROM books WHERE stok > 0 ORDER BY tanggal_terbit DESC LIMIT 0,6";
                                ResultSet rs        = st.executeQuery(sqlGetBuku);

                                while(rs.next()) {
                                    out.print(" <div class='col-md-4 mb-4' data-toggle='modal' data-target='.bd-example-modal-lg"+rs.getString(1)+"' style='cursor: pointer;'>"
                                                    + "<img class='d-block rounded' src='assets/img/"+rs.getString(7)+"' width='100%' height='225px'>"
                                                +"</div>");
                                    out.print(" <div class='modal fade bd-example-modal-lg"+rs.getString(1)+"' tabindex='-1' role='dialog' aria-labelledby='myLargeModalLabel' aria-hidden='true'>"
                                                    +"<div class='modal-dialog modal-lg'>"
                                                        +"<div class='modal-content'>"
                                                            +"<div class='modal-header'>"
                                                                +"<h5 class='modal-title' id='exampleModalLabel'>Detail Buku</h5>"
                                                                +"<button type='button' class='close' data-dismiss='modal' aria-label='Close'>"
                                                                    +"<span aria-hidden='true'>&times;</span>"
                                                                +"</button>"
                                                            +"</div>"
                                                            +"<div class='modal-body'>"
                                                                +" <div class='row'>"
                                                                    +"<div class='col-md-4 offset-md-1'>"
                                                                        +"<img src='assets/img/"+rs.getString(7)+"' width='100%'>"
                                                                        +"<h5 class='text-center mt-3 mb-1'>Harga: Rp"+rs.getString(9)+",00</h5>"
                                                                        +"<h6 class='text-center'>Stok: "+rs.getString(8)+" (<label class='text-success'>Tersedia</label>)</h6>"
                                                                    +"</div>"
                                                                    +"<div class='col-md-6 text-left'>"
                                                                        +"<h5>"+rs.getString(2)+"</h5>"
                                                                        +"<p>"+rs.getString(3)+"</p>"
                                                                        +"<hr>"
                                                                        +"<ul class='nav nav-tabs' role='tablist'>"
                                                                            +"<li class='nav-item'>"
                                                                                +"<a class='nav-link text-info active' href='#desc"+rs.getString(1)+"' role='tab' data-toggle='tab'>Deskripsi</a>"
                                                                            +"</li>"
                                                                            +"<li class='nav-item'>"
                                                                                +"<a class='nav-link text-info' href='#detail"+rs.getString(1)+"' role='tab' data-toggle='tab'>Detail</a>"
                                                                            +"</li>"
                                                                        +"</ul>"
                                                                        +"<div class='tab-content'>"
                                                                            +"<div role='tabpanel' class='tab-pane fade in active show' id='desc"+rs.getString(1)+"' style='max-height: 300px; overflow: hidden;overflow-y: auto;'>"
                                                                                +"<p class='p-3'>"+rs.getString(4)+"</p>"
                                                                            +"</div>"
                                                                            +"<div role='tabpanel' class='tab-pane fade' id='detail"+rs.getString(1)+"'>"
                                                                                +"<table class='table table-responsive table-striped'>"
                                                                                    +"<br>"
                                                                                        +"<tr>"
                                                                                            +"<td width='130px' class='text-muted'>Tanggal Terbit</td>"
                                                                                            +"<td width='240px'> : "+rs.getString(5)+"</td>"
                                                                                       +"</tr>"
                                                                                       +"<tr>"
                                                                                            +"<td width='130px' class='text-muted'>ISBN</td>"
                                                                                           +"<td width='240px'> : "+rs.getString(1)+"</td>"
                                                                                        +"</tr>"
                                                                                        +"<tr>"
                                                                                            +"<td width='130px' class='text-muted'>Bahasa</td>"
                                                                                            +"<td width='240px'> : Indonesia</td>"
                                                                                        +"</tr>"
                                                                                        +"<tr>"
                                                                                           +"<td width='130px' class='text-muted'>Penerbit</td>"
                                                                                           +"<td width='240px'>: "+rs.getString(6)+"</td>"
                                                                                        +"</tr>"
                                                                                    +"</table>"
                                                                                +"</div>"
                                                                            +"</div>"
                                                                        +"</div>"
                                                                    +"</div>"
                                                                +"</div>"
                                                                +"<div class='modal-footer'>"
                                                                    +"<button type='button' class='btn btn-secondary' data-dismiss='modal'>Batal</button>"
                                                                    +"<a href='login.jsp' class='btn btn-primary px-4'>Masuk</a>"
                                                                +"</div>"
                                                            +"</div>"
                                                        +"</div>"
                                                    +"</div>");
                                }
                            }
                            catch(Exception e) {
                            }
                        %>
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
                                out.print("<div class='col-md-2 mb-4' data-toggle='modal' data-target='.bd-example-modal-lg"+rs.getString(1)+"' style='cursor: pointer;'>"
                                            + "<img class='d-block rounded' src='assets/img/"+rs.getString(7)+"' width='100%' height='225px'>"
                                        +"</div>");
                                if(Integer.parseInt(rs.getString(8)) > 0) {
                                    out.print("<div class='modal fade bd-example-modal-lg"+rs.getString(1)+"' tabindex='-1' role='dialog' aria-labelledby='myLargeModalLabel' aria-hidden='true'>"    +"<div class='modal-dialog modal-lg'>"
                                                +"<div class='modal-content'>"
                                                    +"<div class='modal-header'>"
                                                        +"<h5 class='modal-title' id='exampleModalLabel'>Detail Buku</h5>"
                                                        +"<button type='button' class='close' data-dismiss='modal' aria-label='Close'>"
                                                            +"<span aria-hidden='true'>&times;</span>"
                                                        +"</button>"
                                                    +"</div>"
                                                    +"<div class='modal-body'>"
                                                        +" <div class='row'>"
                                                            +"<div class='col-md-4 offset-md-1'>"
                                                                +"<img src='assets/img/"+rs.getString(7)+"' width='100%'>"
                                                                +"<h5 class='text-center mt-3 mb-1'>Harga: Rp"+rs.getString(9)+",00</h5>"
                                                                +"<h6 class='text-center'>Stok: "+rs.getString(8)+" (<label class='text-success'>Tersedia</label>)</h6>"
                                                            +"</div>"
                                                            +"<div class='col-md-6 text-left'>"
                                                                +"<h5>"+rs.getString(2)+"</h5>"
                                                                +"<p>"+rs.getString(3)+"</p>"
                                                                +"<hr>"
                                                                +"<ul class='nav nav-tabs' role='tablist'>"
                                                                    +"<li class='nav-item'>"
                                                                        +"<a class='nav-link text-info active' href='#desc"+rs.getString(1)+"' role='tab' data-toggle='tab'>Deskripsi</a>"
                                                                    +"</li>"
                                                                    +"<li class='nav-item'>"
                                                                        +"<a class='nav-link text-info' href='#detail"+rs.getString(1)+"' role='tab' data-toggle='tab'>Detail</a>"
                                                                    +"</li>"
                                                                +"</ul>"
                                                                +"<div class='tab-content'>"
                                                                    +"<div role='tabpanel' class='tab-pane fade in active show' id='desc"+rs.getString(1)+"' style='max-height: 300px; overflow: hidden;overflow-y: auto;'>"
                                                                        +"<p class='p-3'>"+rs.getString(4)+"</p>"
                                                                    +"</div>"
                                                                    +"<div role='tabpanel' class='tab-pane fade' id='detail"+rs.getString(1)+"'>"
                                                                        +"<table class='table table-responsive table-striped'>"
                                                                            +"<br>"
                                                                            +"<tr>"
                                                                                +"<td width='130px' class='text-muted'>Tanggal Terbit</td>"
                                                                                +"<td width='240px'> : "+rs.getString(5)+"</td>"
                                                                            +"</tr>"
                                                                            +"<tr>"
                                                                                +"<td width='130px' class='text-muted'>ISBN</td>"
                                                                                +"<td width='240px'> : "+rs.getString(1)+"</td>"
                                                                            +"</tr>"
                                                                            +"<tr>"
                                                                                +"<td width='130px' class='text-muted'>Bahasa</td>"
                                                                                +"<td width='240px'> : Indonesia</td>"
                                                                            +"</tr>"
                                                                            +"<tr>"
                                                                                +"<td width='130px' class='text-muted'>Penerbit</td>"
                                                                                +"<td width='240px'>: "+rs.getString(6)+"</td>"
                                                                            +"</tr>"
                                                                        +"</table>"
                                                                    +"</div>"
                                                                +"</div>"
                                                             +"</div>"
                                                        +"</div>"
                                                    +"</div>"
                                                    +"<div class='modal-footer'>"
                                                        +"<button type='button' class='btn btn-secondary' data-dismiss='modal'>Batal</button>"
                                                        +"<a href='login.jsp' class='btn btn-primary px-4'>Masuk</a>"
                                                    +"</div>"
                                                +"</div>"
                                            +"</div>"
                                    +"</div>");
                                }
                                else {
                                    out.print("<div class='modal fade bd-example-modal-lg"+rs.getString(1)+"' tabindex='-1' role='dialog' aria-labelledby='myLargeModalLabel' aria-hidden='true'>"    +"<div class='modal-dialog modal-lg'>"
                                                +"<div class='modal-content'>"
                                                    +"<div class='modal-header'>"
                                                        +"<h5 class='modal-title' id='exampleModalLabel'>Detail Buku</h5>"
                                                        +"<button type='button' class='close' data-dismiss='modal' aria-label='Close'>"
                                                            +"<span aria-hidden='true'>&times;</span>"
                                                        +"</button>"
                                                    +"</div>"
                                                    +"<div class='modal-body'>"
                                                        +" <div class='row'>"
                                                            +"<div class='col-md-4 offset-md-1'>"
                                                                +"<img src='assets/img/"+rs.getString(7)+"' width='100%'>"
                                                                +"<h5 class='text-center mt-3 mb-1'>Harga: Rp"+rs.getString(9)+",00</h5>"
                                                                +"<h6 class='text-center'>Stok: "+rs.getString(8)+" (<label class='text-danger'>Stok Habis</label>)</h6>"
                                                            +"</div>"
                                                            +"<div class='col-md-6 text-left'>"
                                                                +"<h5>"+rs.getString(2)+"</h5>"
                                                                +"<p>"+rs.getString(3)+"</p>"
                                                                +"<hr>"
                                                                +"<ul class='nav nav-tabs' role='tablist'>"
                                                                    +"<li class='nav-item'>"
                                                                        +"<a class='nav-link text-info active' href='#desc"+rs.getString(1)+"' role='tab' data-toggle='tab'>Deskripsi</a>"
                                                                    +"</li>"
                                                                    +"<li class='nav-item'>"
                                                                        +"<a class='nav-link text-info' href='#detail"+rs.getString(1)+"' role='tab' data-toggle='tab'>Detail</a>"
                                                                    +"</li>"
                                                                +"</ul>"
                                                                +"<div class='tab-content'>"
                                                                    +"<div role='tabpanel' class='tab-pane fade in active show' id='desc"+rs.getString(1)+"' style='max-height: 300px; overflow: hidden;overflow-y: auto;'>"
                                                                        +"<p class='p-3'>"+rs.getString(4)+"</p>"
                                                                    +"</div>"
                                                                    +"<div role='tabpanel' class='tab-pane fade' id='detail"+rs.getString(1)+"'>"
                                                                        +"<table class='table table-responsive table-striped'>"
                                                                            +"<br>"
                                                                            +"<tr>"
                                                                                +"<td width='130px' class='text-muted'>Tanggal Terbit</td>"
                                                                                +"<td width='240px'> : "+rs.getString(5)+"</td>"
                                                                            +"</tr>"
                                                                            +"<tr>"
                                                                                +"<td width='130px' class='text-muted'>ISBN</td>"
                                                                                +"<td width='240px'> : "+rs.getString(1)+"</td>"
                                                                            +"</tr>"
                                                                            +"<tr>"
                                                                                +"<td width='130px' class='text-muted'>Bahasa</td>"
                                                                                +"<td width='240px'> : Indonesia</td>"
                                                                            +"</tr>"
                                                                            +"<tr>"
                                                                                +"<td width='130px' class='text-muted'>Penerbit</td>"
                                                                                +"<td width='240px'>: "+rs.getString(6)+"</td>"
                                                                            +"</tr>"
                                                                        +"</table>"
                                                                    +"</div>"
                                                                +"</div>"
                                                             +"</div>"
                                                        +"</div>"
                                                    +"</div>"
                                                    +"<div class='modal-footer'>"
                                                        +"<button type='button' class='btn btn-secondary' data-dismiss='modal'>Batal</button>"
                                                    +"</div>"
                                                +"</div>"
                                            +"</div>"
                                    +"</div>");
                                }
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
