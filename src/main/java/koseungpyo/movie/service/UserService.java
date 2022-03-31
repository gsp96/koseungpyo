package koseungpyo.movie.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import koseungpyo.movie.domain.User;
import koseungpyo.movie.domain.UserDTO;

public interface UserService {
	List<User> getUsers();
	User getUser(String userId, String pw);
	User getUser(int userNum);
	void addUser(UserDTO user);
	void fixUser(User user);
	void delUser(int userNum);
	String overlapCheckId(@Param("userId") String userId);
	String findId(String userName, double phoneNum);
	String findPw(String userId, double phoneNum);
}