package koseungpyo.movie.web;

import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import koseungpyo.movie.domain.User;
import koseungpyo.movie.domain.UserDTO;
import koseungpyo.movie.service.UserService;

@RestController("koseungpyo.user.controller")
@RequestMapping("user")
public class UserController {
	@Autowired private UserService userService;
	
	@GetMapping("loginView")
	public ModelAndView loginView(ModelAndView mv) {
		mv.setViewName("user/login");
		return mv;
	}
	
	@PostMapping("login")
	public void login(@RequestParam("userId") String userId, @RequestParam("userPw") String pw, Model model,String idRemember, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = userService.getUser(userId, pw);
		session.setAttribute("userId", user.getUserId());
		session.setAttribute("userNum", user.getUserNum());
		if(user.getUserId().equals("admin")) {
			model.addAttribute("admin",user);
		}else {
			model.addAttribute("user",user);
		}
	}
	
	@GetMapping("logout")
	public ModelAndView logout(HttpSession session, ModelAndView mv) {
		session.invalidate();
		mv.setViewName("main");
		return mv;
	}
	
	@GetMapping("userRegist")
	public ModelAndView userRegist(ModelAndView mv) {
		mv.setViewName("user/userRegist");
		return mv;
	}
	@PostMapping("overlap")
	public void overlap (@RequestParam("userId") String userId) {
		userService.overlapCheckId(userId);
	}
	
	@PostMapping("userRegist")
	public void userRegist(@RequestParam("userId") String userId, @RequestParam("pw") String pw, @RequestParam("userName") String userName,
			@RequestParam("phoneNum") double phoneNum, @RequestParam("email") String email, @RequestParam("birthDate") @DateTimeFormat(pattern="yyyy-MM-dd") LocalDate birthDate) {
		UserDTO user = new UserDTO(userId, pw, userName, birthDate, LocalDate.now(), email, phoneNum);
		userService.addUser(user);
	}
	
	@GetMapping("findId")
	public ModelAndView findId(ModelAndView mv) {
		mv.setViewName("user/findId");
		return mv;
	}
	
	@PostMapping("findId")
	public String findId(@RequestParam("userName") String userName, @RequestParam("phoneNum") double phoneNum, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("userId", userService.findId(userName, phoneNum));
		return userService.findId(userName, phoneNum);
	}
	
	@GetMapping("findIdResult")
	public ModelAndView findIdResult(ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.getAttribute("userId");
		mv.setViewName("user/findIdResult");
		return mv;
	}
	
	@GetMapping("findPw")
	public ModelAndView findPw(ModelAndView mv) {
		mv.setViewName("user/findPw");
		return mv;
	}
	
	@PostMapping("findPw")
	public String findPw(@RequestParam("userId") String userId, @RequestParam("phoneNum") double phoneNum, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("email", userService.findPw(userId, phoneNum));
		return userService.findPw(userId, phoneNum);
	}
	
	@GetMapping("findPwResult")
	public ModelAndView findPwResult(ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.getAttribute("email");
		mv.setViewName("user/findPwResult");
		return mv;
	}
	
	@GetMapping("myPage")
	public ModelAndView myPage(ModelAndView mv) {
		mv.setViewName("user/myPage");
		return mv;
	}
	
	@PostMapping("myPage")
	public void myPage( @RequestParam("userNum") int userNum, @RequestParam("userId") String userId, @RequestParam("pw") String pw,
			@RequestParam("userName") String userName, @RequestParam("birthDate") @DateTimeFormat(pattern="yyyy-MM-dd") LocalDate birthDate, @RequestParam("email") String email, @RequestParam("phoneNum") double phoneNumber) {
		User user = userService.getUser(userNum);
		user.setUserId(userId);
		user.setPw(pw);
		user.setUserName(userName);
		user.setBirthDate(birthDate);
		user.setEmail(email);
		user.setPhoneNumber(phoneNumber);
		userService.fixUser(user);
	}
	@GetMapping("loadUser")
	public User loadUser(@RequestParam("userNum") int userNum) {
		return userService.getUser(userNum);
	}
	
}