package koseungpyo.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import koseungpyo.movie.dao.MovieDao;
import koseungpyo.movie.domain.Movie;
import koseungpyo.movie.domain.MovieDTO;


@Service("koseungpyo.service.movie")
public class MovieServiceImpl implements MovieService{
	@Autowired private MovieDao movieDao;

	@Override
	public List<Movie> getMovies() {
		return movieDao.selectMovies();
	}

	@Override
	public Movie getMovie(int movieNum) {
		return movieDao.selectMovie(movieNum);
	}

	@Override
	public void addMovie(MovieDTO movie) {
		movieDao.insertMovie(movie);
	}

	@Override
	public void fixMovie(Movie movie) {
		movieDao.updateMovie(movie);
	}

	@Override
	public void delMovie(int movieNum) {
		movieDao.deleteMovie(movieNum);
	}

	@Override
	public List<Movie> listMovies() {
		return movieDao.listMovies();
	}
	
	@Override
	public List<Movie> getmovieInfoLists(String title) {
		return movieDao.selectmovieInfoLists();
	}
}