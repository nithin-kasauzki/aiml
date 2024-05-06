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

@WebServlet("/SurveyServlet")
public class SurveyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/AppLab";
    private static final String JDBC_USER = "user"; // Your MySQL username
    private static final String JDBC_PASSWORD = "pass"; // Your MySQL password

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String animal = request.getParameter("animal");
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
            String updateQuery = "UPDATE survey_results SET votes = votes + 1 WHERE animal = ?";
            try (PreparedStatement statement = conn.prepareStatement(updateQuery)) {
                statement.setString(1, animal);
                statement.executeUpdate();
            }

            // Get updated survey results
            String selectQuery = "SELECT * FROM survey_results";
            try (PreparedStatement selectStatement = conn.prepareStatement(selectQuery);
                    ResultSet resultSet = selectStatement.executeQuery()) {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Survey Results</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h2>Survey Results</h2>");
                out.println("<table>");
                out.println("<tr><th>Animal</th><th>Votes</th></tr>");
                while (resultSet.next()) {
                    String animalName = resultSet.getString("animal");
                    int votes = resultSet.getInt("votes");
                    out.println("<tr><td>" + animalName + "</td><td>" + votes + "</td></tr>");
                }
                out.println("</table>");
                out.println("</body>");
                out.println("</html>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Error updating survey results: " + e.getMessage());
        }
    }
}
