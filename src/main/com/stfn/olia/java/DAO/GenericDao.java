package DAO;

import java.io.Serializable;
import java.util.ArrayList;

public interface GenericDao<T, PK extends Serializable> {
    T create() throws DaoException;
    T createInDB(T object) throws DaoException;
    T read(PK key)throws DaoException;
    void update(T obj)throws DaoException;
    void delete(T obj)throws DaoException;
    ArrayList<T> readAll()throws DaoException;
}