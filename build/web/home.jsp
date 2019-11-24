<%-- 
    Document   : home.jsp
    Created on : Nov 22, 2019, 9:47:55 AM
    Author     : User
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="jdbc.koneksi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JWP - Peminjaman Buku</title>
        
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
                            <a class="navbar-brand ml-5" href="daftarpinjam.jsp"><img src="assets/img/shoppingcart.png" width="50px"></a>     
                        </div>
                        <div class="col-md-2  col-12 pr-0 my-1">
                            <div class="navbar-brand dropdown ">
                                <img src="assets/img/admin-user.png" width="50px"> 
                                <a class="dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="text-decoration: none;">
                                    <%= session.getAttribute("nama") %>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="#" style="text-decoration: none;">Profil</a>
                                    <a class="dropdown-item disabled" href="home.jsp" style="text-decoration: none;">Pinjam Buku</a>
                                    <a class="dropdown-item" href="daftarpinjam.jsp" style="text-decoration: none;">Daftar Pinjam</a>
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
                    <h3 class="text-dark">Daftar Buku Yang Tersedia</h3>
                </div>
                
                <div class="row justify-content-center">
                    <%
//                        String nim      = session.getAttribute("nim").toString();
                        
                        //GET DATA DARI DATABASE
                        try {
                            koneksi connect     = new koneksi();
                            Connection conn     = connect.bukaKoneksi();
                            Statement st        = conn.createStatement();
                            String sqlGetBuku   = "SELECT * FROM books";
                            ResultSet rs        = st.executeQuery(sqlGetBuku);
                            
                            while(rs.next()) {
                                out.print(  "<div class='col-md-2 mb-4' data-toggle='modal' data-target='.bd-example-modal-lg"+rs.getString(1)+"' style='cursor: pointer;'>"
                                                +"<img class='d-block' src='assets/img/"+rs.getString(7)+"' width='100%' height='200px'>"
                                            +"</div>");
                                
                                out.print(" <div class='modal fade bd-example-modal-lg"+rs.getString(1)+"' tabindex='-1' role='dialog' aria-labelledby='myLargeModalLabel' aria-hidden='true'>"
                                                +"<div class='modal-dialog modal-lg'>"
                                                    +"<div class='modal-content'>"
                                                        +"<div class='modal-header'>"
                                                            +"<h5 class='modal-title' id='exampleModalLabel'>Pinjam Buku</h5>"
                                                            +"<button type='button' class='close' data-dismiss='modal' aria-label='Close'>"
                                                                +"<span aria-hidden='true'>&times;</span>"
                                                            +"</button>"
                                                        +"</div>"
                                                        +"<div class='modal-body'>"
                                                           +" <div class='row'>"
                                                                +"<div class='col-md-4 offset-md-1'>"
                                                                    +"<img src='assets/img/"+rs.getString(7)+"' width='100%'>"
                                                                    +"<h5 class='pl-4 ml-3 mt-3'>Pilih Lama Pinjam:</h5>"
                                                                    +"<div class='pl-4 ml-4'>"
                                                                        +"<div class='form-check form-check-inline'>"
                                                                            +"<input class='form-check-input' type='radio' name='inlineRadioOptions"+rs.getString(1)+"' id='inlineRadio1"+rs.getString(1)+"' value='7' checked>"
                                                                            +"<label class='form-check-label' for='inlineRadio1"+rs.getString(1)+"'>7 Hari</label>"
                                                                        +"</div>"
                                                                        +"<div class='form-check form-check-inline'>"
                                                                            +"<input class='form-check-input' type='radio' name='inlineRadioOptions"+rs.getString(1)+"' id='inlineRadio2"+rs.getString(1)+"' value='30'>"
                                                                            +"<label class='form-check-label' for='inlineRadio2"+rs.getString(1)+"'>30 Hari</label>"
                                                                        +"</div>"
                                                                    +"</div>"
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
                                                            +"<button type='button' class='btn btn-secondary' data-dismiss='modal'>Close</button>"
                                                            +"<button type='button' class='btn btn-primary'>Pinjam</button>"
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
        </div>
        
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
    </body>
</html>
