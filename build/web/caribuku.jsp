<%-- 
    Document   : caribuku
    Created on : Dec 5, 2019, 12:00:50 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="jdbc.koneksi"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JWP - Penjualan Buku</title>
        
        <link rel="stylesheet" href="assets/css/bootstrap.css">
        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>
        <%
            String kata      = request.getParameter("keyword");
        %>
        <!--NAVBAR-->
        <nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">
            <div class="container-fluid">
                <%
                    if(session.getAttribute("nim") == null || session.getAttribute("nama") == null)
                    {
                        out.print(  "<div class='row w-100 text-center'>"
                                        +"<div class='col-md-4 col-12 pr-0 my-1'>"
                                            +"<a class='navbar-brand' href='index.jsp'>"
                                            +"<img src='assets/img/logo.png' alt='logo' width='50px'> <strong>Perpustakaan Daring</strong></a>"
                                            +"<button class='navbar-toggler' type='button' data-toggle='collapse' data-target='#navbarSupportedContent' aria-controls='navbarSupportedContent' aria-expanded='false' aria-label='Toggle navigation'>"
                                                +"<span class='navbar-toggler-icon'></span>"
                                            +"</button>"
                                        +"</div>"
                                        +"<div class='collapse navbar-collapse text-center' id='navbarSupportedContent'>"
                                            +"<div class='col-md-6 col-12 pr-0 my-1'>"
                                                +"<form class='searchBox' action='caribuku.jsp' method='get'>"
                                                    +"<input type='search' name='keyword' class='form-control w-100' placeholder='Cari sesuatu di sini' value='"+kata+"'>"
                                                    +"<button type='submit'><img src='assets/img/search.png' width='15px' style='padding-bottom: 5px;'></button>"
                                                +"</form>"
                                            +"</div>"
                                            +"<div class='col-md-2 offset-md-3 col-12 pr-0 my-1'>"
                                                +"<a class='nav-link btn btn-outline-light' href='login.jsp'>Masuk</a>"
                                            +"</div>"
                                        +"</div>"
                                    +"</div>'");
                    }
                    else {
                        //HITUNG JUMLAH DATA DI KERANJANG
                        try {
                            koneksi connect     = new koneksi();
                            Connection conn     = connect.bukaKoneksi();
                            Statement st        = conn.createStatement();
                            String sqlHitungBuku= "SELECT SUM(qty) FROM shopingcart WHERE nim ='"+session.getAttribute("nim")+"' AND status='belum lunas'";
                            ResultSet rs        = st.executeQuery(sqlHitungBuku);

                            int flag = 0;
                            if(rs.next()) {
                                if(rs.getString(1) != null) {
                                    out.print(  "<div class='row w-100 text-center'>"
                                                    +"<div class='col-md-4 col-12 pr-0 my-1'>"
                                                        +"<a class='navbar-brand' href='home.jsp'>"
                                                        +"<img src='assets/img/logo.png' alt='logo' width='50px'> <strong>Perpustakaan Daring</strong></a>"
                                                        +"<button class='navbar-toggler' type='button' data-toggle='collapse' data-target='#navbarSupportedContent' aria-controls='navbarSupportedContent' aria-expanded='false' aria-label='Toggle navigation'>"
                                                            +"<span class='navbar-toggler-icon'></span>"
                                                    +"</div>"
                                                    +"<div class='collapse navbar-collapse text-center' id='navbarSupportedContent'>"
                                                        +"<div class='col-md-6 col-12 pr-0 my-1'>"
                                                            +"<form class='searchBox' action='caribuku.jsp' method='get'>"
                                                                +"<input type='search' name='keyword' class='form-control w-100' placeholder='Cari sesuatu di sini' value='"+kata+"'>"
                                                                +"<button type='submit'><img src='assets/img/search.png' width='15px' style='padding-bottom: 5px;'></button>"
                                                            +"</form>"
                                                        +"</div>"
                                                        +"<div class='col-md-3 col-12 pr-0 my-1'>"
                                                            +"<a class='navbar-brand ml-5 pl-3' href='home.jsp'><img src='assets/img/bookadd.png' width='50px'></a>"
                                                            +"<a class='navbar-brand' href='daftarbeli.jsp'><img src='assets/img/shoppingcart.png' width='50px'></a>"
                                                            +"<div class='jumlahKeranjang bg-warning text-white' style='cursor: pointer;'><span style='position: relative; top: 0.5px; left: -0.5px;'>"+rs.getString(1)+"</span></div>"
                                                        +"</div>"
                                                        +"<div class='col-md-2  col-12 pr-0 my-1'>"
                                                            +"<div class='navbar-brand dropdown '>"
                                                                +"<img src='assets/img/admin-user.png' width='50px'> "
                                                                +"<a class='dropdown-toggle text-white' href='#' id='navbarDropdown' role='button' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' style='text-decoration: none;'>"+session.getAttribute("nama")+"</a>"
                                                               +" <div class='dropdown-menu' aria-labelledby='navbarDropdown'>"
                                                                    +"<a class='dropdown-item' href='profil.jsp' style='text-decoration: none;'>Profil</a>"
                                                                    +"<a class='dropdown-item' href='home.jsp' style='text-decoration: none;'>Beli Buku</a>"
                                                                    +"<a class='dropdown-item' href='daftarbeli.jsp' style='text-decoration: none;'>Keranjang</a>"
                                                                    + "<a class='dropdown-item' href='pembayaran.jsp' style='text-decoration: none;'>Pembayaran</a>"
                                                                    +"<hr>"
                                                                    +"<form action='proseslogin.jsp' method='post'>"
                                                                        +"<input type='hidden' name='tombol' value='keluar'>"
                                                                        +"<button type='submit' class='dropdown-item' style='text-decoration: none; cursor: pointer;'><strong>Keluar</strong></button>"
                                                                    +"</form>"
                                                                +"</div>"
                                                            +"</div>"
                                                        +"</div>"
                                                    +"</div>"
                                                +"</div>");
                                    flag = 1;
                                }
                            }
                                    
                            // JIKA DATA KOSONG
                            if(flag == 0) {
                                out.print(  "<div class='row w-100 text-center'>"
                                                +"<div class='col-md-4 col-12 pr-0 my-1'>"
                                                    +"<a class='navbar-brand' href='home.jsp'>"
                                                    +"<img src='assets/img/logo.png' alt='logo' width='50px'> <strong>Perpustakaan Daring</strong></a>"
                                                    +"<button class='navbar-toggler' type='button' data-toggle='collapse' data-target='#navbarSupportedContent' aria-controls='navbarSupportedContent' aria-expanded='false' aria-label='Toggle navigation'>"
                                                        +"<span class='navbar-toggler-icon'></span>"
                                                +"</div>"
                                                +"<div class='collapse navbar-collapse text-center' id='navbarSupportedContent'>"
                                                    +"<div class='col-md-6 col-12 pr-0 my-1'>"
                                                        +"<form class='searchBox' action='caribuku.jsp' method='get'>"
                                                            +"<input type='search' name='keyword' class='form-control w-100' placeholder='Cari sesuatu di sini' value='"+kata+"'>"
                                                            +"<button type='submit'><img src='assets/img/search.png' width='15px' style='padding-bottom: 5px;'></button>"
                                                        +"</form>"
                                                    +"</div>"
                                                    +"<div class='col-md-3 col-12 pr-0 my-1'>"
                                                        +"<a class='navbar-brand ml-5 pl-3' href='home.jsp'><img src='assets/img/bookadd.png' width='50px'></a>"
                                                        +"<a class='navbar-brand' href='daftarbeli.jsp'><img src='assets/img/shoppingcart.png' width='50px'></a>"
                                                        +"<div class='jumlahKeranjang bg-warning text-white' style='cursor: pointer;'><span style='position: relative; top: 0.5px; left: -0.5px;'>0</span></div>"
                                                    +"</div>"
                                                    +"<div class='col-md-2  col-12 pr-0 my-1'>"
                                                        +"<div class='navbar-brand dropdown '>"
                                                            +"<img src='assets/img/admin-user.png' width='50px'> "
                                                            +"<a class='dropdown-toggle text-white' href='#' id='navbarDropdown' role='button' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' style='text-decoration: none;'>"+session.getAttribute("nama")+"</a>"
                                                           +" <div class='dropdown-menu' aria-labelledby='navbarDropdown'>"
                                                                +"<a class='dropdown-item' href='profil.jsp' style='text-decoration: none;'>Profil</a>"
                                                                +"<a class='dropdown-item' href='home.jsp' style='text-decoration: none;'>Beli Buku</a>"
                                                                +"<a class='dropdown-item' href='daftarbeli.jsp' style='text-decoration: none;'>Keranjang</a>"
                                                                + "<a class='dropdown-item' href='pembayaran.jsp' style='text-decoration: none;'>Pembayaran</a>"
                                                                +"<hr>"
                                                                +"<form action='proseslogin.jsp' method='post'>"
                                                                    +"<input type='hidden' name='tombol' value='keluar'>"
                                                                    +"<button type='submit' class='dropdown-item' style='text-decoration: none; cursor: pointer;'><strong>Keluar</strong></button>"
                                                                +"</form>"
                                                            +"</div>"
                                                        +"</div>"
                                                    +"</div>"
                                                +"</div>"
                                            +"</div>");
                                }
                        }
                        catch(Exception e) {
                        }
                    }
                %>
            </div>
        </nav>
        
        <br><br><br>
        
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-12">
                    <div class="hr-sect">
                        <span>
                            <h3 class="text-dark m-0 px-3">Hasil Pencarian :</h3>
                            <h5 class="text-center">Kata Kunci : '<%= kata %>'</h5>
                        </span>
                    </div>
                </div>
                <%
                    //GET DATA DARI DATABASE
                    try {
                        koneksi connect     = new koneksi();
                        Connection conn     = connect.bukaKoneksi();
                        Statement st        = conn.createStatement();
                        String sqlGetBuku   = "SELECT * FROM books WHERE judul LIKE '%"+kata+"%' OR penulis LIKE '%"+kata+"' OR penerbit LIKE '%"+kata+"%'";
                        ResultSet rs        = st.executeQuery(sqlGetBuku);

                        while(rs.next()) {
                            out.print("<div class='col-md-2 mb-4' data-toggle='modal' data-target='.bd-example-modal-lg"+rs.getString(1)+"' style='cursor: pointer;'>"
                                            + "<img class='d-block rounded' src='assets/img/"+rs.getString(7)+"' width='100%' height='225px'>"
                                        +"</div>");
                            if(session.getAttribute("nim") == null || session.getAttribute("nama") == null)
                            {
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
                            else {
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
                                                            +"<form action='prosesbeli.jsp' method='post'>"
                                                                +"<input type='hidden' name='nim' value='"+ session.getAttribute("nim") +"'>"
                                                                +"<input type='hidden' name='isbn' value='"+rs.getString(1)+"'>"
                                                                +"<input type='hidden' name='qty' value='1'>"
                                                                +"<input type='hidden' name='harga' value='"+rs.getString(9)+"'>"
                                                                +"<button type='submit' class='btn btn-primary px-4'><strong>+</strong> Keranjang</button>"
                                                            +"</form>"
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
                    }
                    catch(Exception e) {
                    }
                %>
            </div>
            
            <!--REKOMENDASI BUKU-->
            <div class="row mx-3 mb-3 justify-content-center">
                <div class="col-md-12">
                    <div class="hr-sect">
                        <h3 class="text-dark px-3">Rekomendasi Buku</h3>
                    </div>
                </div>
                <%
                    //GET DATA DARI DATABASE
                    try {
                        koneksi connect     = new koneksi();
                        Connection conn     = connect.bukaKoneksi();
                        Statement st        = conn.createStatement();
                        String sqlGetBuku   = "SELECT * FROM books ORDER BY ISBN ASC LIMIT 0,5";
                        ResultSet rs        = st.executeQuery(sqlGetBuku);

                        while(rs.next()) {
                            out.print(" <div class='col-md-2 col-6 mb-2' data-toggle='modal' data-target='.bd-example-modal-lg"+rs.getString(1)+"' style='cursor: pointer;'>"
                                            + "<img class='d-block rounded' src='assets/img/"+rs.getString(7)+"' width='100%' height='225px'>"
                                        +"</div>");
                            
                            if(session.getAttribute("nim") == null || session.getAttribute("nama") == null)
                            {
                                out.print(" <div class='modal fade bd-example-modal-lg"+rs.getString(1)+"' tabindex='-1' role='dialog' aria-labelledby='myLargeModalLabel' aria-hidden='true'>"
                                                +"<div class='modal-dialog modal-lg'>"
                                                    +"<div class='modal-content'>"
                                                        +"<div class='modal-header'>"
                                                            +"<h5 class='modal-title' id='exampleModalLabel'>Beli Buku</h5>"
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
                            else {
                                out.print(" <div class='modal fade bd-example-modal-lg"+rs.getString(1)+"' tabindex='-1' role='dialog' aria-labelledby='myLargeModalLabel' aria-hidden='true'>"
                                                +"<div class='modal-dialog modal-lg'>"
                                                    +"<div class='modal-content'>"
                                                        +"<div class='modal-header'>"
                                                            +"<h5 class='modal-title' id='exampleModalLabel'>Beli Buku</h5>"
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
                                                                +"<form action='prosesbeli.jsp' method='post'>"
                                                                    +"<input type='hidden' name='nim' value='"+ session.getAttribute("nim") +"'>"
                                                                    +"<input type='hidden' name='isbn' value='"+rs.getString(1)+"'>"
                                                                    +"<input type='hidden' name='qty' value='1'>"
                                                                    +"<input type='hidden' name='harga' value='"+rs.getString(9)+"'>"
                                                                +"<button type='submit' class='btn btn-primary px-4'><strong>+</strong> Keranjang</button>"
                                                            +"</form>"
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
        
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
    </body>
</html>
