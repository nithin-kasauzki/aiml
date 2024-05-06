<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Form Parameters</title>
</head>
<body>
    <h1>Form Parameters</h1>
    <ul>
        <% 
            // Retrieve all form parameter names and their corresponding values
            java.util.Enumeration<String> parameterNames = request.getParameterNames();
            while (parameterNames.hasMoreElements()) {
                String paramName = parameterNames.nextElement();
        %>
        <li><%= paramName %>: <%= request.getParameter(paramName) %></li>
        <% } %>
    </ul>
</body>
</html>
