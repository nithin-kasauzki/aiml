import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/IServlet")
public class IServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Selected Fruits</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h2>Selected Fruits</h2>");

        String[] selectedFruits = request.getParameterValues("fruit");

        if (selectedFruits != null && selectedFruits.length > 0) {
            out.println("<ul>");
            for (String fruit : selectedFruits) {
                out.println("<li>" + fruit + "</li>");
            }
            out.println("</ul>");
        } else {
            out.println("<p>No fruits selected</p>");
        }

        out.println("</body>");
        out.println("</html>");
    }
}
