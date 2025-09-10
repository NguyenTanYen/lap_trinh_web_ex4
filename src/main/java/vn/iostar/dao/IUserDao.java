package vn.iostar.dao;

import java.util.List;

import vn.iostar.models.UserModel;

public interface IUserDao {
	
	List<UserModel> findAll();
	
	UserModel findByID(int id);
	
	void insert(UserModel user);
	
	UserModel findByUsername(String username);
	
	boolean checkExistEmail(String email);
	
	boolean checkExistUsername(String username);
	
	boolean checkExistPhone(String phone);
	
	void update(String username, String fullname, String image, String phone);
	
	void resetPassword(String email, String password);
}
