package koseungpyo.movie.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import koseungpyo.movie.domain.Movie;
import koseungpyo.movie.domain.User;
import koseungpyo.movie.service.MovieService;
import koseungpyo.movie.service.UserService;

@RestController("koseungpyo.admin.controller")
@RequestMapping("admin")
public class AdminController {
	@Autowired private UserService userService;
	@Autowired private MovieService movieService;
	@Value("${attachPath}") private String attachPath;
	
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
	
	@GetMapping("movieList")
	public List<Movie> movieList() {
		return movieService.getAdminMovies();
	}
	
	@GetMapping("movieInfo")
	public ModelAndView adminMovie1(ModelAndView mv) {
		mv.setViewName("admin/movie/writeInfo");
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView addMovie(Movie movie, HttpSession session, ModelAndView mv) {
		System.out.println(movie);
		String fileName = movie.getPosterFile().getOriginalFilename();
		saveFile(attachPath + "/" + fileName, movie.getPosterFile());
		
		mv.setViewName("redirect:/admin");
		movie.setPosterFileName(fileName);
		movieService.addMovie(movie);
		
		return mv;
	}
	
	private void saveFile(String fileName, MultipartFile file) {
		try {
			file.transferTo(new File(fileName));
		} catch(IOException e) {}
	}
	
	@DeleteMapping("del/{movieNum}") 
	   public void delMovie(@PathVariable int movieNum) {
	      movieService.delMovie(movieNum);
	}
	
	/*
	@PostMapping("movieRegist")
	public void movieRegist(@RequestParam(value = "title") String title, 
		@RequestParam("openingDate") @DateTimeFormat(pattern="yyyy-MM-dd") LocalDate openingDate,
		@RequestParam("genre") String genre, @RequestParam("directorName") String directorName,
		@RequestParam("mainActorName") String mainActorName, @RequestParam("posterFile") MultipartFile posterFile,
		@RequestParam("audienceNum") String audienceNum, @RequestParam("topic") String topic) {
			System.out.println(posterFile.getOriginalFilename());
			String posterFileName = posterFile.getOriginalFilename();
			Movie movie = new Movie(title, openingDate, genre, directorName, mainActorName, posterFile, audienceNum, topic);
			movieService.addMovie(movie);
	}
	*/
	// 
	
	/*
	@RequestMapping(value = "/movieInfoList", method=RequestMethod.GET)
	public String movieInfoList(Model model, @RequestParam("title") String title) {
	    List<Movie> movieList = movieService.getmovieInfoLists(title);
	    model.addAttribute("movieList", movieList);
		return "admin/movie/movieInfoList";
	}
	*/
}
