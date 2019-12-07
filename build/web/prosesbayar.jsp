<%-- 
    Document   : transaksiPembelian
    Created on : Dec 6, 2019, 9:27:43 AM
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
            
            //  FUNGSI UNTUK TRANSAKSI PEMBELIAN
            if(cek.toString().equals("bayar")) {
                String nim          = session.getAttribute("nim").toString();
                String total        = request.getParameter("total");
                String alamat       = request.getParameter("alamat");
                String kurir        = request.getParameter("kurir");
                String pembayaran   = request.getParameter("pembayaran");
                
                try {
                    koneksi connect = new koneksi();
                    Connection conn = connect.bukaKoneksi();
                    Statement st    = conn.createStatement();
                    Statement st2   = conn.createStatement();
                    String sqlSelect= "SELECT id FROM shopingcart WHERE nim='"+nim+"' AND status='belum lunas'";
                    ResultSet rs    = st.executeQuery(sqlSelect);
                    int flag = 0;
                    
                    while(rs.next()) {
                        try {
                            String sqlUpdate= "UPDATE shopingcart SET status ='proses pembayaran' WHERE id='"+rs.getString(1)+"'";
                            st2.executeUpdate(sqlUpdate);
                            
                            flag = 1;
                        }
                        catch(Exception e) {
                            out.print(  "<script>"
                                            +"window.alert('Transaksi pembelian gagal.');"
                                            +"window.location.href='http://localhost:8080/PenjualanBuku/daftarbeli.jsp';"
                                        +"</script>");
                        }
                    }
                    
                    if(flag == 1) {
                        String sql      = "INSERT INTO payment(alamat,kurir,metode_pembayaran,total_belanja,nim) VALUES ('"+alamat+"','"+kurir+"','"+pembayaran+"','"+total+"','"+nim+"')";
                        st.executeUpdate(sql);
                        
                        out.print(  "<script>"
                                        + "window.alert('Transaksi pembelian berhasil.');"
                                        +"window.location.href='http://localhost:8080/PenjualanBuku/pembayaran.jsp';"
                                    +"</script>");
                    }
                    conn.close();
                }
                catch(Exception x) {
                    out.print(  "<script>"
                                    +"window.alert('Transaksi pembelian gagal.');"
                                    +"window.location.href='http://localhost:8080/PenjualanBuku/daftarbeli.jsp';"
                                +"</script>");
                }
            }
        %>
    </body>
</html>