package servlets;

import DAO.DaoException;
import DAO.DaoFactory;
import DAO.GenericDao;
import DAO.mySQL.Factory;
import beans.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        DaoFactory factory = new Factory();
        try {
            GenericDao dao = factory.getDao(factory.getConnection(), Customer.class);
            ArrayList<Customer> customers = (ArrayList<Customer>) dao.readAll();
            boolean isFound = false;
            for (Customer customer : customers) {
                if (customer.getLogin().equals(username) &&
                        customer.getPassword().equals(password)) {
                    isFound = true;
                    HttpSession session = request.getSession();
                    session.setAttribute("user", customer);
                    if (username.contains("admin") || username.contains("Admin"))
                        session.setAttribute("userType", "admin");
                    else
                        session.setAttribute("userType", "customer");
                    response.sendRedirect("/home");
                }
            }
            if (!isFound) {
                request.setAttribute("message", "False login or password, try again!");
                request.getRequestDispatcher("/authorization.jsp").forward(request, response);
            }
        } catch (DaoException e) {
        }

    }
}
