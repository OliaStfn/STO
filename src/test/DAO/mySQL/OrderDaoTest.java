package DAO.mySQL;

import DAO.GenericDao;
import beans.Master;
import beans.Order;
import beans.OrderStatus;
import beans.Service;
import org.junit.Ignore;
import org.junit.Test;

import java.time.LocalDate;
import java.util.ArrayList;

import static org.junit.Assert.*;

public class OrderDaoTest {

    @Test
    public void create() throws Exception {
        Order order = new Order("Mazda", "RX-7", "AT6749AF",
                "Івано-Франківськ", LocalDate.now(), OrderStatus.WAITING,
                3, 2);
        Service service = new Service();
        service.setId(2);
        order.addService(service);
        service.setId(3);
        order.addService(service);
        Factory factory = new Factory();
        GenericDao dao = factory.getDao(factory.getConnection(), Order.class);
        order = (Order) dao.create(order);
        assertNotNull(order);
    }

    @Test
    public void read() throws Exception {
        Factory factory = new Factory();
        GenericDao dao = factory.getDao(factory.getConnection(), Order.class);
        Order findOrder = (Order) dao.read(2);
        assertNotNull(findOrder);
        System.out.println(findOrder.toString());
    }

    @Ignore
    @Test
    public void update() throws Exception {
        Factory factory = new Factory();
        GenericDao dao = factory.getDao(factory.getConnection(), Order.class);
        Order order = (Order) dao.read(1);
        order.setCarBrand("BMW");
        dao.update(order);
    }

    @Ignore
    @Test
    public void delete() throws Exception {
        Factory factory = new Factory();
        GenericDao dao = factory.getDao(factory.getConnection(), Order.class);
        Order order = (Order) dao.read(2);
        dao.delete(order);
    }

    @Test
    public void readAll() throws Exception {
        Factory factory = new Factory();
        GenericDao dao = factory.getDao(factory.getConnection(), Order.class);
        ArrayList<Order> orders = (ArrayList<Order>) dao.readAll();
        assertNotNull(orders);
        assertNotEquals(orders.size(), 0);
    }

    @Test
    public void readByCustomerId() throws Exception {
        Factory factory = new Factory();
        OrderDao dao = (OrderDao) factory.getDao(factory.getConnection(), Order.class);
        ArrayList<Order> orders = (ArrayList<Order>) dao.readByCustomerId(2);
        assertNotNull(orders);
        assertNotEquals(orders.size(), 0);

    }
}