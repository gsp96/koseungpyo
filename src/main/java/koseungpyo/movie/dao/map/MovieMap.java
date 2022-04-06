package koseungpyo.movie.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import koseungpyo.movie.domain.Movie;

public interface MovieMap {
	List<Movie> selectMovies(String title);
	Movie selectMovie(Movie movie);
	void insertMovie(Movie movie);
	void updateMovie(Movie movie);
	void deleteMovie(int movieNum);
	List<Movie> listMovies();
	List<Movie> selectAdminMovies();
	Movie selectMovie(@Param("movieNum") int movieNum);
}