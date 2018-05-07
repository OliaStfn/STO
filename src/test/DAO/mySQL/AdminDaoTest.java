package DAO.mySQL;

import DAO.GenericDao;
import beans.Admin;
import org.junit.Test;

import java.util.ArrayList;

import static org.junit.Assert.*;

public class AdminDaoTest {
    @Test
    public void create() throws Exception {
        Admin admin = new Admin("kardash", "9876", "kardash44@gmail.com");
        Factory factory = new Factory();
        GenericDao dao = factory.getDao(factory.getConnection(), Admin.class);
        admin = (Admin) dao.create(admin);
        assertNotNull(admin);
    }

    @Test
    public void read() throws Exception {
        Factory factory = new Factory();
        GenericDao dao = factory.getDao(factory.getConnection(), Admin.class);
        Admin findAdmin = (Admin) dao.read(1);
        assertNotNull(findAdmin);
        System.out.println(findAdmin.toString());
    }

    @Test
    public void update() throws Exception {
        Factory factory = new Factory();
        GenericDao dao = factory.getDao(factory.getConnection(), Admin.class);
        Admin admin = (Admin) dao.read(1);
        admin.setLogin("kardash1");
        dao.update(admin);
    }

    @Test
    public void delete() throws Exception {
        Factory factory = new Factory();
        GenericDao dao = factory.getDao(factory.getConnection(), Admin.class);
        Admin findAdmin = (Admin) dao.read(1);
        dao.delete(findAdmin);
        findAdmin = (Admin) dao.read(1);
        assertNull(findAdmin);
    }

    @Test
    public void readAll() throws Exception {
        Factory factory = new Factory();
        GenericDao dao = factory.getDao(factory.getConnection(), Admin.class);
        ArrayList<Admin> admins = (ArrayList<Admin>) dao.readAll();
        assertNotNull(admins);
    }

}