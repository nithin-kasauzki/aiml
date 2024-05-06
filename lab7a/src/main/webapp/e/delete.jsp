<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Employee</title>
</head>
<body>
    <h1>Delete Employee</h1>
    <%
        String eid = request.getParameter("eid");
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/AppLab", "user", "pass");
            //conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yourdatabase", "username", "password");
            String query = "DELETE FROM Employee WHERE Eid=?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, eid);
            pstmt.executeUpdate();
            out.println("Employee with ID " + eid + " deleted successfully!");
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
    <a href="index.jsp">HOME</a>
</body>
</html>
