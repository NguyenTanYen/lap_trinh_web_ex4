package com.AISolution.repository.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.AISolution.repository.ProductRepository;
import com.AISolution.repository.entity.ProductEntity;

@Repository
public class ProductRepositoryImpl implements ProductRepository{
	
	private static final String DB_URL = "jdbc:mysql://localhost:3306/shoestoresimple";
	private static final String USER = "root";
	private static final String PASS = "abc123@@";
	
	@Override
	public List<ProductEntity> getProductByName(String name) { // ghi đè từ ProductRepository
	    List<ProductEntity> results = new ArrayList<>();
	    String query;
	    if (name == null || name.trim().isEmpty()) {
	        query = "SELECT * FROM products";
	    } 
	    else {
	        query = "SELECT * FROM products WHERE product_name LIKE '%" + name + "%'";
	    }

	    try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
	         Statement stmt = conn.createStatement();
	         ResultSet rs = stmt.executeQuery(query)) {
	        
	        while (rs.next()) {
	            ProductEntity product = new ProductEntity();
	            product.setProductName(rs.getString("product_name"));
	            product.setPrice(rs.getDouble("price"));
	            product.setStock(rs.getInt("stock"));
	            results.add(product);
	        }
	    } 
	    catch (SQLException e) {
	        e.printStackTrace();
	        System.out.print("Connected database failed");
	    }

	    return results;
	}


}
