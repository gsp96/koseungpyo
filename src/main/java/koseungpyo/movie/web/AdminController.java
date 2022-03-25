package koseungpyo.movie.web;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import koseungpyo.movie.domain.Movie;
import koseungpyo.movie.domain.MovieDTO;
import koseungpyo.movie.domain.User;
import koseungpyo.movie.service.MovieService;
import koseungpyo.movie.service.UserService;
import spring.web.ch03.ex02.UserDto;

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
	
	@PutMapping("movieRegist")
	public void movieRegist(@RequestParam("title") String title, 
		@RequestParam("openingDate") @DateTimeFormat(pattern="yyyy-MM-dd") LocalDate openingDate,
		@RequestParam("genre") String genre, @RequestParam("directorName") String directorName,
		@RequestParam("mainActorName") String mainActorName, @RequestParam("posterFileName") MultipartFile posterFileName,
		@RequestParam("audienceNum") String audienceNum, @RequestParam("topic") String topic) {
			MovieDTO movie = new MovieDTO(title, LocalDate.now(), genre, directorName, mainActorName, posterFileName, audienceNum, topic);
			movieService.addMovie(movie);
	}
	
	/*
	@RequestMapping(value = "/movieInfoList", method=RequestMethod.GET)
	public String movieInfoList(Model model, @RequestParam("title") String title) {
	    List<Movie> movieList = movieService.getmovieInfoLists(title);
	    model.addAttribute("movieList", movieList);
		return "admin/movie/movieInfoList";
	}
	*/
}
