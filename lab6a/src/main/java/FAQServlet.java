import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FAQServlet")
public class FAQServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;
  private static final String JDBC_URL = "jdbc:mysql://localhost:3306/AppLab";
  private static final String JDBC_USER = "user";
  private static final String JDBC_PASSWORD = "pass";

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");

    PrintWriter out = response.getWriter();
    
    out.println("<h1>FAQ </h1>");
    // Load the MySQL JDBC driver (assuming it's already in the classpath)
    try {
      Class.forName("com.mysql.jdbc.Driver");
      
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
      getServletContext().log("Error registering JDBC driver: " + e.getMessage());
      response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
          "Error class not found. Please try again later.");
      return;
    }

    try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
      String sql = "SELECT Topics.topicID, topicName, question, answer " +
          "FROM Topics INNER JOIN FAQ ON Topics.topicID = FAQ.topicID " +
          "ORDER BY Topics.topicID";
      
      try (PreparedStatement statement = conn.prepareStatement(sql);
          ResultSet rs = statement.executeQuery()) {
    
        int currentTopicID = -1;
        while (rs.next()) {
          int topicID = rs.getInt("topicID");
          String topicName = rs.getString("topicName");
          String question = rs.getString("question");
          String answer = rs.getString("answer");
          
          if (topicID != currentTopicID) {
            if (currentTopicID != -1) {
              out.println("</div>");
            }
            out.println("<h2>" + topicName + "</h2>");
            out.println("<div>");
            currentTopicID = topicID;
          }

          out.println("<p><strong>" + question + "</strong></p>");
          out.println("<p>" + answer + "</p>");
        }
        if (currentTopicID != -1) {
          out.println("</div>");
        }
      }
    } catch (SQLException e) {
      e.printStackTrace();
     
    }
  }
}
