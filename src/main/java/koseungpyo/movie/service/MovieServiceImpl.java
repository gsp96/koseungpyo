package koseungpyo.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import koseungpyo.movie.dao.MovieDao;
import koseungpyo.movie.domain.Movie;
import koseungpyo.movie.domain.User;


@Service("koseungpyo.service.movie")
public class MovieServiceImpl implements MovieService{
	@Autowired private MovieDao movieDao;

	@Override
	public List<Movie> getMovies(String title) {
		return movieDao.selectMovies(title);
	}
	
	@Override
	public ModelAndView getMovie(ModelAndView mv, Movie movie) {
		Movie movieVal = movieDao.selectMovie(movie);
		
		mv.addObject("movie", movieVal);
		mv.setViewName("movie/genreList");
		return mv;
	}

	@Override
	public void addMovie(Movie movie) {
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
	public List<Movie> getAdminMovies() {
		return movieDao.selectAdminMovies();
	}
	
	@Override
	public Movie getMovie(int movieNum) {
		return movieDao.selectMovie(movieNum);
	}
}