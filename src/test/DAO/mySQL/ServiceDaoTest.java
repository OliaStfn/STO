package DAO.mySQL;

import DAO.GenericDao;
import beans.Service;
import org.junit.Ignore;
import org.junit.Test;

import java.util.ArrayList;

import static org.junit.Assert.*;

public class ServiceDaoTest {
    /*@Ignore
    @Test
    public void create() throws Exception {
        Service service = new Service("test","test",230);
        Factory factory = new Factory();
        GenericDao dao = factory.getDao(factory.getConnection(), Service.class);
        service = (Service) dao.create(service);
        assertNotNull(service);
    }*/

    @Test
    public void read() throws Exception {
        Factory factory = new Factory();
        GenericDao dao = factory.getDao(factory.getConnection(), Service.class);
        Service findService = (Service) dao.read(1);
        assertNotNull(findService);
        System.out.println(findService.toString());
    }

     /*@Ignore
    @Test
    public void update() throws Exception {
       Factory factory = new Factory();
        GenericDao dao = factory.getDao(factory.getConnection(), Service.class);
        Service service = (Service) dao.read(1);
        service.setPrice(430);
        dao.update(service);
    }

    @Ignore
    @Test
    public void delete() throws Exception {
        Factory factory = new Factory();
        GenericDao dao = factory.getDao(factory.getConnection(), Service.class);
        Service service = (Service) dao.read(1);
        dao.delete(service);
    }*/

    @Test
    public void readAll() throws Exception {
        Factory factory = new Factory();
        GenericDao dao = factory.getDao(factory.getConnection(), Service.class);
        ArrayList<Service> services = (ArrayList<Service>) dao.readAll();
        assertNotNull(services);
    }

}