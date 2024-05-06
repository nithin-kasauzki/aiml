<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sorted Names</title>
</head>
<body>
    <h1>Sorted Names</h1>
    
    <%-- Define the list of names --%>
    <%
        // Define an array of names
        String[] names = {"John", "Alice", "Bob", "David", "Emily"};
        
        // Sort the array of names
        java.util.Arrays.sort(names);
    %>
    
    <ul>
        <%-- Display the sorted list of names --%>
        <% for (String name : names) { %>
            <li><%= name %></li>
        <% } %>
    </ul>
</body>
</html>
