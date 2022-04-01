package koseungpyo.movie.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import koseungpyo.movie.domain.Movie;

public interface MovieService {
	List<Movie> getMovies(String title);
	ModelAndView getMovie(ModelAndView mv, Movie movie);
	void addMovie(Movie movie);
	void fixMovie(Movie movie);
	void delMovie(int movieNum);
}