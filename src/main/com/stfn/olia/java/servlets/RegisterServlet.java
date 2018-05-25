package servlets;

import DAO.DaoException;
import DAO.DaoFactory;
import DAO.GenericDao;
import DAO.mySQL.Factory;
import beans.Admin;
import beans.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        LocalDate birthDay = LocalDate.parse(request.getParameter("birthDay"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        DaoFactory factory = new Factory();

        if (username.contains("admin") || username.contains("Admin")) {
            Admin admin = new Admin();
            admin.setLogin(username);
            admin.setPassword(password);
            admin.setEmail(email);

            try {
                GenericDao dao = factory.getDao(factory.getConnection(), Admin.class);
                admin = (Admin) dao.create(admin);
                if (admin.getId() != 0) {
                    request.setAttribute("message", "Register successfully!");
                    request.setAttribute("type", "login");
                    request.getRequestDispatcher("/authorization.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "Error with registration, " +
                            "some fields are invalid.\nPlease, try again.");
                    request.setAttribute("type", "register");
                    request.getRequestDispatcher("/authorization.jsp").forward(request, response);
                }
            } catch (DaoException e) {
            }

        } else {
            Customer customer = new Customer();
            customer.setName(name);
            customer.setSurname(surname);
            customer.setDateOfBirth(birthDay);
            customer.setLogin(username);
            customer.setPassword(password);
            customer.setEmail(email);
            customer.setPhoneNumber(phone);

            try {
                GenericDao dao = factory.getDao(factory.getConnection(), Customer.class);
                customer = (Customer) dao.create(customer);
                if (customer.getId() != 0) {
                    request.setAttribute("message", "Register successfully!");
                    request.setAttribute("type", "login");
                    request.getRequestDispatcher("/authorization.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "Error with registration, " +
                            "some fields are invalid.\nPlease, try again.");
                    request.setAttribute("type", "register");
                    request.getRequestDispatcher("/authorization.jsp").forward(request, response);
                }
            } catch (DaoException e) {
            }
        }
    }
}
