package koseungpyo.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import koseungpyo.movie.dao.UserDao;
import koseungpyo.movie.domain.User;
import koseungpyo.movie.domain.UserDTO;

@Service("koseungpyo.service.user")
public class UserServiceImpl implements UserService{
	@Autowired private UserDao userDao;

	@Override
	public List<User> getUsers() {
		return userDao.selectUsers();
	}

	@Override
	public void addUser(UserDTO user) {
		userDao.insertUser(user);
	}

	@Override
	public void fixUser(User user) {
		userDao.updateUser(user);
	}

	@Override
	public void delUser(int userNum) {
		userDao.deleteUser(userNum);
	}

	@Override
	public User getUser(String userId, String pw) {
		return userDao.selectUser(userId, pw);
	}

	@Override
	public String overlapCheckId(String userId) {
		User user = userDao.checkUserId(userId);
		if(user != null) {
			return user.getUserId();
		}
		else {
			return "null";
		}
	}

	@Override
	public String findId(String userName, double phoneNum) {
		return userDao.findId(userName, phoneNum);
	}
}