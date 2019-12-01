<%-- 
    Document   : proses.jsp
    Created on : Nov 24, 2019, 8:55:33 PM
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
    </head>
    <body>
        <%
            String nim      = request.getParameter("nim");
            String password = request.getParameter("password");
            
            String cek      = request.getParameter("tombol");
            
            //  FUNGSI CEK, APAKAH DATA YANG DIPROSES BERUPA DATA LOGIN ATAU BUKAN
            if(cek.toString().equals("login")) {
                try {
                    koneksi connect     = new koneksi();
                    Connection conn     = connect.bukaKoneksi();
                    Statement st        = conn.createStatement();
                    String sqlCekNIM    = "SELECT nim FROM users WHERE nim='"+nim+"'";
                    ResultSet rs        = st.executeQuery(sqlCekNIM);
                    
                    // CEK ADA ATAU TIDAKNYA NIM DI DALAM DATABASE
                    if(rs.next()) {
                        String sqlCekPass   = "SELECT nim,nama,password FROM users WHERE nim='"+nim+"' AND password='"+password+"'";
                        ResultSet rs2       = st.executeQuery(sqlCekPass);
                        
                        // CEK APAKAH NIM DAN PASSWORD SESUAI
                        if(rs2.next()) {
                            session.setAttribute("nim", rs2.getString(1));
                            session.setAttribute("nama", rs2.getString(2));
                            
                            out.print(  "<script>"
                                            + "window.alert('Anda berhasil masuk. Selamat datang "+rs2.getString(2)+"!');"
                                            +"window.location.href='http://localhost:8080/PeminjamanBuku/home.jsp';"
                                        +"</script>");
                        }
                        else {
                            out.print(  "<script>"
                                        + "window.alert('NIM atau Password tidak sesuai.');"
                                        +"window.location.href='http://localhost:8080/PeminjamanBuku/login.jsp';"
                                    +"</script>");
                        }
                    }
                    else {
                        out.print(  "<script>"
                                        + "window.alert('NIM Anda tidak terdaftar.');"
                                        +"window.location.href='http://localhost:8080/PeminjamanBuku/login.jsp';"
                                    +"</script>");
                    }
                }
                catch(Exception x) {
                    out.print(  "<script>"
                                    + "window.alert('NIM atau Password salah.');"
                                    +"window.location.href='http://localhost:8080/PeminjamanBuku/login.jsp';"
                                +"</script>");
                }
            }
            
            //  FUNGSI CEK, APAKAH DATA YANG DIPROSES BERUPA DATA DAFTAR ATAU BUKAN
            if(cek.toString().equals("register")) 
            {
                String nama = request.getParameter("nama");
                
                try {
                    koneksi connect = new koneksi();
                    Connection conn = connect.bukaKoneksi();
                    Statement st    = conn.createStatement();
                    String sql      = "INSERT INTO users(nim,nama,password) VALUES ('"+nim+"','"+nama+"','"+password+"')";
                    st.executeUpdate(sql);
                    conn.close();
                    out.print(  "<script>"
                                    + "window.alert('Data berhasil disimpan. Anda berhasil mendaftar.');"
                                    +"window.location.href='http://localhost:8080/PeminjamanBuku/login.jsp';"
                                +"</script>");
                }
                catch(Exception x) {
                    out.print(  "<script>"
                                    +"window.alert('Data sudah pernah ada dalam database, data gagal disimpan.');"
                                    +"window.location.href='http://localhost:8080/PeminjamanBuku/register.jsp';"
                                +"</script>");
                }
            }
        %>
    </body>
</html>