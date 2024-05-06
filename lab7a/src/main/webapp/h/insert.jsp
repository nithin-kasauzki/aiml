<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String bname = request.getParameter("bname");
    String author = request.getParameter("author");
    String isbn = request.getParameter("isbn");
    double price = Double.parseDouble(request.getParameter("price"));
    String username = "user";
    String password = "pass";
    

    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/AppLab", username, password);
        String query = "INSERT INTO BOOK (bname, author, isbn, price) VALUES (?, ?, ?, ?)";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, bname);
        pstmt.setString(2, author);
        pstmt.setString(3, isbn);
        pstmt.setDouble(4, price);
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
%>
