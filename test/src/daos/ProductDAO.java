package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import database.DBConnection;
import objects.Product;

public class ProductDAO {
	
	private static ProductDAO instance;
		
		public static ProductDAO getInstance() {
			
			if (instance == null) 
			{
				instance = new ProductDAO();
			}
			
			return instance;
			
		}
		
		private ProductDAO() {}
		
		public List<Product> getProducts() throws NamingException, SQLException
		{
			List<Product> products = new ArrayList<Product>();
			
			String sql = "SELECT name, type, description, price, image FROM products"; //our query
			
			Connection dbconn = DBConnection.getConnection();
			PreparedStatement instr = dbconn.prepareStatement(sql);
			ResultSet rs = instr.executeQuery();
			
			while(rs.next())
			{
				products.add(new Product(rs.getString("name"), rs.getString("type"), rs.getString("description"), rs.getDouble("price"), rs.getString("image")));
			}
			
			return products;
			
		}
		
		public String getProductImg(String name) throws NamingException, SQLException 
		{
			String sql = "SELECT image FROM products where name=?"; //our query
			
			Connection dbconn = DBConnection.getConnection();
			PreparedStatement instr = dbconn.prepareStatement(sql);
			instr.setString(1, name);
			ResultSet rs = instr.executeQuery();
			
			rs.next();
			
			return rs.getString("image");
		}
		
		public List<Product> getProductSearch(String name) throws NamingException, SQLException 
		{
			String sql = "SELECT name, type, description, price, image FROM products where name=?"; //our query
			
			List<Product> products = new ArrayList<Product>();
			
			Connection dbconn = DBConnection.getConnection();
			PreparedStatement instr = dbconn.prepareStatement(sql);
			instr.setString(1,name);
			ResultSet rs = instr.executeQuery();
			
			while(rs.next())
			{
				products.add(new Product(rs.getString("name"), rs.getString("type"), rs.getString("description"), rs.getDouble("price"), rs.getString("image")));
			}
			
			return products;
		}
		


}