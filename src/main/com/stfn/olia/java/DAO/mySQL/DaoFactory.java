package DAO.mySQL;

import DAO.DaoException;
import DAO.GenericDao;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;


public class DaoFactory implements DAO.DaoFactory {
    private static final Logger log = Logger.getLogger(DaoFactory.class);
    private static String driverName = "com.mysql.jdbc.Driver";
    private static String URL = "jdbc:mysql://localhost/sto?useSSL=false";
    private static String USERNAME = "root";
    private static String PASSWORD = "";
    private Map<Class, DaoCreator> allDao;

    @Override
    public Connection getConnection() throws DaoException {
        Connection connection = null;

        try {
            Class.forName(driverName); // Завантажуємо клас драйвера
        } catch (ClassNotFoundException e) {
            log.error("Driver JDBC has NOT get");
            log.error(e.getMessage());
        }

        try {
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            log.info("The successful connection for DB");
        } catch (SQLException e) {
            log.error("Failed connection for DB");
            log.error(e.getMessage());
        }
        return connection;
    }

    @Override
    public GenericDao getDao(Connection connection, Class daoClass) throws DaoException {
        DaoCreator creator = allDao.get(daoClass);
        if (creator == null){
            throw new DaoException("DAO for class "+daoClass+" not found");
        }
        return creator.create(connection);
    }


    public DaoFactory() {
        allDao = new HashMap<Class, DAO.DaoFactory.DaoCreator>();
    }
}