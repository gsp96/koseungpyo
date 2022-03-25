package koseungpyo.movie.dao.map;

import java.util.List;

import koseungpyo.movie.domain.Movie;
import koseungpyo.movie.domain.MovieDTO;

public interface MovieMap {
	List<Movie> selectMovies();
	Movie selectMovie(int movieNum);
	void insertMovie(MovieDTO movie);
	void updateMovie(Movie movie);
	void deleteMovie(int movieNum);
	List<Movie> listMovies();
	List<Movie> selectmovieInfoLists();
}