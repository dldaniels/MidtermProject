package com.skilldistillery.beerhound.data;

import java.util.List;

import com.skilldistillery.beerhound.entities.Bar;
import com.skilldistillery.beerhound.entities.Beer;
import com.skilldistillery.beerhound.entities.User;

public interface UserDAO {

	
	boolean deleteUser(int id);
	User updateUser(User user);
	List<User> searchUsernames(String keyword);
	User createUser(User user);
	User getUserById(int id);
	User getUserByEmail(String email);
	User getUserByUsername(String username);
	boolean isEmailUnique(String email);
	User login(User user);
	User updateUserBeerFavorites(User user, Beer beer);
	User updateUserBarFavorites(User user, Bar bar);
	
}
