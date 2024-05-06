<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String bid = request.getParameter("bid");
    
    // Database Connection Parameters
    String url = "jdbc:mysql://localhost:3306/AppLab";
    String username = "root";
    String password = "Pa$$word2";
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);
        
        // Prepare the delete query
        String query = "DELETE FROM BOOK WHERE bid = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, bid);
        
        // Execute the delete query
        int rowsAffected = pstmt.executeUpdate();
        if (rowsAffected > 0) {
            out.println("<h1>Book with ID " + bid + " deleted successfully!</h1>");
            out.println("<a href='index.jsp'>Go back to Book List</a>");
        } else {
            out.println("<h1>Failed to delete book with ID " + bid + ".</h1>");
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
