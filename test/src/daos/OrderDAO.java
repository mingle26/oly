package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.List;

import javax.naming.NamingException;

import database.DBConnection;
import objects.OrderItem;

public class OrderDAO {
	
	private static OrderDAO instance;
		
		public static OrderDAO getInstance() {
			
			if (instance == null) 
			{
				instance = new OrderDAO();
			}
			
			return instance;
			
		}
		
		private OrderDAO() {}
		
		public void registerOrder(String customerName, List<OrderItem> items) throws NamingException, SQLException
		{
			//Getting current customer ID
			String sql = "SELECT id FROM users where username=?"; //our query
			
			Connection dbconn = DBConnection.getConnection();

			PreparedStatement instr = dbconn.prepareStatement(sql);
			instr.setString(1, customerName);
			ResultSet rs = instr.executeQuery();
			int customerID = 0;
			while(rs.next())
			{
				customerID = rs.getInt("id");
			}
			
			//Registering Order
			String sqlOrder = "INSERT INTO TEST.ORDER(customer_id, date) VALUES(?,?)";
			instr = dbconn.prepareStatement(sqlOrder);
			instr.setInt(1, customerID);
			instr.setDate(2, new Date(System.currentTimeMillis()));
			int row = instr.executeUpdate();
			
			//Getting registered order ID
			String sqlOrderID = "SELECT MAX(id) FROM TEST.ORDER";
			instr = dbconn.prepareStatement(sqlOrderID);
			rs = instr.executeQuery();
			int orderID = 0;
			
			while(rs.next())
			{
				orderID = rs.getInt("MAX(id)");
			}
			
			//Registering Order Items
			String sqlOrderItem = "INSERT INTO ORDERITEM(order_id, product_id, quantity) VALUES(?,?,?)";
			instr = dbconn.prepareStatement(sqlOrderItem);
			
			//First we have to retrieve product ID
			String sqlProductID = "SELECT id FROM PRODUCTS WHERE name=?";
			PreparedStatement iter = dbconn.prepareStatement(sqlProductID);
			int productID = 0;
			for(OrderItem item : items)
			{
				//Getting product ID
				iter.setString(1, item.getName());
				rs = iter.executeQuery();
				
				while(rs.next())
				{
					productID = rs.getInt("id");
				}
				
				
				//Registering Order Item
				instr.setInt(1, orderID);
				instr.setInt(2, productID);
				instr.setInt(3, item.getQuantity());
				row = instr.executeUpdate();
			}
			
		}

}
