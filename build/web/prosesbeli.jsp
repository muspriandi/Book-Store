<%-- 
    Document   : prosesbeli
    Created on : Dec 1, 2019, 11:09:50 PM
    Author     : User
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="jdbc.koneksi"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JWP - Penjualan Buku</title>
    </head>
    <body>
        <%
            String nim      = request.getParameter("nim");
            String isbn     = request.getParameter("isbn");
            String qty      = request.getParameter("qty");
            String harga    = request.getParameter("harga");
            
            //  FUNGSI BELI BUKU
            try {
                    koneksi connect = new koneksi();
                    Connection conn = connect.bukaKoneksi();
                    Statement st    = conn.createStatement();
                    
                    //SELECT STOK
                    String sql     = "SELECT stok FROM books  WHERE isbn = '"+isbn+"'";
                    ResultSet rs    = st.executeQuery(sql);
                    
                    if(rs.next()) {
                        // UPDATE STOK BUKU
                        if(Integer.parseInt(qty) <= Integer.parseInt(rs.getString(1)))
                        {
                            int stok = Integer.parseInt(rs.getString(1)) - Integer.parseInt(qty);
                        
                            String sql2      = "UPDATE books SET stok='"+stok+"' WHERE isbn = '"+isbn+"'";
                            st.executeUpdate(sql2);

                            try {
                                String sql3     = "SELECT qty FROM shopingcart WHERE isbn = '"+isbn+"' AND nim='"+nim+"' AND status='belum lunas'";
                                ResultSet rs2    = st.executeQuery(sql3);
                                
                                int flag = 0;
                                if(rs2.next()) {
                                    flag = 1;
                                    
                                    int stokTambah = Integer.parseInt(rs2.getString(1)) + Integer.parseInt(qty);
                                    String sql4      = "UPDATE shopingcart SET qty='"+stokTambah+"' WHERE isbn = '"+isbn+"' AND nim='"+nim+"'";
                                    st.executeUpdate(sql4);

                                    out.print(  "<script>"
                                                    + "window.alert('Buku berhasil dimasukkan ke dalam keranjang.');"
                                                    +"window.location.href='http://localhost:8080/PenjualanBuku/daftarbeli.jsp';"
                                                +"</script>"); 
                                }
                                if(flag == 0) {
                                    String sql5      = "INSERT INTO shopingcart(isbn,nim,qty,harga,status) VALUES ('"+isbn+"','"+nim+"','"+qty+"','"+harga+"','belum lunas')";
                                    st.executeUpdate(sql5);

                                    out.print(  "<script>"
                                                    + "window.alert('Buku berhasil dimasukkan ke dalam keranjang.');"
                                                    +"window.location.href='http://localhost:8080/PenjualanBuku/daftarbeli.jsp';"
                                                +"</script>");   
                                }
                            }
                            catch(Exception e) {
                                out.print(  "<script>"
                                                +"window.alert('Buku tidak dapat dibeli.');"
                                                +"window.location.href='http://localhost:8080/PenjualanBuku/home.jsp';"
                                            +"</script>");
                            }
                        }
                        else
                        {
                            out.print(  "<script>"
                                            + "window.alert('Qty melebihi stok yang tersedia. Buku gagal dimasukan ke dalam keranjang');"
                                            +"window.location.href='http://localhost:8080/PenjualanBuku/daftarbeli.jsp';"
                                        +"</script>");
                        }
                    conn.close();
                }
            }
            catch(Exception x) {
                out.print(  "<script>"
                                +"window.alert('Buku tidak dapat dibeli.');"
                                +"window.location.href='http://localhost:8080/PenjualanBuku/home.jsp';"
                            +"</script>");
            }
        %>
    </body>
</html>
