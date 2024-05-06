

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/EServlet")
public class EServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve selected language from the form submission
        String language = request.getParameter("language");

        // Add selected language as a cookie
        Cookie cookie = new Cookie("favoriteLanguage", language);
        response.addCookie(cookie);

        // Send response to the client
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h2>Your favorite programming language is: " + language + "</h2>");
        out.println("<a href=\"e.html\">Select Another Language</a>");
        out.println("</body></html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if the user wants to view book recommendations
        String showBooksParam = request.getParameter("showBooks");
        if (showBooksParam != null && showBooksParam.equals("true")) {
            // Retrieve favorite language from cookies
            Cookie[] cookies = request.getCookies();
            String favoriteLanguage = null;
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("favoriteLanguage")) {
                        favoriteLanguage = cookie.getValue();
                        break;
                    }
                }
            }

            // Send book recommendations based on favorite language
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<h2>Book Recommendations for " + favoriteLanguage + "</h2>");
            // Add book recommendations based on the selected language
            // You can add your own logic here to provide relevant book recommendations
            out.println("<p>Book 1</p>");
            out.println("<p>Book 2</p>");
            out.println("<p>Book 3</p>");
            out.println("<a href=\"e.html\">Select Another Language</a>");
            out.println("</body></html>");
        }
    }
}
