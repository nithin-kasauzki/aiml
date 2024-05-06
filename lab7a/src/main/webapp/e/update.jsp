<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Employee</title>
</head>
<body>
    <h1>Update Employee</h1>
    <%
    
 // Database Connection Parameters
    String url = "jdbc:mysql://localhost:3306/AppLab";
    String username = "user";
    String password = "pass";
    
        if (request.getMethod().equals("POST")) {
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
                String query = "UPDATE Employee SET Ename=?, Dept=?, Doj=?, Salary=? WHERE Eid=?";
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, ename);
                pstmt.setString(2, dept);
                pstmt.setString(3, doj);
                pstmt.setString(4, salary);
                pstmt.setString(5, eid);
                int rowsUpdated = pstmt.executeUpdate();
                if (rowsUpdated > 0) {
                    out.println("Employee updated successfully!");
                } else {
                    out.println("No employee found with ID " + eid);
                }
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
        } else {
            String eid = request.getParameter("eid");
            String ename = "";
            String dept = "";
            Date doj = null;
            double salary = 0.0;
            
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, username, password);
                //conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yourdatabase", "username", "password");
                String query = "SELECT * FROM Employee WHERE Eid=?";
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, eid);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    ename = rs.getString("Ename");
                    dept = rs.getString("Dept");
                    doj = rs.getDate("Doj");
                    salary = rs.getDouble("Salary");
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
    %>
    <form action="update.jsp" method="post">
        <input type="hidden" name="eid" value="<%= eid %>">
        <label for="ename">Employee Name:</label>
        <input type="text" id="ename" name="ename" value="<%= ename %>"><br>
        <label for="dept">Department:</label>
        <input type="text" id="dept" name="dept" value="<%= dept %>"><br>
        <label for="doj">Date of Joining:</label>
        <input type="text" id="doj" name="doj" value="<%= doj %>"><br>
        <label for="salary">Salary:</label>
        <input type="text" id="salary" name="salary" value="<%= salary %>"><br>
        <input type="submit" value="Update">
    </form>
    <% } %>
        <a href="index.jsp">HOME</a>
</body>
</html>
