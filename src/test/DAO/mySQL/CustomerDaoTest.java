package DAO.mySQL;

import DAO.GenericDao;
import beans.Customer;
import org.junit.Ignore;
import org.junit.Test;

import java.time.LocalDate;
import java.util.ArrayList;

import static org.junit.Assert.*;

public class CustomerDaoTest {
    /*@Ignore
    @Test
    public void create() throws Exception {
        Customer customer = new Customer("Оля","Стефанишин", LocalDate.of(1999,3,22),"kardash3","2486",
                "kardash22@gmail.com","0993205589");
        Factory factory = new Factory();
        GenericDao dao = factory.getDao(factory.getConnection(), Customer.class);
        customer = (Customer) dao.create(customer);
        assertNotNull(customer);
    }*/

    @Test
    public void read() throws Exception {
        Factory factory= new Factory();
        GenericDao dao= factory.getDao(factory.getConnection(),Customer.class);
        Customer findCustomer= (Customer) dao.read(1);
        assertNotNull(findCustomer);
        System.out.println(findCustomer.toString());
    }

    /*@Ignore
    @Test
    public void update() throws Exception {
        Factory factory= new Factory();
        GenericDao dao= factory.getDao(factory.getConnection(),Customer.class);
        Customer customer= (Customer) dao.read(2);
        customer.setName("Vasya");
        dao.update(customer);
    }

    @Ignore
    @Test
    public void delete() throws Exception {
        Factory factory= new Factory();
        GenericDao dao= factory.getDao(factory.getConnection(),Customer.class);
        Customer findCustomer= (Customer) dao.read(1);
        dao.delete(findCustomer);
    }*/

    @Test
    public void readAll() throws Exception {
        Factory factory= new Factory();
        GenericDao dao= factory.getDao(factory.getConnection(),Customer.class);
        ArrayList<Customer> customers= (ArrayList<Customer>) dao.readAll();
        assertNotNull(customers);
    }

}