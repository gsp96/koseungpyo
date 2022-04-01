package koseungpyo.movie.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import koseungpyo.movie.domain.Movie;
import koseungpyo.movie.service.MovieService;

@RestController("koseungpyo.movie.controller")
@RequestMapping("movie")
public class MovieController {
	@Autowired private MovieService movieService;
	
	@GetMapping("movieList")
	public ModelAndView movieView(ModelAndView mv) {
		mv.setViewName("movie/genreList");
		return mv;
	}
	
	@GetMapping("movieInfo")
	public ModelAndView movieView1(ModelAndView mv) {
		mv.setViewName("movie/movie");
		return mv;
	}
}
