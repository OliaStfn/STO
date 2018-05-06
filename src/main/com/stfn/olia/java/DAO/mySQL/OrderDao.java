package DAO.mySQL;

import DAO.AbstractDao;
import DAO.DaoException;
import beans.Order;
import beans.OrderStatus;
import beans.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class OrderDao extends AbstractDao<Order, Integer> {
    public OrderDao(Connection connection) {
        super(connection);
    }

    @Override
    public String getCreateQuery() {
        return "INSERT INTO Order (car_brand,car_model,license_plate,description,reception_point," +
                "status_id,master_id,customer_id) VALUES (?,?,?,?,?,?,?,?);";
    }

    @Override
    public String getSelectQuery() {
        return "SELECT * FROM Order o JOIN Service_has_Order USING(order_id)" +
                " JOIN Service USING(service_id) JOIN Order_status s ON(o.status_id=s.status_id) WHERE order_id=";
    }

    @Override
    public String getSelectAllQuery() {
        return "SELECT * FROM Order o JOIN Service_has_Order USING(order_id)" +
                " JOIN Service USING(service_id) JOIN Order_status s ON(o.status_id=s.status_id);";
    }

    @Override
    public String getUpdateQuery() {
        return "UPDATE Order SET car_brand=?,car_model=?,license_plate=?,description=?," +
                "reception_point=?,status_id=(SELECT status_id FROM Order_status WHERE state=?)," +
                "master_id=?,customer_id=? WHERE order_id=?;";
    }

    @Override
    public String getDeleteQuery() {
        return "DELETE FROM Order WHERE order_id=?;";
    }

    @Override
    public Collection<Order> parseResultSet(ResultSet resultSet) throws DaoException {
        Collection<Order> orders = new ArrayList<Order>();
        try {
            while (resultSet.next()) {
                Order order = new Order();
                boolean orderExist = false;

                Service service = new Service();
                service.setId(resultSet.getInt("service_id"));
                service.setName(resultSet.getString("name"));
                service.setCategory(resultSet.getString("category"));
                service.setPrice(resultSet.getDouble("price"));

                for (Order item : orders) {
                    if (item.getId() == resultSet.getInt("order_id")) {
                        orderExist = true;
                        item.addService(service);
                    }
                }

                if (!orderExist) {
                    order.setId(resultSet.getInt("order_id"));
                    order.setCarBrand(resultSet.getString("car_brand"));
                    order.setCarModel(resultSet.getString("car_model"));
                    order.setLicensePlate(resultSet.getString("licence_plate"));
                    order.setDescription(resultSet.getString("description"));
                    order.setReceptionPoint(resultSet.getString("reception_point"));
                    order.setOrderDate(resultSet.getDate("order_date").toLocalDate());
                    order.setStatus(OrderStatus.valueOf(resultSet.getString("state")));
                    order.setMasterId(resultSet.getInt("master_id"));
                    order.setCustomerId(resultSet.getInt("customer_id"));

                    order.addService(service);
                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            throw new DaoException(e);
        }
        return orders;
    }

    @Override
    public void statementUpdate(PreparedStatement statement, Order obj) throws DaoException {
        try {
            statement.setString(1, obj.getCarBrand());
            statement.setString(2, obj.getCarModel());
            statement.setString(3, obj.getLicensePlate());
            statement.setString(4, obj.getDescription());
            statement.setString(5, obj.getReceptionPoint());
            statement.setString(6, obj.getStatus().toString());
            statement.setInt(7, obj.getMasterId());
            statement.setInt(8, obj.getCustomerId());
            statement.setInt(9, obj.getId());
        } catch (SQLException e) {
            throw new DaoException(e);
        }
    }

    @Override
    public void statementInsert(PreparedStatement statement, Order obj) throws DaoException {
        try {
            statement.setString(1, obj.getCarBrand());
            statement.setString(2, obj.getCarModel());
            statement.setString(3, obj.getLicensePlate());
            statement.setString(4, obj.getDescription());
            statement.setString(5, obj.getReceptionPoint());
            statement.setString(6, obj.getStatus().toString());
            statement.setInt(7, obj.getMasterId());
            statement.setInt(8, obj.getCustomerId());
        } catch (SQLException e) {
            throw new DaoException(e);
        }
    }
}
