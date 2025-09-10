package vn.iostar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vn.iostar.configs.DBConnectSQL;
import vn.iostar.dao.ICategoryDao;
import vn.iostar.models.CategoryModel;
import vn.iostar.models.UserModel;

public class CategoryDaoImpl implements ICategoryDao {
	public Connection conn = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;

	@Override
	public List<CategoryModel> findAll() {

		String sql = "SELECT * FROM categories";

		try {
			conn = new DBConnectSQL().getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			List<CategoryModel> list = new ArrayList<CategoryModel>();

			while (rs.next()) {
				list.add(new CategoryModel(rs.getInt("categoryId"), rs.getString("categoryName"),
						rs.getString("image"), rs.getInt("active")));

			}
			conn.close();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public CategoryModel findById(int id) {

		String sql = "SELECT * FROM categories WHERE categoryId = ? ";

		try {
			conn = new DBConnectSQL().getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {
				CategoryModel category = new CategoryModel();
				category.setCategoryId(rs.getInt("categoryId"));
				category.setCategoryName(rs.getString("categoryName"));
				category.setImage(rs.getString("image"));
				category.setActive(rs.getInt("active"));
				return category;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void insert(CategoryModel category) {
		String sql = "INSERT INTO categories(categoryName, image, active) VALUES (?, ?, ?)";
		try {
			Connection con = new DBConnectSQL().getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, category.getCategoryName());
			ps.setString(2, category.getImage());
			ps.setInt(3, category.getActive());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void update(CategoryModel category) {
		String sql = "UPDATE categories SET categoryName = ?, image=?, active=? WHERE categoryId = ?";
		try {
			Connection con = new DBConnectSQL().getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, category.getCategoryName());
			ps.setString(2, category.getImage());
			ps.setInt(3, category.getActive());
			ps.setInt(4, category.getCategoryId());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(int id) {
		String sql = "DELETE FROM categories WHERE categoryId = ?";
		try {
			Connection con = new DBConnectSQL().getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<CategoryModel> findByCategoryName(String keyword) {

		String sql = "SELECT * FROM categories WHERE categoryName = ? ";

		try {
			conn = new DBConnectSQL().getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, keyword);
			rs = ps.executeQuery();

			List<CategoryModel> list = new ArrayList<CategoryModel>();

			while (rs.next()) {
				list.add(new CategoryModel(rs.getInt("categoryId"), rs.getString("categoryName"),
						rs.getString("image"), rs.getInt("active")));
			}
			conn.close();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
		ICategoryDao categoryDao = new CategoryDaoImpl();
//		System.out.println(categoryDao.findById(3));
	}

}
