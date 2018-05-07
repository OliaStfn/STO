package DAO.mySQL;

import DAO.GenericDao;
import beans.Master;
import beans.Order;
import beans.OrderStatus;
import org.junit.Test;

import java.time.LocalDate;
import java.util.ArrayList;

import static org.junit.Assert.*;

public class OrderDaoTest {
    @Test
    public void create() throws Exception {
        Order order = new Order("Opel","Astra","AT2365AC",
                "Івано-Франківськ", LocalDate.now(), OrderStatus.WAITING,
                1,1);
        Factory factory = new Factory();
        GenericDao dao = factory.getDao(factory.getConnection(), Order.class);
        order = (Order) dao.create(order);
        assertNotNull(order);
    }

    @Test
    public void read() throws Exception {
        Factory factory = new Factory();
        GenericDao dao = factory.getDao(factory.getConnection(), Order.class);
        Order findOrder = (Order) dao.read(1);
        assertNotNull(findOrder);
        System.out.println(findOrder.toString());
    }

    @Test
    public void update() throws Exception {
        Factory factory = new Factory();
        GenericDao dao = factory.getDao(factory.getConnection(), Order.class);
        Order order = (Order) dao.read(1);
        order.setCarBrand("BMW");
        dao.update(order);
    }

    @Test
    public void delete() throws Exception {
        Factory factory = new Factory();
        GenericDao dao = factory.getDao(factory.getConnection(), Order.class);
        Order order = (Order) dao.read(1);
        dao.delete(order);
    }

    @Test
    public void readAll() throws Exception {
        Factory factory = new Factory();
        GenericDao dao = factory.getDao(factory.getConnection(), Order.class);
        ArrayList<Order> orders = (ArrayList<Order>) dao.readAll();
        assertNotNull(orders);
    }

}