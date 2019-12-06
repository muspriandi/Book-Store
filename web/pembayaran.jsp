<%-- 
    Document   : tPembelian
    Created on : Dec 6, 2019, 10:04:21 AM
    Author     : User
--%>
<%
    if(session.getAttribute("nim") == null || session.getAttribute("nama") == null)
    {
        response.sendRedirect("http://localhost:8080/PenjualanBuku/index.jsp");
    }
%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="jdbc.koneksi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                            <form class="searchBox" action="caribuku.jsp" method="get">
                                <input type="search" name="keyword" class="form-control w-100" placeholder="Cari sesuatu di sini">
                                <button type="submit"><img src="assets/img/search.png" width="15px" style="padding-bottom: 5px;"></button>
                            </form>
                        </div>
                        <div class="col-md-3 col-12 pr-0 my-1">
                            <a class="navbar-brand ml-5 pl-2" href="home.jsp"><img src="assets/img/bookadd.png" width="50px"></a>
                            <a class="navbar-brand" href="daftarbeli.jsp"><img src="assets/img/shoppingcart.png" width="50px"></a>
                            <%
                                //HITUNG JUMLAH DATA DI KERANJANG
                                try {
                                    koneksi connect     = new koneksi();
                                    Connection conn     = connect.bukaKoneksi();
                                    Statement st        = conn.createStatement();
                                    String sqlHitungBuku= "SELECT count(id) FROM shopingcart WHERE nim ='"+session.getAttribute("nim")+"' AND status='belum lunas'";
                                    ResultSet rs        = st.executeQuery(sqlHitungBuku);

                                    int flag = 0;
                                    if(rs.next()) {
                                        flag = 1;
                                        out.print("<div class='jumlahKeranjang bg-warning text-white' style='cursor: pointer;'><span style='position: relative; top: 0.5px; left: -0.5px;'>"+rs.getString(1)+"</span></div>");
                                    }
                                    
                                    // JIKA DATA KOSONG
                                    if(flag == 0) {
                                        out.print("<div class='jumlahKeranjang bg-warning text-white' style='cursor: pointer;'><span style='position: relative; top: 0.5px; left: -0.5px;'>0</span></div>");
                                    }
                                }
                                catch(Exception e) {
                                    
                                }
                            %>
                        </div>
                        <div class="col-md-2 col-12 pr-0 my-1">
                            <div class="navbar-brand dropdown ">
                                <img src="assets/img/admin-user.png" width="50px"> 
                                <a class="dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="text-decoration: none;">
                                    <%= session.getAttribute("nama") %>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="profil.jsp" style="text-decoration: none;">Profil</a>
                                    <a class="dropdown-item" href="home.jsp" style="text-decoration: none;">Beli Buku</a>
                                    <a class="dropdown-item" href="daftarbeli.jsp" style="text-decoration: none;">Keranjang</a>
                                    <a class="dropdown-item disabled" href="pembayaran.jsp" style="text-decoration: none;">Pembayaran</a>
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
        
        <div class="container mt-5 mb-5">
            <!--Transaksi Pembelian-->
            <div class="col-md-12 mb-3">
                <div class="hr-sect">
                    <h3 class="text-dark">Transaksi Pembayaran</h3>
                </div>
                
                <div class="row justify-content-center">
                    <%
                        String nim      = session.getAttribute("nim").toString();

                        try {
                            koneksi connect     = new koneksi();
                            Connection conn     = connect.bukaKoneksi();
                            Statement st        = conn.createStatement();
                            String sqlGetData   = "SELECT payment.*, users.nama FROM payment INNER JOIN users ON users.nim = payment.nim WHERE payment.nim='"+nim+"'";
                            ResultSet rs        = st.executeQuery(sqlGetData);

                            while(rs.next()) {
                                out.print("<div class='col-md-6 my-3'>"
                                            +"<div class='card'>"
                                                +"<div class='card-header text-center'><h4 class='mb-0'>Menunggu Pembayaran</h4></div>"
                                                +"<div class='card-body'>"
                                                    +"<h5 class='text-center'>Kode Pembayaran<h2 class='text-center text-primary'>MWY"+rs.getString(6)+"</h2></h5>"
                                                    +"<table style='margin-left: 55px;'>"
                                                        +"<thead>"
                                                            +"<tr>"
                                                                +"<td colspan='3'>"
                                                                    + "<div class='hr-sect mb-0'>"
                                                                        + "<strong class='text-dark'>Total yang harus dibayar</strong>"
                                                                    + "</div>"
                                                                + "</td>"
                                                            +"</tr>"
                                                            +"<tr>"
                                                                +"<td colspan='3'><h4 class='text-center text-success'>Rp"+rs.getString(5)+",00</h4></td>"
                                                            +"</tr>"
                                                            +"<tr>"
                                                                +"<td colspan='3'>"
                                                                    + "<div class='hr-sect mb-0'>"
                                                                        + "<strong class='text-dark'>Detail Pembelian</strong>"
                                                                    + "</div>"
                                                                + "</td>"
                                                            +"</tr>"
                                                            +"<tr>"
                                                                +"<td width='175px' class='text-right pr-3'>NIM Penerima</td>"
                                                                +"<td class='pl-1'>:</td>"
                                                                +"<td class='pl-3'> "+rs.getString(6)+"</td>"
                                                            +"</tr>"
                                                            +"<tr>"
                                                                +"<td width='175px' class='text-right pr-3'>Nama Penerima</td>"
                                                                +"<td class='pl-1'>:</td>"
                                                                +"<td class='pl-3'> "+rs.getString(7)+"</td>"
                                                            +"</tr>"
                                                            +"<tr>"
                                                                +"<td width='175px' class='text-right pr-3'>Alamat Penerima</td>"
                                                                +"<td class='pl-1'>:</td>"
                                                                +"<td class='pl-3'> "+rs.getString(2)+"</td>"
                                                            +"</tr>"
                                                            +"<tr>"
                                                                +"<td width='175px' class='text-right pr-3'>Kurir Pengiriman</td>"
                                                                +"<td class='pl-1'>:</td>"
                                                                +"<td class='pl-3'> "+rs.getString(3)+"</td>"
                                                            +"</tr>"
                                                            +"<tr>"
                                                                +"<td width='175px' class='text-right pr-3'>Metode Pengiriman</td>"
                                                                +"<td class='pl-1'>:</td>"
                                                                +"<td class='pl-3'> "+rs.getString(4)+"</td>"
                                                            +"</tr>"
                                                        +"</thead>"
                                                    +"</table>"
                                                +"</div>");
                                if(rs.getString(4).toString().substring(0,5).equals("Gerai"))
                                {
                                    out.print("<small class='text-center p-3'>Silahkan melakukan pembayaran melalui <strong>"+rs.getString(4)+"</strong> terdekat.</small>");
                                }
                                else
                                {
                                    out.print("<small class='text-center'>Silahkan melakukan pembayaran melalui cabang <strong>"+rs.getString(4)+"</strong> terdekat ke nomor rekening a.n. <strong>TEST</strong>");
                                }
                                out.print(  "</div>"
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
