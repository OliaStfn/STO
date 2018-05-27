package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

@WebServlet(name = "LanguageServlet")
public class LanguageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FileInputStream fis;
        Properties property = new Properties();
        String lang = "ua";
        //choose language
        try {
            fis = new FileInputStream("languages.properties");
            property.load(fis);

            HttpSession session = request.getSession();
            session.setAttribute("prop", property);
            session.setAttribute("lang", lang);
        } catch (IOException e) {
        }
    }
}
