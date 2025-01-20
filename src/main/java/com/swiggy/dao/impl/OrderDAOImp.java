package com.swiggy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.swiggy.dao.OrderDAO;
import com.swiggy.db.DBConnection;
import com.swiggy.dto.Orders;

public class OrderDAOImp implements OrderDAO {
	private Connection connection;

	public OrderDAOImp() {
		this.connection = DBConnection.getConnection();

	}

	@Override
	public Orders insertOrder(Orders orders) {
		PreparedStatement preparedStatement = null;
		int result = 0;
		String insertQuery = "INSERT INTO orders (user_id, restaurant_id, total_amount, created_at,pay_mode,DELIVERY_ADDRESS) VALUES (?, ?, ?, now(),?,?)";
		try {
			preparedStatement = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setInt(1, orders.getUserId());
			preparedStatement.setInt(2, orders.getRestaurantId());
			preparedStatement.setDouble(3, orders.getTotalAmount());
			preparedStatement.setString(4, orders.getPay_mode());
			preparedStatement.setString(5, orders.getDeliveryAddress());

			result = preparedStatement.executeUpdate();

			if (result > 0) {
				ResultSet resultSet = preparedStatement.getGeneratedKeys();
				if (resultSet.next()) {
					orders.setOrderId(resultSet.getInt(1));
					return orders;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Orders getOrderById(int orderId) {
		String selectQuery = "select * from orders where  order_id=?";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Orders order = null;

		try {
			preparedStatement = connection.prepareStatement(selectQuery);
			preparedStatement.setInt(1, orderId);
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				order = new Orders();
				order.setOrderId(resultSet.getInt(1));
				order.setUserId(resultSet.getInt(2));
				order.setRestaurantId(resultSet.getInt(3));
				order.setTotalAmount(resultSet.getDouble(4));
				order.setStatus(resultSet.getString(5));
				order.setCreatedAt(resultSet.getTimestamp(6));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return order;
	}

	@Override
	public List<Orders> getAllOrders() {
		List<Orders> orders = new ArrayList<Orders>();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String selectQuery = "select * from orders";
		try {
			preparedStatement = connection.prepareStatement(selectQuery);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Orders order = new Orders();
				order.setOrderId(resultSet.getInt(1));
				order.setUserId(resultSet.getInt(2));
				order.setRestaurantId(resultSet.getInt(3));
				order.setTotalAmount(resultSet.getDouble(4));
				order.setStatus(resultSet.getString(5));
				order.setCreatedAt(resultSet.getTimestamp(6));
				orders.add(order);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return orders;
	}

	@Override
	public boolean updateOrder(Orders order) {
		String updateSql = "UPDATE orders SET status = ? ,reviewed = ? WHERE order_id = ?";
		PreparedStatement preparedStatement = null;
		int resultSet = 0;
		try {
			preparedStatement = connection.prepareStatement(updateSql);

			preparedStatement.setString(1, order.getStatus());
			preparedStatement.setInt(2, order.getReveiwed());
			preparedStatement.setInt(3,order.getOrderId());
			resultSet = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (resultSet > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteOrder(int orderId) {
		String deleteQuery = "DELETE FROM orders WHERE order_id = ?";
		PreparedStatement preparedStatement = null;
		int result = 0;
		try {
			preparedStatement = connection.prepareStatement(deleteQuery);
			preparedStatement.setInt(1, orderId);
			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (result > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<Orders> getOrderByUserId(int user_id, int page, int limit, String status) {

		int skip = (page - 1) * limit;
		List<Orders> yourOrders = new ArrayList<Orders>();

		StringBuffer getQuery = new StringBuffer();
		if (status.equals("All")) {
			getQuery.append(" SELECT * FROM ORDERS WHERE USER_ID = ?  ORDER BY ORDER_ID DESC LIMIT ? OFFSET ? ");
		} else {
			getQuery.append(" SELECT * FROM ORDERS WHERE USER_ID = ? AND STATUS IN ");// = ? ";
			getQuery.append(" ( ");
			List<String> filters = Arrays.asList(status.split(","));
			int size = filters.size();

			filters.forEach(filter -> {
				getQuery.append("'").append(filter).append("'");

				// Add " , " only if it's not the last element
				if (!filter.equals(filters.get(size - 1))) {
					getQuery.append(" , ");
				}
			});

			getQuery.append(" ) ");
			getQuery.append(" ORDER BY ORDER_ID DESC LIMIT ? OFFSET ? ");

		}

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(getQuery.toString());
			preparedStatement.setInt(1, user_id);
			preparedStatement.setInt(2, limit);
			preparedStatement.setInt(3, skip);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Orders orders = new Orders();
				orders.setOrderId(resultSet.getInt(1));
				orders.setUserId(resultSet.getInt(2));
				orders.setRestaurantId(resultSet.getInt(3));
				orders.setTotalAmount(resultSet.getDouble(4));
				orders.setStatus(resultSet.getString(5));
				orders.setCreatedAt(resultSet.getTimestamp(6));
				orders.setPay_mode(resultSet.getString(7));
				orders.setDeliveryAddress(resultSet.getString(8));
				orders.setReveiwed(resultSet.getInt(9));
				yourOrders.add(orders);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return yourOrders;
	}

	@Override
	public int getOrderByUserId(int user_id, String status) {

		StringBuffer getQuery = new StringBuffer();
		if (status.equals("All")) {
			getQuery.append(" SELECT COUNT(*) FROM ORDERS WHERE USER_ID = ? ");
		} else {
			getQuery.append(" SELECT COUNT(*) FROM ORDERS WHERE USER_ID = ? AND STATUS IN  ");
			getQuery.append(" ( ");
			List<String> filters = Arrays.asList(status.split(","));
			int size = filters.size();

			filters.forEach(filter -> {
				getQuery.append("'").append(filter).append("'");

				// Add " , " only if it's not the last element
				if (!filter.equals(filters.get(size - 1))) {
					getQuery.append(" , ");
				}
			});

			getQuery.append(" ) ");

		}

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(getQuery.toString());
			preparedStatement.setInt(1, user_id);

			ResultSet resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				return resultSet.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;

	}
	
	
	@Override
	public List<Orders> getOrderByRestaurantId(int restaurant_id, int page, int limit, String status) {
		int skip = (page - 1) * limit;
		List<Orders> yourOrders = new ArrayList<Orders>();

		StringBuffer getQuery = new StringBuffer();
		if (status.equals("All")) {
			getQuery.append(" SELECT * FROM ORDERS WHERE RESTAURANT_ID = ?  ORDER BY ORDER_ID DESC LIMIT ? OFFSET ? ");
		} else {
			getQuery.append(" SELECT * FROM ORDERS WHERE RESTAURANT_ID = ? AND STATUS IN ");// = ? ";
			getQuery.append(" ( ");
			List<String> filters = Arrays.asList(status.split(","));
			int size = filters.size();

			filters.forEach(filter -> {
				getQuery.append("'").append(filter).append("'");

				// Add " , " only if it's not the last element
				if (!filter.equals(filters.get(size - 1))) {
					getQuery.append(" , ");
				}
			});

			getQuery.append(" ) ");
			getQuery.append(" ORDER BY ORDER_ID DESC LIMIT ? OFFSET ? ");

		}

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(getQuery.toString());
			preparedStatement.setInt(1, restaurant_id);
			preparedStatement.setInt(2, limit);
			preparedStatement.setInt(3, skip);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Orders orders = new Orders();
				orders.setOrderId(resultSet.getInt(1));
				orders.setUserId(resultSet.getInt(2));
				orders.setRestaurantId(resultSet.getInt(3));
				orders.setTotalAmount(resultSet.getDouble(4));
				orders.setStatus(resultSet.getString(5));
				orders.setCreatedAt(resultSet.getTimestamp(6));
				orders.setPay_mode(resultSet.getString(7));
				orders.setDeliveryAddress(resultSet.getString(8));
				orders.setReveiwed(resultSet.getInt(9));
				yourOrders.add(orders);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return yourOrders;
	}
	
	
	@Override
	public int getOrderByRestaurantId(int restaurant_id, String status) {
		StringBuffer getQuery = new StringBuffer();
		if (status.equals("All")) {
			getQuery.append(" SELECT COUNT(*) FROM ORDERS WHERE RESTAURANT_ID = ? ");
		} else {
			getQuery.append(" SELECT COUNT(*) FROM ORDERS WHERE RESTAURANT_ID = ? AND STATUS IN  ");
			getQuery.append(" ( ");
			List<String> filters = Arrays.asList(status.split(","));
			int size = filters.size();

			filters.forEach(filter -> {
				getQuery.append("'").append(filter).append("'");

				// Add " , " only if it's not the last element
				if (!filter.equals(filters.get(size - 1))) {
					getQuery.append(" , ");
				}
			});

			getQuery.append(" ) ");

		}

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(getQuery.toString());
			preparedStatement.setInt(1, restaurant_id);

			ResultSet resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				return resultSet.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
	

}
