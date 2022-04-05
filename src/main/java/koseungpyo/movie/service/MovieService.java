package koseungpyo.movie.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import koseungpyo.movie.domain.Movie;
import koseungpyo.movie.domain.User;

public interface MovieService {
	List<Movie> getMovies(String title);
	ModelAndView getMovie(ModelAndView mv, Movie movie);
	void addMovie(Movie movie);
	void fixMovie(Movie movie);
	void delMovie(int movieNum);
	List<Movie> getAdminMovies();
	Movie getMovie(int movieNum);
}