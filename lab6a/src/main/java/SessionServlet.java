import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SessionServlet")
public class SessionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String language = request.getParameter("language");
        String isbn = "";

        if (language.equals("C")) {
            isbn = "9780131103627";
        } else if (language.equals("C++")) {
            isbn = "9780133975211";
        } else if (language.equals("Java")) {
            isbn = "9780134685991";
        } else if (language.equals("VB 6")) {
            isbn = "9780470177075";
        }

        HttpSession session = request.getSession(); // Create or retrieve HttpSession
        session.setAttribute(language, isbn); // Add language and corresponding ISBN to session

        // Display session information
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset=\"UTF-8\">");
        out.println("<title>Session Information</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Session Information</h1>");
        out.println("<p>Session ID: " + session.getId() + "</p>");
        out.println("<p>New Session: " + !session.isNew() + "</p>");
        out.println("<p>Creation Time: " + new java.util.Date(session.getCreationTime()) + "</p>");
        out.println("<p>Last Accessed Time: " + new java.util.Date(session.getLastAccessedTime()) + "</p>");
        out.println("<p>Maximum Inactive Interval: " + session.getMaxInactiveInterval() + " seconds</p>");
        out.println("</body>");
        out.println("</html>");
    }
}
