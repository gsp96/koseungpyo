package koseungpyo.movie.web;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
	
	private void saveFile(String fileName, MultipartFile file) {
		try {
			file.transferTo(new File(fileName));
		} catch(IOException e) {}
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
	
	@GetMapping("movieModifyInfo")
	public ModelAndView adminMovie2(ModelAndView mv) {
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
	
	@PostMapping("movieModifyInfo")
	public void movieModifyInfo ( @RequestParam("movieNum") int movieNum, @RequestParam("title") String title,
			 @RequestParam("openingDate") @DateTimeFormat(pattern="yyyy-MM-dd") LocalDate openingDate, @RequestParam("genre") String genre,
			@RequestParam("directorName") String directorName, @RequestParam("mainActorName") String mainActorName, @RequestParam("posterFileName") String posterFileName,
			@RequestParam("audienceNum") String audienceNum, @RequestParam("topic") String topic
			) {
				Movie movie = movieService.getMovie(movieNum);
				movie.setMovieNum(movieNum);
				movie.setTitle(title);
				movie.setOpeningDate(openingDate);
				movie.setGenre(genre);
				movie.setDirectorName(directorName);
				movie.setMainActorName(mainActorName);
				movie.setAudienceNum(audienceNum);
				movie.setTopic(topic);
				movieService.fixMovie(movie);
	}
	
	@PostMapping("modify")
	public ModelAndView modifyMovie(Movie movie, HttpSession session, ModelAndView mv, String title) {
		System.out.println(movie);
		String fileName = movie.getPosterFile().getOriginalFilename();
		saveFile(attachPath + "/" + fileName, movie.getPosterFile());
		
		mv.setViewName("redirect:/admin");
		movie.setPosterFileName(fileName);
		movie.setTitle(title);
		movieService.addMovie(movie);
		
		return mv;
	}
	
	@DeleteMapping("del/{movieNum}") 
	   public void delMovie(@PathVariable int movieNum) {
	      movieService.delMovie(movieNum);
	}
	
	@GetMapping("loadMovie")
	public Movie loadMovie(@RequestParam("movieNum") int movieNum) {
		System.out.println(movieNum);
		return movieService.getMovie(movieNum);
	}
	
	@GetMapping("fixMovie")
	public ModelAndView fixMoive(ModelAndView mv) {
		mv.setViewName("admin/movie/modifyInfo");
		return mv;
	}
	
	@GetMapping("loadfixMovie")
	public void loadfixMovie(@RequestParam("movieNum") int movieNum, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("movieNum", movieNum);
	}
}
