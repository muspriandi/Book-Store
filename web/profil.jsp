<%-- 
    Document   : profil
    Created on : Dec 1, 2019, 10:24:48 PM
    Author     : User
--%>
<%
    if(session.getAttribute("nim") == null || session.getAttribute("nama") == null)
    {
        response.sendRedirect("http://localhost:8080/PenjualanBuku/index.jsp");
    }
%>
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
                            <a class="navbar-brand ml-5" href="daftarbeli.jsp"><img src="assets/img/shoppingcart.png" width="50px"></a>     
                        </div>
                        <div class="col-md-2  col-12 pr-0 my-1">
                            <div class="navbar-brand dropdown ">
                                <img src="assets/img/admin-user.png" width="50px"> 
                                <a class="dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="text-decoration: none;">
                                    <%= session.getAttribute("nama") %>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="#" style="text-decoration: none;">Profil</a>
                                    <a class="dropdown-item" href="home.jsp" style="text-decoration: none;">Beli Buku</a>
                                    <a class="dropdown-item" href="daftarbeli.jsp" style="text-decoration: none;">Daftar Beli</a>
                                    <hr>
                                    <form action="proseslogin.jsp" method="post">
                                        <input type="hidden" name="tombol" value="keluar">
                                        <button type="submit" class="dropdown-item" style="text-decoration: none; cursor: pointer;"><strong>Keluar</strong></button>
                                    </form>
                                </div>
                            </div>     
                        </div>
                    </div>
                </div>
            </div>
        </nav>
        
        <br><br><br>
        
        <div class="container mt-5">
            <!--Profil-->
            <div class="col-md-12 mb-3">
                <div class="hr-sect">
                    <h3 class="text-dark">Profil</h3>
                </div>
                
                <div class="row justify-content-center">
                    <%
                        String nim      = session.getAttribute("nim").toString();

                        try {
                            koneksi connect     = new koneksi();
                            Connection conn     = connect.bukaKoneksi();
                            Statement st        = conn.createStatement();
                            String sqlGetData   = "SELECT * FROM users WHERE nim='"+nim+"'";
                            ResultSet rs        = st.executeQuery(sqlGetData);

                            if(rs.next()) {
                                out.print("<div class='col-md-5'>"
                                            +"<div class='card'>"
                                                +"<div class='card-header text-center'><h4 class='mb-0'>Informasi Profil</h4></div>"
                                                +"<div class='card-body my-3'>"
                                                    +"<table>"
                                                        +"<thead>"
                                                            +"<tr>"
                                                                +"<th>NIM</th>"
                                                                +"<td>&nbsp; &nbsp; &nbsp; : &nbsp; </td>"
                                                                +"<td> "+rs.getString(1)+"</td>"
                                                            +"</tr>"
                                                            +"<tr>"
                                                                +"<th>Nama</th>"
                                                                +"<td>&nbsp; &nbsp; &nbsp; : &nbsp; </td>"
                                                                +"<td> "+rs.getString(2)+"</td>"
                                                            +"</tr>"
                                                            +"<tr>"
                                                                +"<th>Password</th>"
                                                                +"<td> &nbsp; &nbsp; &nbsp; : &nbsp; </td>"
                                                                +"<td> "+rs.getString(3)+"</td>"
                                                            +"</tr>"
                                                            +"<tr>"
                                                                +"<th>Saldo</th>"
                                                                +"<td>&nbsp; &nbsp; &nbsp; : &nbsp; </td>"
                                                                +"<td> "+rs.getString(4)+"</td>"
                                                            +"</tr>"
                                                        +"</thead>"
                                                    +"</table>"
                                                +"</div>"
                                                +"<div class='card-footer'>"
                                                    +"<button data-toggle='modal' data-target='.bd-example-modal-md' class='btn btn-success w-100 my-1'>Ubah Data Profil</button>"
                                                +"</div>"
                                            +"</div>"
                                        +"</div>");
                                
                                out.print(" <div class='modal fade bd-example-modal-md' tabindex='-1' role='dialog' aria-labelledby='myLargeModalLabel' aria-hidden='true'>"
                                                +"<div class='modal-dialog modal-md'>"
                                                    +"<div class='modal-content'>"
                                                        +"<div class='modal-header'>"
                                                            +"<h5 class='modal-title' id='exampleModalLabel'>Ubah Data Profil</h5>"
                                                            +"<button type='button' class='close' data-dismiss='modal' aria-label='Close'>"
                                                                +"<span aria-hidden='true'>&times;</span>"
                                                            +"</button>"
                                                        +"</div>"
                                                        +"<div class='modal-body'>"
                                                            +"<form>"
                                                                +"<div class='form-group form-inline'>"
                                                                    + "<label class='col-md-4'>NIM</label>"
                                                                    + "<input class='form-control col-md-8' type='text' name='nim' value='"+rs.getString(1)+"' readonly>"
                                                                + "</div>"
                                                                +"<div class='form-group form-inline'>"
                                                                    + "<label class='col-md-4'>Nama</label>"
                                                                    + "<input class='form-control col-md-8' type='text' name='nama' value='"+rs.getString(2)+"' required>"
                                                                + "</div>"
                                                                +"<div class='form-group form-inline'>"
                                                                    + "<label class='col-md-4'>Password</label>"
                                                                    + "<input class='form-control col-md-8' type='text' name='password' value='"+rs.getString(3)+"' required>"
                                                                + "</div>"
                                                                +"<hr>"
                                                                +"<div class='form-group form-inline'>"
                                                                     + "<button class='btn btn-success form-control col-md-8 offset-md-4'>Ubah</button>"
                                                                + "</div>"
                                                            + "</form>"
                                                        +"</div>"
                                                    +"</div>"
                                                +"</div>"
                                            +"</div>");
                                
                                out.print("<div class='col-md-3'>"
                                            +"<div class='card'>"
                                                +"<div class='card-header text-center'><h4 class='mb-0'>Foto Profil</h4></div>"
                                                +"<div class='card-body'>"
                                                    +"<img src='assets/img/admin-user.png' width='100%'>"
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
<!--        <br>
        <div class=" text-center">
            <a class="text-primary" href="home.jsp">Kembali</a></div>
        </div>  -->
        
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
    </body>
</html>
