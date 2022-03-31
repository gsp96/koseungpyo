package koseungpyo.movie.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import koseungpyo.movie.domain.User;
import koseungpyo.movie.domain.UserDTO;


public interface UserDao {
	List<User> selectUsers();
	User selectUser(String userId, String pw);
	User selectUser(int userNum);
	void insertUser(UserDTO user);
	void updateUser(User user);
	void deleteUser(int userNum);
	User checkUserId(@Param("userId") String userId);
	String findId(@Param("userName") String userName, @Param("phoneNum") double phoneNum);
	String findPw(@Param("userId") String userId, @Param("phoneNum") double phoneNum);
}
