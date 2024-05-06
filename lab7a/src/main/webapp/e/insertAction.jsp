<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insert Action</title>
</head>
<body>
    <%
    
    String url = "jdbc:mysql://localhost:3306/AppLab";
    String username = "user";
    String password = "pass";
    
        String eid = request.getParameter("eid");
        String ename = request.getParameter("ename");
        String dept = request.getParameter("dept");
        String doj = request.getParameter("doj");
        String salary = request.getParameter("salary");
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
        	Class.forName("com.mysql.jdbc.Driver");
            
        	conn = DriverManager.getConnection(url, username, password);
            String query = "INSERT INTO Employee (Eid, Ename, Dept, Doj, Salary) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, eid);
            pstmt.setString(2, ename);
            pstmt.setString(3, dept);
            pstmt.setString(4, doj);
            pstmt.setString(5, salary);
            pstmt.executeUpdate();
            out.println("Employee inserted successfully!");
            
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        }
    %>
    <a href="index.jsp">HOME</a>
</body>
</html>