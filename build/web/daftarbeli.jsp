<%-- 
    Document    : daftarpinjam
    Created on  : Nov 22, 2019, 1:41:30 PM
    Author      : User
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
                            <form class="searchBox" action="caribuku.jsp" method="get">
                                <input type="search" name="keyword" class="form-control w-100" placeholder="Cari sesuatu di sini">
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
                                    <a class="dropdown-item disabled" href="daftarbeli.jsp" style="text-decoration: none;">Keranjang</a>
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
                <!--DAFTAR BUKU-->
                <div class="col-md-12 mb-3">
                    <div class="hr-sect">
                        <span>
                            <h3 class="text-dark m-0 px-3 text-center">Keranjang Belanja</h3>
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
                                        out.print("<h5 class='text-center'>Total buku dalam keranjang : "+rs.getString(1)+"</h5>");
                                    }
                                    
                                    // JIKA DATA KOSONG
                                    if(flag == 0) {
                                        out.print("<h5 class='text-center'>Total buku dalam keranjang : 0</h5>");
                                    }
                                }
                                catch(Exception e) {
                                    
                                }
                            %>
                        </span>
                    </div>
                    <table class="table table-bordered table-responsive table-hover text-center mb-5">
                        <thead class="bg-primary text-white" width="100%" class="w-100">
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
                        <%
                            String nim      = session.getAttribute("nim").toString();

                            try {
                                koneksi connect     = new koneksi();
                                Connection conn     = connect.bukaKoneksi();
                                Statement st        = conn.createStatement();
                                String sqlGetData   = "SELECT books.*, shopingcart.* FROM books INNER JOIN shopingcart ON books.isbn = shopingcart.isbn WHERE nim='"+nim+"' AND status='belum lunas' GROUP BY shopingcart.isbn";
                                ResultSet rs        = st.executeQuery(sqlGetData);

                                int i = 1;
                                double total = 0;
                                double grandTotal = 0;
                                DecimalFormat dec   = new DecimalFormat("#0.000");
                                
                                while(rs.next()) {
                                    
                                    Statement st2        = conn.createStatement();
                                    String sqlGetTotalQty   = "SELECT SUM(qty) as totalqty FROM shopingcart WHERE nim='"+nim+"' AND isbn='"+rs.getString(1)+"' AND status='belum lunas'";
                                    ResultSet rs2           = st2.executeQuery(sqlGetTotalQty);
                                    if(rs2.next()) {
                                        total       = Double.parseDouble(rs.getString(14)) * Double.parseDouble(rs2.getString(1));
                                        grandTotal  = grandTotal + total;
                                        
                                        out.print("<tr data-toggle='modal' data-target='.bd-example-modal-lg"+rs.getString(1)+"' style='cursor: pointer;'>"
                                                    + "<td>"+i+"</td>"
                                                    + "<td>"+rs.getString(1)+"</td>"
                                                    + "<td>"+rs.getString(2)+"</td>"
                                                    + "<td>"+rs.getString(3)+"</td>"
                                                    + "<td>"+rs.getString(14)+"</td>"
                                                    + "<td>"+rs2.getString(1)+"</td>"
                                                    + "<td class='text-left'><strong>Rp"+dec.format(total)+",00</strong></td>"
                                                + "</tr>");
                                        
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
                                                                     +"<div class='col-md-4 offset-md-1 py-4'>"
                                                                         +"<img src='assets/img/"+rs.getString(7)+"' width='100%'>"
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
                                                                                +"<div class='row'>"
                                                                                    +"<div class='col-md-4 bg-light mt-2 py-2'><label class='text-muted'>Tanggal Terbit</label></div>"
                                                                                    +"<div class='col-md-8 bg-light mt-2 py-2'> : "+rs.getString(5)+"</div>"
                                                                                +"</div>"
                                                                                +"<div class='row'>"
                                                                                    +"<div class='col-md-4 mt-2 py-1'><label class='text-muted'>ISBN</label></div>"
                                                                                    +"<div class='col-md-8 mt-2 py-1'> : "+rs.getString(1)+"</div>"
                                                                                +"</div>"
                                                                                +"<div class='row'>"
                                                                                    +"<div class='col-md-4 bg-light mt-2 py-2'><label class='text-muted'>Bahasa</label></div>"
                                                                                    +"<div class='col-md-8 bg-light mt-2 py-2'> : Indonesia</div>"
                                                                                +"</div>"
                                                                                +"<div class='row'>"
                                                                                    +"<div class='col-md-4 mt-2 py-1'><label class='text-muted'>Penerbit</label></div>"
                                                                                    +"<div class='col-md-8 mt-2 py-1'> : "+rs.getString(6)+"</div>"
                                                                                +"</div>"
                                                                            +"</div>"
                                                                        +"</div>"
                                                                    +"</div>"
                                                                 +"</div>"
                                                            +"</div>"
                                                        +"</div>"
                                                    +"</div>");
                                        
                                        i++;
                                    }
                                }
                                
                                // JIKA DATA KOSONG
                                if(i == 1) {
                                    out.print(  "<tr>"
                                                    + "<td colspan='7' class='py-5'><h4>Keranjang masih kosong.</h4><a class='text-dark' href='home.jsp'>Beli buku sekarang!</a></td>"
                                                + "</tr>");
                                }
                                else {
                                    out.print("<tr style='background-color: rgba(0, 0, 0, 0.1);'>"
                                                + "<td colspan='6' class='text-right'><strong>Total yang harus dibayar</strong></td>"
                                                + "<td class='text-left'>"
                                                    + "<strong>Rp"+dec.format(grandTotal)+",00</strong>"
                                                    + "<button class='btn btn-success w-100 mt-2' data-toggle='modal' data-target='.bd-example-modal-lg"+nim+"'>Bayar"
                                                + "</td>"
                                            + "</tr>");
                                    
                                    try {
                                        String sqlGetProfile    = "SELECT alamat FROM users WHERE nim='"+nim+"'";
                                        ResultSet rs3           = st.executeQuery(sqlGetProfile);
                                        
                                        if(rs3.next())
                                        {
                                            out.print(" <div class='modal fade bd-example-modal-lg"+nim+"' tabindex='-1' role='dialog' aria-labelledby='myLargeModalLabel' aria-hidden='true'>"
                                                            +"<div class='modal-dialog modal-lg'>"
                                                                +"<div class='modal-content'>"
                                                                    +"<div class='modal-header'>"
                                                                        +"<h5 class='modal-title' id='exampleModalLabel'>Bayar Keranjang</h5>"
                                                                        +"<button type='button' class='close' data-dismiss='modal' aria-label='Close'>"
                                                                            +"<span aria-hidden='true'>&times;</span>"
                                                                        +"</button>"
                                                                    +"</div>"
                                                                    +"<div class='modal-body'>"
                                                                        + "<div class='row mx-5'>"
                                                                            + "<form action='prosesbayar.jsp' method='post'>"
                                                                                + "<div class='col-md-12'>"
                                                                                    + "<div class='form-group'>"
                                                                                        + "<label>Total Belanja : </label>"
                                                                                        + "<strong> Rp"+dec.format(grandTotal)+",00</strong>"
                                                                                        + "<input type='hidden' name='total' value='"+dec.format(grandTotal)+"'>"
                                                                                    + "</div>"
                                                                                    + "<div class='form-group'>"
                                                                                        + "<label>Alamat Pengiriman :</label>"
                                                                                        + "<textarea name='alamat' class='form-control'>"+rs3.getString(1)+"</textarea>"
                                                                                    + "</div>"
                                                                                    + "<div class='form-group'>"
                                                                                        + "<label>Pilih Kurir Pengiriman :</label><br>"
                                                                                        + "<input type='radio' name='kurir' value='JNE Express' id='jne' class='m-2' checked>"
                                                                                        + "<label for='jne' class='mr-5'><img src='assets/img/jne.png' width='80px;'></label>"
                                                                                        + "<input type='radio' name='kurir' value='TIKI' id='tiki' class='m-2'>"
                                                                                        + "<label for='tiki' class='mr-5'><img src='assets/img/tiki.png' width='80px;'></label>"
                                                                                        + "<input type='radio' name='kurir' value='SiCepat Express' id='sicepat' class='m-2'>"
                                                                                        + "<label for='sicepat' class='mr-5'><img src='assets/img/sicepat.png' width='80px;'></label>"
                                                                                        + "<input type='radio' name='kurir' value='POS Indonesia' id='pos' class='m-2'>"
                                                                                        + "<label for='pos'><img src='assets/img/pos.png' width='80px;'></label>"
                                                                                    + "</div>"
                                                                                    + "<div class='form-group'>"
                                                                                        + "<label>Pilih Metode Pembayaran :</label>"
                                                                                        + "<select class='form-control' name='pembayaran'>"
                                                                                            + "<option value='Transfer - Mandiri'>Transfer - Mandiri</option>"
                                                                                            + "<option value='Transfer - BRI'>Transfer - BRI</option>"
                                                                                            + "<option value='Transfer - BNI'>Transfer - BNI</option>"
                                                                                            + "<option value='Gerai - Alfamart'>Gerai - Alfamart</option>"
                                                                                            + "<option value='Gerai - Indomart'>Gerai - Indomart</option>"
                                                                                        + "</select>"
                                                                                    + "</div>"
                                                                                    + "<button class='btn btn-outline-success w-100 my-4' name='tombol' value='bayar'>Bayar Sekarang!</button"
                                                                                + "</div>"
                                                                            + "</form>"
                                                                        + "</div>"
                                                                    +"</div>"
                                                                +"</div>"
                                                            +"</div>");      
                                        }
                                    }
                                    catch(Exception e) {
                                        
                                    }
                                }
                            }
                            catch(Exception e) {
                            }
                        %>
                        </tbody>
                    </table>
<!--                    <br>
                    <div class=" text-center">
                        <a class="text-primary" href="home.jsp">Kembali</a></div>
                    </div>-->
                </div>
            </div>
        </div>
        
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
    </body>
</html>

