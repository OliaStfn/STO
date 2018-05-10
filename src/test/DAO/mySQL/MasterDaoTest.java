package DAO.mySQL;

import DAO.GenericDao;
import beans.Master;
import beans.MasterStatus;
import org.junit.Test;

import java.time.LocalDate;
import java.util.ArrayList;

import static org.junit.Assert.*;

public class MasterDaoTest {
    @Test
    public void create() throws Exception {
        Master master = new Master("Іван","Семиген", LocalDate.of(1985,2,11)
                ,"Головний автомеханік"," м. Кам'янець-Подільський",
                "Вул. Пилипа Орлика 46","0932202176","CE8745632",
                MasterStatus.FREE);
        Factory factory = new Factory();
        GenericDao dao = factory.getDao(factory.getConnection(), Master.class);
        master = (Master) dao.create(master);
        assertNotNull(master);
    }

    @Test
    public void read() throws Exception {
        Factory factory = new Factory();
        GenericDao dao = factory.getDao(factory.getConnection(), Master.class);
        Master master = (Master) dao.read(1);
        assertNotNull(master);
        System.out.println(master.toString());
    }

    @Test
    public void update() throws Exception {
        Factory factory = new Factory();
        GenericDao dao = factory.getDao(factory.getConnection(), Master.class);
        Master master = (Master) dao.read(1);
        master.setName("Данило");
        dao.update(master);
    }

    @Test
    public void delete() throws Exception {
        Factory factory = new Factory();
        GenericDao dao = factory.getDao(factory.getConnection(), Master.class);
        Master findMaster = (Master) dao.read(1);
        dao.delete(findMaster);
    }

    @Test
    public void readAll() throws Exception {
        Factory factory = new Factory();
        GenericDao dao = factory.getDao(factory.getConnection(), Master.class);
        ArrayList<Master> masters = (ArrayList<Master>) dao.readAll();
        assertNotNull(masters);
    }

}