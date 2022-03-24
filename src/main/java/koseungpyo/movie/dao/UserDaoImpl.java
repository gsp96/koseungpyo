package koseungpyo.movie.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import koseungpyo.movie.dao.map.UserMap;
import koseungpyo.movie.domain.User;
import koseungpyo.movie.domain.UserDTO;

@Repository
public class UserDaoImpl implements UserDao{
	@Autowired private UserMap userMap;

	@Override
	public List<User> selectUsers() {
		return userMap.selectUsers();
	}

	@Override
	public void insertUser(UserDTO user) {
		userMap.insertUser(user);
	}

	@Override
	public void updateUser(User user) {
		userMap.updateUser(user);
	}

	@Override
	public void deleteUser(int userNum) {
		userMap.deleteUser(userNum);
	}

	@Override
	public User selectUser(String userId, String pw) {
		return userMap.selectUser(userId, pw);
	}

	@Override
	public User checkUserId(String userId) {
		return userMap.checkUserId(userId);
	}

	@Override
	public String findId(String userName, double phoneNum) {
		String userId = userMap.findId(userName, phoneNum);
		if(userId == " ") {
			userId = "noId";
		}
		return userId;
	}

	@Override
	public String findPw(String userId, double phoneNum) {
		String email = userMap.findPw(userId, phoneNum);
		if(email == " ") {
			email = "noEmail";
		}
		return email;
	}
}