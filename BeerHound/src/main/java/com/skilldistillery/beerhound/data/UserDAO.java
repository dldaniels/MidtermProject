package com.skilldistillery.beerhound.data;

import java.util.List;

import com.skilldistillery.beerhound.entities.User;

public interface UserDAO {

	
	boolean deleteUser(int id);
	User updateUser(User user);
	List<User> findUser(String keyword);
	User createUser(User user);
	User getUserById(int id);
	
}
