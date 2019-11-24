<%-- 
    Document   : login.jsp
    Created on : Nov 24, 2019, 8:55:24 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JWP - Peminjaman Buku</title>
        <link rel="stylesheet" href="assets/css/bootstrap.css">
        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body class="background">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3 offset-md-7">
                    <div class="card border-info" style="margin-top: 35%;">
                        <div class="card-header text-center text-info"><h3>Masuk</h3>Peminjaman Buku</div>
                        <div class="card-body text-secondary">
                            <form action="proseslogin.jsp" method="post" name="form1">
                                <div class="form-group">
                                    <label>NIM</label>
                                    <input type="text" name="nim" class="form-control" onkeypress="return khususAngka(event)" maxlength="10">
                                    <span id="alert-nim"></span>
                                </div>
                                <div class="form-group">
                                    <label>Kata Sandi</label>
                                    <input type="password" name="password" class="form-control" onkeypress="return khususPassword()" id="password" maxlength="30">
                                    <span id="alert-password"></span>

                                    <span toggle="#password" class="btn btn-sm btn-info toggle-password">Lihat</span>
                                </div>   
                                <div class="form-group">
                                    <input type="button" onclick="cek('login')" class="btn btn-outline-info w-100" value="Masuk">
                                    <div class="hr-sect">ATAU</div>
                                    <a href="register.jsp" class="btn btn-outline-secondary w-100">Daftar</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script>
            // Toggle Show Password
            $(".toggle-password").click(function() {
                $(this).toggleClass("fa-eye fa-eye-slash");
                var input = $($(this).attr("toggle"));
                if (input.attr("type") == "password") {
                    input.attr("type", "text");
                }
                else {
                    input.attr("type", "password");
                }
            });

            // FUNGSI CEK(VALIDASI INPUTAN) SETELAH KLIK TOMBOL MASUK
            function cek(tombol) {
                var flag = 0;
                
                var x = document.forms["form1"]["nim"].value;
                var y = document.getElementById('alert-nim');
                if(x === null || x === "") {
                    y.innerHTML="<small class='text-danger'><strong>*NIM</strong> harus diisi.</small>";
                }
                else {
                    if(isNaN(x)) {
                        y.innerHTML="<small class='text-danger'><strong>*NIM</strong> harus berupa angka [0-9].</small>";
                    }
                    else{
                        y.innerHTML="";
                        flag = flag+1;
                    }
                }

                var x = document.forms["form1"]["password"].value;
                var y = document.getElementById('alert-password');
                if(x === null || x === "") {
                    y.innerHTML="<small class='text-danger'><strong>*Password</strong> harus diisi.</small>";
                }
                else {
                    y.innerHTML="";
                    flag = flag+1;
                }
                
                if(flag == 2)
                {
                    var input = document.createElement('input');
                    input.type="hidden";
                    input.name="tombol";
                    input.value=tombol;

                    var x = document.forms["form1"];
                    x.appendChild(input);
                    x.submit();
                }
            }

            // FUNGSI VALIDASI INPUTAN HANYA BERUPA ANGKA UNTUK ELEMENT NIM
            function khususAngka(evt){
                var x = document.forms["form1"]["nim"].value;
                var y = document.getElementById('alert-nim');
                var nomor = (evt.which) ? evt.which : event.keyCode;

                if(nomor >31 && (nomor <48 || nomor >57) || isNaN(x)) {
                    y.innerHTML="<small class='text-danger'><strong>*NIM</strong> harus berupa angka [0-9].</small>";
                }
                else {
                    y.innerHTML="";
                }
            }

            function khususPassword(){
                var x = document.forms["form1"]["password"].value;
                var y = document.getElementById('alert-password');
                y.innerHTML="";
            }
        </script>
    </body>
</html>
