<%-- 
    Document   : proseskeranjang
    Created on : Dec 7, 2019, 11:25:27 AM
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
            String cek      = request.getParameter("tombol");
            
            if(cek.toString().equals("hapus")) {
                String nim      = request.getParameter("nim");
                String isbn     = request.getParameter("isbn");

                try {
                    koneksi connect     = new koneksi();
                    Connection conn     = connect.bukaKoneksi();
                    Statement st        = conn.createStatement();
                    String sqlSelect    = "SELECT qty FROM shopingcart WHERE nim='"+nim+"' AND isbn='"+isbn+"' AND status='belum lunas'";
                    ResultSet rs        = st.executeQuery(sqlSelect);
                    
                    if(rs.next()) {
                        String sqlUpdate    = "UPDATE books SET stok=stok+"+Integer.parseInt(rs.getString(1))+" WHERE isbn='"+isbn+"'";
                        st.executeUpdate(sqlUpdate);
                        
                        String sqlDelete    = "DELETE FROM shopingcart WHERE nim='"+nim+"' AND isbn='"+isbn+"' AND status='belum lunas'";
                        st.executeUpdate(sqlDelete);
                        
                        out.print(  "<script>"
                                        + "window.alert('Berhasil menghapus buku.');"
                                        +"window.location.href='http://localhost:8080/PenjualanBuku/daftarbeli.jsp';"
                                    +"</script>");
                    }
                }
                catch(Exception x) {
                    out.print(  "<script>"
                                    + "window.alert('Gagal menghapus buku.');"
                                    +"window.location.href='http://localhost:8080/PenjualanBuku/daftarbeli.jsp';"
                                +"</script>");
                }
            }
            
            if(cek.toString().equals("plus")) {
                String nim      = request.getParameter("nim");
                String isbn     = request.getParameter("isbn");
                
                try {
                    koneksi connect     = new koneksi();
                    Connection conn     = connect.bukaKoneksi();
                    Statement st        = conn.createStatement();
                    String sqlSelect    = "SELECT stok FROM books WHERE  isbn='"+isbn+"'";
                    ResultSet rs        = st.executeQuery(sqlSelect);
                    int flag = 0;
                    
                    if(rs.next()) {
                        if(Integer.parseInt(rs.getString(1)) > 0) {
                            flag = 1;
                            String sqlUpdate    = "UPDATE books SET stok=stok-1 WHERE isbn='"+isbn+"'";
                            st.executeUpdate(sqlUpdate);

                            String sqlUpdate2    = "UPDATE shopingcart SET qty=qty+1 WHERE isbn='"+isbn+"' AND nim='"+nim+"' AND status='belum lunas'";
                            st.executeUpdate(sqlUpdate2);
                        }
                    }
                    
                    if(flag == 0) {
                        out.print(  "<script>"
                                        + "window.alert('Stok telah habis. Gagal menambahkan buku.');"
                                        +"window.location.href='http://localhost:8080/PenjualanBuku/daftarbeli.jsp';"
                                    +"</script>");
                    }
                    else {
                        out.print(  "<script>"
                                        + "window.alert('Berhasil menambahkan(Qty) buku.');"
                                        +"window.location.href='http://localhost:8080/PenjualanBuku/daftarbeli.jsp';"
                                    +"</script>");
                    }
                }
                catch(Exception e) {
                    out.print(  "<script>"
                                + "window.alert('Gagal menambahkan buku.');"
                                +"window.location.href='http://localhost:8080/PenjualanBuku/daftarbeli.jsp';"
                            +"</script>");
                }
            }
            
            if(cek.toString().equals("minus")) {
                String nim      = request.getParameter("nim");
                String isbn     = request.getParameter("isbn");
                
                try {
                    koneksi connect     = new koneksi();
                    Connection conn     = connect.bukaKoneksi();
                    Statement st        = conn.createStatement();
                    String sqlSelect    = "SELECT qty FROM shopingcart WHERE  isbn='"+isbn+"' AND nim='"+nim+"' AND status='belum lunas'";
                    ResultSet rs        = st.executeQuery(sqlSelect);
                    int flag = 0;
                    
                    if(rs.next()) {
                        if(Integer.parseInt(rs.getString(1)) > 1) {
                            flag = 1;
                            String sqlUpdate    = "UPDATE books SET stok=stok+1 WHERE isbn='"+isbn+"'";
                            st.executeUpdate(sqlUpdate);

                            String sqlUpdate2    = "UPDATE shopingcart SET qty=qty-1 WHERE isbn='"+isbn+"' AND nim='"+nim+"' AND status='belum lunas'";
                            st.executeUpdate(sqlUpdate2);
                        }
                    }
                    
                    if(flag == 0) {
                        out.print(  "<script>"
                                        + "window.alert('Qty tidak boleh kurang dari 1(satu). Gagal mengurangi buku.');"
                                        +"window.location.href='http://localhost:8080/PenjualanBuku/daftarbeli.jsp';"
                                    +"</script>");
                    }
                    else {
                        out.print(  "<script>"
                                        + "window.alert('Berhasil mengurangi(Qty) buku.');"
                                        +"window.location.href='http://localhost:8080/PenjualanBuku/daftarbeli.jsp';"
                                    +"</script>");
                    }
                }
                catch(Exception e) {
                    out.print(  "<script>"
                                + "window.alert('Gagal mengurangi buku.');"
                                +"window.location.href='http://localhost:8080/PenjualanBuku/daftarbeli.jsp';"
                            +"</script>");
                }
            }
        %>
    </body>
</html>
