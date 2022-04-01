package koseungpyo.movie.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import koseungpyo.movie.dao.map.MovieMap;
import koseungpyo.movie.domain.Movie;

@Repository("koseungpyo.dao.movie")
public class MovieDaoImpl implements MovieDao{
	@Autowired private MovieMap movieMap;

	@Override
	public List<Movie> selectMovies(String title) {
		return movieMap.selectMovies(title);
	}

	@Override
	public Movie selectMovie(Movie movie) {
		return movieMap.selectMovie(movie);	
	}

	@Override
	public void insertMovie(Movie movie) {
		movieMap.insertMovie(movie);
	}

	@Override
	public void updateMovie(Movie movie) {
		movieMap.updateMovie(movie);
	}

	@Override
	public void deleteMovie(int movieNum) {
		movieMap.deleteMovie(movieNum);
	}

	@Override
	public List<Movie> listMovies() {
		return movieMap.listMovies();
	}
	
	@Override
	public List<Movie> selectAdminMovies() {
		return movieMap.selectAdminMovies();		
	}
}