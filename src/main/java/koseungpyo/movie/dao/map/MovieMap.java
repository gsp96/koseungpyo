package koseungpyo.movie.dao.map;

import java.util.List;

import koseungpyo.movie.domain.Movie;
import koseungpyo.movie.domain.User;

public interface MovieMap {
	List<Movie> selectMovies(String title);
	Movie selectMovie(Movie movie);
	void insertMovie(Movie movie);
	void updateMovie(Movie movie);
	void deleteMovie(int movieNum);
	List<Movie> listMovies();
	List<Movie> selectAdminMovies();
	Movie selectMovie(int movieNum);
}