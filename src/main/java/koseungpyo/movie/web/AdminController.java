package koseungpyo.movie.web;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import koseungpyo.movie.domain.MovieDTO;
import koseungpyo.movie.domain.User;
import koseungpyo.movie.service.MovieService;
import koseungpyo.movie.service.UserService;

@RestController("koseungpyo.admin.controller")
@RequestMapping("admin")
public class AdminController {
	@Autowired private UserService userService;
	@Autowired private MovieService movieService;
	
	@GetMapping("user")
	public ModelAndView adminUser(ModelAndView mv) {
		mv.setViewName("admin/user/listDelete");
		return mv;
	}
	
	@GetMapping("user/list")
	public List<User> adminUserList() {
		return userService.getUsers();
	}
	
	@DeleteMapping("user/del/{userNum}")
	public void deleteUser(@PathVariable int userNum) {
		userService.delUser(userNum);
	}
	
	@GetMapping("movieInfoList")
	public ModelAndView adminMovie(ModelAndView mv) {
		mv.setViewName("admin/movie/movieInfoList");
		return mv;
	}
	
	@GetMapping("movieInfo")
	public ModelAndView adminMovie1(ModelAndView mv) {
		mv.setViewName("admin/movie/writeInfo");
		return mv;
	}
	
	@PostMapping("movieRegist")
	public void movieRegist(@RequestParam(value = "title", required = false) String title, 
		@RequestParam("openingDate") @DateTimeFormat(pattern="yyyy-MM-dd") LocalDate openingDate,
		@RequestParam("genre") String genre, @RequestParam("directorName") String directorName,
		@RequestParam("mainActorName") String mainActorName, @RequestParam("posterFile") MultipartFile posterFile,
		@RequestParam(value = "audienceNum", required = false) String audienceNum, @RequestParam(value = "topic", required = false) String topic) {
			System.out.println(posterFile.getOriginalFilename());
			String posterFileName = posterFile.getOriginalFilename();
			MovieDTO movie = new MovieDTO(title, openingDate, genre, directorName, mainActorName, posterFileName, audienceNum, topic);
			movieService.addMovie(movie);
	}
}
