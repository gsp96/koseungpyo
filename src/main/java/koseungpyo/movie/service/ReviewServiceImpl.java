package koseungpyo.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import koseungpyo.movie.dao.ReviewDao;
import koseungpyo.movie.domain.Review;
import koseungpyo.movie.util.PagingVO;

@Service 
public class ReviewServiceImpl implements ReviewService {
	@Autowired private ReviewDao reviewDao;
	
	@Override
	public List<Review> getReviews() {
		return reviewDao.selectReviews();
	}
	
	@Override
	public List<Review> getselectReview(String title) {
		return reviewDao.selectReview(title);
	}
	
	@Override
	public void addReview(Review review) {
		reviewDao.insertReview(review);
	}
	
	@Override
	public void fixReview(int reviewNum) {
		reviewDao.updateReview(reviewNum);
	}
	
	@Override
	public void delReview(int reviewNum) {
		reviewDao.deleteReview(reviewNum);
	}

	@Override
	public int countBoard() {
		return reviewDao.countBoard();
	}

	@Override
	public List<Review> selectBoard(PagingVO vo) {
		return reviewDao.selectBoard(vo);
	}
}