<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Management</title>
</head>
<body>
    <h1>Employee Management</h1>
    <table border="1">
        <tr>
            <th>Eid</th>
            <th>Ename</th>
            <th>Dept</th>
            <th>Doj</th>
            <th>Salary</th>
            <th>Action</th>
        </tr>
        <% 
        
        String url = "jdbc:mysql://localhost:3306/AppLab";
        String username = "user";
        String password = "pass";
        
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, username, password);
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM Employee");
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("Eid") %></td>
            <td><%= rs.getString("Ename") %></td>
            <td><%= rs.getString("Dept") %></td>
            <td><%= rs.getDate("Doj") %></td>
            <td><%= rs.getDouble("Salary") %></td>
            <td>
                <a href="update.jsp?eid=<%= rs.getString("Eid") %>">Update</a>
                <a href="delete.jsp?eid=<%= rs.getString("Eid") %>">Delete</a>
            </td>
        </tr>
        <% 
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        %>
    </table>
    <br>
    <a href="insert.jsp">Insert New Employee</a>
</body>
</html>
