import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/WelcomeServlet")
public class WelcomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html"); // Set content type to HTML
        PrintWriter out = response.getWriter();
        
        // Generating dynamic HTML document
       
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Welcome to Servlets</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Welcome to Servlets!</h1>");
        out.println("</body>");
        out.println("</html>");
    }
}
