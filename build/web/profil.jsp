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
                        <img src="assets/img/logo.png" alt="logo" width="50px"> <strong>Ar-Rahman Store</strong></a>
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
                            <a class="navbar-brand ml-5 pl-3" href="home.jsp"><img src="assets/img/bookadd.png" width="50px"></a>
                            <a class="navbar-brand" href="daftarbeli.jsp"><img src="assets/img/shoppingcart.png" width="50px"></a>
                            <%
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
                                            out.print("<div class='jumlahKeranjang bg-warning text-white' style='cursor: pointer;'><span style='position: relative; top: 0.5px; left: -0.5px;'>"+rs.getString(1)+"</span></div>");
                                            flag = 1;
                                        }
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
                                    <a class="dropdown-item disabled" href="profil.jsp" style="text-decoration: none;">Profil</a>
                                    <a class="dropdown-item" href="home.jsp" style="text-decoration: none;">Beli Buku</a>
                                    <a class="dropdown-item" href="daftarbeli.jsp" style="text-decoration: none;">Keranjang</a>
                                    <a class="dropdown-item" href="pembayaran.jsp" style="text-decoration: none;">Pembayaran</a>
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
                                                +"<div class='card-body'>"
                                                    +"<table>"
                                                        +"<thead>"
                                                            +"<tr>"
                                                                +"<th>NIM</th>"
                                                                +"<td class='pl-1'>:</td>"
                                                                +"<td class='pl-3'> "+rs.getString(1)+"</td>"
                                                            +"</tr>"
                                                            +"<tr>"
                                                                +"<th>Nama</th>"
                                                                +"<td class='pl-1'>:</td>"
                                                                +"<td class='pl-3'> "+rs.getString(2)+"</td>"
                                                            +"</tr>"
                                                            +"<tr>"
                                                                +"<th>Alamat</th>"
                                                                +"<td class='pl-1'>:</td>"
                                                                +"<td class='pl-3'> "+rs.getString(3)+"</td>"
                                                            +"</tr>"
                                                            +"<tr>"
                                                                +"<th width='100px'>Kata Sandi</th>"
                                                                +"<td class='pl-1'>:</td>"
                                                                +"<td class='pl-3'> "+rs.getString(4)+"</td>"
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
                                                            +"<form action='profil.jsp' method='post'>"
                                                                +"<div class='form-group form-inline'>"
                                                                    + "<label class='col-md-4'>NIM</label>"
                                                                    + "<input class='form-control col-md-8' type='text' name='nim' value='"+rs.getString(1)+"' readonly>"
                                                                + "</div>"
                                                                +"<div class='form-group form-inline'>"
                                                                    + "<label class='col-md-4'>Nama</label>"
                                                                    + "<input class='form-control col-md-8' type='text' name='nama' value='"+rs.getString(2)+"' required>"
                                                                + "</div>"
                                                                +"<div class='form-group form-inline'>"
                                                                    + "<label class='col-md-4'>Alamat</label>"
                                                                    + "<textarea class='form-control col-md-8' type='text' name='alamat' required>"+rs.getString(3)+"</textarea>"
                                                                + "</div>"
                                                                +"<div class='form-group form-inline'>"
                                                                    + "<label class='col-md-4'>Kata Sandi</label>"
                                                                    + "<input class='form-control col-md-8' type='text' name='password' value='"+rs.getString(4)+"' required>"
                                                                + "</div>"
                                                                +"<hr>"
                                                                +"<div class='form-group form-inline'>"
                                                                     + "<button type='submit' name='tombol' value='ubah' class='btn btn-success form-control col-md-8 offset-md-4'>Ubah</button>"
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
        <%
            String cek      = request.getParameter("tombol");
            
            if(cek != null && cek.toString().equals("ubah")) {
                String id       = request.getParameter("nim");
                String nama     = request.getParameter("nama");
                String alamat   = request.getParameter("alamat");
                String password = request.getParameter("password");
                
                try {
                    koneksi connect = new koneksi();
                    Connection conn = connect.bukaKoneksi();
                    Statement st    = conn.createStatement();
                    String sql      = "UPDATE users SET nama='"+nama+"', alamat='"+alamat+"', password='"+password+"' WHERE nim="+id+"";
                    st.executeUpdate(sql);
                    conn.close();
                    
                    session.removeAttribute("nama");
                    session.setAttribute("nama", nama);
                    out.print(  "<script>"
                                    + "window.alert('Data berhasil diubah.');"
                                    +"window.location.href='http://localhost:8080/PenjualanBuku/profil.jsp';"
                                +"</script>");
                }
                catch(Exception x) {
                    out.print(  "<script>"
                                    +"window.alert('Data gagal diubah.');"
                                    +"window.location.href='http://localhost:8080/PenjualanBuku/profil.jsp';"
                                +"</script>");
                }
            }
        %>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
    </body>
</html>
