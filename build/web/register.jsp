<%-- 
    Document   : register.jsp
    Created on : Nov 24, 2019, 8:55:43 PM
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
                <div class="col-md-4 offset-md-4 mb-4">
                    <div class="card border-info" style="margin-top: 5%;">
                        <div class="card-header text-center text-info"><h3>Daftar</h3>Peminjaman Buku</div>
                        <div class="card-body text-secondary">
                            <form action="proseslogin.jsp" method="post" name="form1">
                                <div class="form-group">
                                    <label>NIM</label>
                                    <input type="text" name="nim" onkeypress="return khususAngka(event)" class="form-control" maxlength="10">
                                    <span id="alert-nim"></span>
                                </div>
                                <div class="form-group">
                                    <label>Nama Lengkap</label>
                                    <input type="text" name="nama" onkeypress="return khususNama()" class="form-control" maxlength="45">
                                    <span id="alert-nama"></span>
                                </div>
                                <div class="form-group">
                                    <label>Kata Sandi</label>
                                    <input type="password" name="password" onkeypress="return khususPassword()" class="form-control" maxlength="30">
                                    <span id="alert-password"></span>
                                </div>
                                <div class="form-group">
                                    <label>Konfirmasi Kata Sandi</label>
                                    <input type="password" name="cpassword" onkeypress="return khususCPassword()" class="form-control" maxlength="30">
                                    <span id="alert-cpassword"></span>
                                </div>
                                <div class="form-group">
                                   <input type="button" onclick="cek('register')" class="btn btn-outline-info w-100" value="Daftar">
                                    <div class="hr-sect">ATAU</div>
                                    <a href="login.jsp" class="btn btn-outline-secondary w-100">Masuk</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            // FUNGSI CEK(VALIDASI INPUTAN) SETELAH KLIK TOMBOL DAFTAR
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
                
                var x = document.forms["form1"]["nama"].value;
                var y = document.getElementById('alert-nama');
                if(x === null || x === "") {
                    y.innerHTML="<small class='text-danger'><strong>*Nama</strong> harus diisi.</small>";
                }
                else {
                    y.innerHTML="";
                    flag = flag+1;                  
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
                
                var z = document.forms["form1"]["cpassword"].value;
                var y = document.getElementById('alert-cpassword');
                if(z === null || z === "") {
                    y.innerHTML="<small class='text-danger'><strong>*Konfirmasi Password</strong> harus diisi.</small>";
                }
                else {
                    if(x != z) {
                        y.innerHTML="<small class='text-danger'><strong>*Konfirmasi Password</strong> harus sama dengan <strong>Password</strong>.</small>";
                    }
                    else {
                        y.innerHTML="";
                        flag = flag+1;
                    }
                }

                if(flag == 4) {
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

            function khususNama(){
                var x = document.forms["form1"]["nama"].value;
                var y = document.getElementById('alert-nama');
                y.innerHTML="";
            }

            function khususPassword(){
                var x = document.forms["form1"]["password"].value;
                var y = document.getElementById('alert-password');
                y.innerHTML="";
            }
            
            function khususCPassword(){
                var x = document.forms["form1"]["cpassword"].value;
                var y = document.getElementById('alert-cpassword');
                y.innerHTML="";
            }
        </script>
    </body>
</html>