<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dynamic FAQs</title>
</head>
<body>
    <h1>Dynamic FAQs</h1>
    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rsTopics = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/AppLab", "user", "pass");
            
            // Retrieve topics
            stmt = conn.createStatement();
            rsTopics = stmt.executeQuery("SELECT * FROM Topics");
            while (rsTopics.next()) {
                int topicID = rsTopics.getInt("topicID");
                String topicName = rsTopics.getString("topicName");
    %>
    <h2><%= topicName %></h2>
    <ul>
    <%
                PreparedStatement pstmt = null;
                ResultSet rsFAQs = null;
                try {
                    // Retrieve FAQs for the current topic
                    String faqQuery = "SELECT * FROM FAQ WHERE topicID=?";
                    pstmt = conn.prepareStatement(faqQuery);
                    pstmt.setInt(1, topicID);
                    rsFAQs = pstmt.executeQuery();
                    while (rsFAQs.next()) {
                        String question = rsFAQs.getString("question");
                        String answer = rsFAQs.getString("answer");
    %>
        <li>
            <strong><%= question %></strong><br>
            <%= answer %>
        </li>
    <%
                    }
                } finally {
                    if (rsFAQs != null) rsFAQs.close();
                    if (pstmt != null) pstmt.close();
                }
    %>
    </ul>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rsTopics != null) rsTopics.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
