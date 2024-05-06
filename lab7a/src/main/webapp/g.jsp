<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>
<%
    // Database Connection Parameters
    String url = "jdbc:mysql://localhost:3306/AppLab";
    String username = "user";
    String password = "pass";

    // Handling form submission
    String animal = request.getParameter("animal");
    if(animal != null) {
        try {
            // Establishing database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, username, password);
            
            // Updating vote count for the selected animal
            PreparedStatement pstmt = conn.prepareStatement("UPDATE survey_results SET votes = votes + 1 WHERE animal = ?");
            pstmt.setString(1, animal);
            pstmt.executeUpdate();
            
            // Retrieving survey results
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = stmt.executeQuery("SELECT * FROM survey_results");
            
            // Generating HTML response with survey results
            out.println("<h1>Survey Results</h1>");
            int totalVotes = 0;
            while (rs.next()) {
                totalVotes += rs.getInt("votes");
            }
            rs.beforeFirst(); // Reset cursor to the beginning
            while (rs.next()) {
                String animalName = rs.getString("animal");
                int votes = rs.getInt("votes");
                double percentage = (double) votes / totalVotes * 100;
                out.println("<p>" + animalName + ": " + votes + " votes (" + String.format("%.2f", percentage) + "%)</p>");
            }
            out.println("<p>Total Responses: " + totalVotes + "</p>");

            // Closing database resources
            rs.close();
            stmt.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }
%>
