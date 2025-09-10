package vn.iostar.services;

import vn.iostar.models.UserModel;

public interface IUserService {
	UserModel login(String username, String password);
	
	UserModel FindByUsername(String username);
	
	boolean register(String email, String password, String username, String fullname, String phone);
	
	void insert(UserModel user);
	
	boolean checkExistEmail(String email);
	
	boolean checkExistUsername(String username);
	
	boolean checkExistPhone(String phone);
	
	void update(String username, String fullname, String image, String phone);

	void resetPassword(String email, String password);
}
