package com.skilldistillery.beerhound.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

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
		return ! em.contains(user);
	}

	@Override
	public User updateUser(User user) {
		User dbUser = em.find(User.class, user.getId());
		if (dbUser == null) {
			return null;
		}
		dbUser.setAddress(user.getAddress());
		dbUser.setBarRatings(user.getBarRatings());
		dbUser.setBeerRatings(user.getBeerRatings());
		dbUser.setBiography(user.getBiography());
		dbUser.setEmail(user.getEmail());
		dbUser.setEnabled(user.getEnabled());
		dbUser.setFavoriteBarList(user.getFavoriteBarList());
		dbUser.setFavoriteBeerList(user.getFavoriteBeerList());
		dbUser.setFirstName(user.getFirstName());
		dbUser.setLastName(user.getLastName());
		dbUser.setPassword(user.getPassword());
		dbUser.setRole(user.getRole());
		dbUser.setUsername(user.getUsername());
		dbUser.setImage(user.getImage());
		return dbUser;
	}

	@Override
	public List<User> searchUsernames(String keyword) {
		keyword = "%"+keyword+"%";
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
			em.createQuery(query, User.class).setParameter("email", email).getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
