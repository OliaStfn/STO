package servlets;

import DAO.DaoException;
import DAO.DaoFactory;
import DAO.GenericDao;
import DAO.mySQL.Factory;
import beans.Customer;
import beans.Order;
import beans.Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;

@WebServlet(value = "/orders", name = "OrderServlet")
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DaoFactory factory = new Factory();
        if (request.getParameterMap().containsKey("new")) {
            try {
                GenericDao dao = factory.getDao(factory.getConnection(), Service.class);
                ArrayList<Service> services = (ArrayList<Service>) dao.readAll();
                HttpSession session = request.getSession();
                HashSet<String> categories = new HashSet<>();
                for (Service service : services) {
                    categories.add(service.getCategory());
                }
                session.setAttribute("services", services);
                session.setAttribute("categories", categories);
            } catch (DaoException e) {
            }
            request.getRequestDispatcher("/add-new-order.jsp").forward(request, response);
        } else {
            try {
                GenericDao dao = factory.getDao(factory.getConnection(), Order.class);
                ArrayList<Order> orders = (ArrayList<Order>) dao.readAll();
                HttpSession session = request.getSession();
                if (session.getAttribute("userType").equals("customer")) {
                    Customer customer = (Customer) session.getAttribute("user");
                    for (Order order : orders) {
                        if (order.getCustomerId() != customer.getId())
                            orders.remove(order);
                    }
                }
                session.setAttribute("orders", orders);
            } catch (DaoException e) {
            }
            request.getRequestDispatcher("orders.jsp").forward(request, response);
        }
    }
}
