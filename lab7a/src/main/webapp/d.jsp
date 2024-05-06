<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Website Visit Counter</title>
</head>
<body>
    <h1>Website Visit Counter</h1>
    <%@ page import="javax.servlet.http.*" %>
    
    <%-- Get the current count from the session --%>
    <% int visitCount = 0; %>
    <% if (request.getSession().getAttribute("visitCount") != null) { %>
        <% visitCount = (int) request.getSession().getAttribute("visitCount"); %>
    <% } %>
    
    <%-- Increment the visit count --%>
    <% visitCount++; %>
    
    <%-- Update the session with the new count --%>
    <% request.getSession().setAttribute("visitCount", visitCount); %>
    
    <%-- Display the visit count --%>
    <p>This website has been visited <%= visitCount %> times.</p>
</body>
</html>
