package koseungpyo.movie.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import koseungpyo.movie.domain.User;
import koseungpyo.movie.service.UserService;

@RestController("koseungpyo.admin.controller")
@RequestMapping("admin")
public class AdminController {
	@Autowired private UserService userService;
	
	@GetMapping("user")
	public ModelAndView adminUser(ModelAndView mv) {
		mv.setViewName("admin/user/listDelete");
		return mv;
	}
	
	@GetMapping("user/list")
	public List<User> adminUserList() {
		return userService.getUsers();
	}
}
