<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Book Management</title>
</head>
<body>
    <h1>Book Management</h1>

    <h2>Book List</h2>
    <table border="1">
        <tr>
            <th>Bid</th>
            <th>Book Name</th>
            <th>Author</th>
            <th>ISBN</th>
            <th>Price</th>
            <th>Action</th>
        </tr>
        <% 
        String username = "user";
        String password = "pass";
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/AppLab", username, password);
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM BOOK");
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("bid") %></td>
            <td><%= rs.getString("bname") %></td>
            <td><%= rs.getString("author") %></td>
            <td><%= rs.getString("isbn") %></td>
            <td><%= rs.getDouble("price") %></td>
            <td>
                <a href="update.jsp?bid=<%= rs.getString("bid") %>">Update</a>
                <a href="delete.jsp?bid=<%= rs.getString("bid") %>">Delete</a>
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

    <h2>Insert New Book</h2>
    <form action="insert.jsp" method="post">
        <label for="bname">Book Name:</label>
        <input type="text" id="bname" name="bname"><br>
        <label for="author">Author:</label>
        <input type="text" id="author" name="author"><br>
        <label for="isbn">ISBN:</label>
        <input type="text" id="isbn" name="isbn"><br>
        <label for="price">Price:</label>
        <input type="text" id="price" name="price"><br>
        <input type="submit" value="Insert">
    </form>
</body>
</html>
