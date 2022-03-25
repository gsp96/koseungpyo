package koseungpyo.movie.service;

import java.util.List;

import koseungpyo.movie.domain.Movie;
import koseungpyo.movie.domain.MovieDTO;

public interface MovieService {
	List<Movie> getMovies();
	Movie getMovie(int movieNum);
	void addMovie(MovieDTO movie);
	void fixMovie(Movie movie);
	void delMovie(int movieNum);
	List<Movie> listMovies();
}