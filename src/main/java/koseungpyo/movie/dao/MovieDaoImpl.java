package koseungpyo.movie.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import koseungpyo.movie.dao.map.MovieMap;
import koseungpyo.movie.domain.Movie;
import koseungpyo.movie.domain.MovieDTO;

@Repository("koseungpyo.dao.movie")
public class MovieDaoImpl implements MovieDao{
	@Autowired private MovieMap moviemap;

	@Override
	public List<Movie> selectMovies() {
		return moviemap.selectMovies();
	}

	@Override
	public Movie selectMovie(int movieNum) {
		return moviemap.selectMovie(movieNum);
	}

	@Override
	public void insertMovie(MovieDTO movie) {
		moviemap.insertMovie(movie);
	}

	@Override
	public void updateMovie(Movie movie) {
		moviemap.updateMovie(movie);
	}

	@Override
	public void deleteMovie(int movieNum) {
		moviemap.deleteMovie(movieNum);
	}

	@Override
	public List<Movie> listMovies() {
		return moviemap.listMovies();
	}
	
	@Override
	public List<Movie> selectmovieInfoLists() {
		return moviemap.selectmovieInfoLists();
	}
}