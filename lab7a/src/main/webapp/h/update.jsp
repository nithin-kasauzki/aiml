<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Book</title>
</head>
<body>
    <h1>Update Book</h1>
    <%
    String username = "user";
    String password = "pass";
        String action = request.getParameter("action");
        if (action != null && action.equals("update")) {
            String bid = request.getParameter("bid");
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/AppLab", username, password);
                String query = "SELECT * FROM BOOK WHERE bid = ?";
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, bid);
                rs = pstmt.executeQuery();
                if (rs.next()) {
    %>
    <form action="updateaction.jsp" method="post">
        <input type="hidden" name="bid" value="<%= rs.getString("bid") %>">
        <label for="bname">Book Name:</label>
        <input type="text" id="bname" name="bname" value="<%= rs.getString("bname") %>"><br>
        <label for="author">Author:</label>
        <input type="text" id="author" name="author" value="<%= rs.getString("author") %>"><br>
        <label for="isbn">ISBN:</label>
        <input type="text" id="isbn" name="isbn" value="<%= rs.getString("isbn") %>"><br>
        <label for="price">Price:</label>
        <input type="text" id="price" name="price" value="<%= rs.getDouble("price") %>"><br>
        <input type="submit" value="Update">
    </form>
    <% 
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } else if (action != null && action.equals("updateaction")) {
            // Handle update action
            String bid = request.getParameter("bid");
            String bname = request.getParameter("bname");
            String author = request.getParameter("author");
            String isbn = request.getParameter("isbn");
            double price = Double.parseDouble(request.getParameter("price"));
            
            Connection conn = null;
            PreparedStatement pstmt = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/AppLab", username, password);
                String query = "UPDATE BOOK SET bname=?, author=?, isbn=?, price=? WHERE bid=?";
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, bname);
                pstmt.setString(2, author);
                pstmt.setString(3, isbn);
                pstmt.setDouble(4, price);
                pstmt.setString(5, bid);
                pstmt.executeUpdate();
                response.sendRedirect("index.jsp");
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</body>
</html>
