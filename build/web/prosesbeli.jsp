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
                    String sql      = "INSERT INTO shopingcart(isbn,nim,qty,harga) VALUES ('"+isbn+"','"+nim+"','"+qty+"','"+harga+"')";
                    st.executeUpdate(sql);
                    
                    out.print(  "<script>"
                                    + "window.alert('Buku berhasil dimasukkan ke dalam keranjang.');"
                                    +"window.location.href='http://localhost:8080/PenjualanBuku/daftarbeli.jsp';"
                                +"</script>");
                    
                    //SELECT STOK
                    String sql2     = "SELECT stok FROM books  WHERE isbn = '"+isbn+"'";
                    ResultSet rs    = st.executeQuery(sql2);
                    
                    if(rs.next()) {
                        // UPDATE STOK BUKU
                        int stok = Integer.parseInt(rs.getString(1)) - Integer.parseInt(qty);
                        
                        String sql3      = "UPDATE books SET stok='"+stok+"' WHERE isbn = '"+isbn+"'";
                        st.executeUpdate(sql3);
                    }
                    
                    conn.close();
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
