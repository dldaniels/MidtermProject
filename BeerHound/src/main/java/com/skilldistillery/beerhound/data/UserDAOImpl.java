package com.skilldistillery.beerhound.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.beerhound.entities.Bar;
import com.skilldistillery.beerhound.entities.Beer;
import com.skilldistillery.beerhound.entities.User;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public boolean deleteUser(int id) {
		User user = em.find(User.class, id);
		if (user == null) {
			return false;
		}
		em.remove(user);
		return !em.contains(user);
	}

	@Override
	public User updateUser(User user) {
		User dbUser = em.find(User.class, user.getId());
		if (dbUser == null) {
			return null;
		}
		if (user.getAddress() != null) {
			
			dbUser.setAddress(user.getAddress());
		}
		if (user.getBiography() != null) {
			dbUser.setBiography(user.getBiography());
		}
		if (user.getEmail() != null) {
			dbUser.setEmail(user.getEmail());
		}
		if (user.getEnabled() != null) {
			dbUser.setEnabled(user.getEnabled());
		}
		if (user.getFirstName() != null) {
			dbUser.setFirstName(user.getFirstName());
		}
		if (user.getLastName() != null) {
			dbUser.setLastName(user.getLastName());
		}
		if (user.getPassword() != null) {
			dbUser.setPassword(user.getPassword());
		}
		if (user.getRole() != null) {
			dbUser.setRole(user.getRole());
		}
		if (user.getUsername() != null) {
			dbUser.setUsername(user.getUsername());
		}
		if (user.getImage() != null) {
			dbUser.setImage(user.getImage());
		}
		if (user.getBarRatings() != null) {
			dbUser.setBarRatings(user.getBarRatings());
		}
		if (user.getBeerRatings() != null) {
			dbUser.setBeerRatings(user.getBeerRatings());
		}
		if (user.getFavoriteBarList() != null) {
			dbUser.setFavoriteBarList(user.getFavoriteBarList());
		}
		if (user.getFavoriteBeerList() != null) {
			dbUser.setFavoriteBeerList(user.getFavoriteBeerList());			
		}
		return dbUser;
	}
	
	@Override
	public User updateUserBeerFavorites(User user, Beer beer) {
		User dbUser = em.find(User.class, user.getId());
		if (dbUser == null) {
			return null;
		}
		if (user.getFavoriteBeerList() != null) {
			dbUser.addBeerToFavorites(beer);			
		}
		return dbUser;
	}
	
	@Override
	public User updateUserBarFavorites(User user, Bar bar) {
		User dbUser = em.find(User.class, user.getId());
		if (dbUser == null) {
			return null;
		}
		if (user.getFavoriteBarList() != null) {
			dbUser.addBarToFavorites(bar);			
		}
		return dbUser;
	}

	@Override
	public List<User> searchUsernames(String keyword) {
		keyword = "%" + keyword + "%";
		String query = "SELECT u FROM User u WHERE u.username LIKE :keyword";
		return em.createQuery(query, User.class).setParameter("keyword", keyword).getResultList();
	}

	@Override
	public User createUser(User user) {
		em.persist(user);
		return user;
	}

	@Override
	public User getUserById(int id) {
		return em.find(User.class, id);
	}

	@Override
	public User getUserByEmail(String email) {
		String query = "SELECT u FROM User u WHERE u.email = :email";
		User result = null;
		try {
			result = em.createQuery(query, User.class).setParameter("email", email).getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public User getUserByUsername(String username) {
		String query = "SELECT u FROM User u WHERE u.username = :username";
		User result = null;
		try {
			result = em.createQuery(query, User.class).setParameter("username", username).getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean isEmailUnique(String email) {
		if (getUserByEmail(email) == null) {
			return true;
		}
		return false;
	}

	@Override
	public User login(User user) {
		if (user == null) { return null; }
		User dbUser = null;
		System.out.println(user);
		if (user.getEmail() != null && !user.getEmail().equals("")) {
			dbUser = getUserByEmail(user.getEmail());
			if (dbUser == null) {
				return null;
			}
		} else if (user.getUsername() != null) {
			dbUser = getUserByUsername(user.getUsername());
		}
		if (dbUser.getPassword().equals(user.getPassword())) {
			return dbUser;
		}
		return dbUser;
	}

}
