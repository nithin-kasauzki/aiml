import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DServlet")
public class DServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve the selected color from the request parameters
        String selectedColor = request.getParameter("color");

        // Display the selected color in the servlet window
        out.println("<html>");
        out.println("<head><title>Selected Color</title></head>");
        out.println("<body>");
        out.println("<h2>Selected Color:</h2>");
        out.println("<p>" + selectedColor + "</p>");
        out.println("</body>");
        out.println("</html>");
    }
}
