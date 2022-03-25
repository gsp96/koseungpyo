package koseungpyo.movie.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import koseungpyo.movie.dao.map.ReviewMap;
import koseungpyo.movie.domain.Review;
import koseungpyo.movie.util.PagingVO;

@Repository
public class ReviewDaoImpl implements ReviewDao{
	@Autowired private ReviewMap reviewMap;
	
	@Override
	public List<Review> selectReviews() {
		return reviewMap.selectReviews();
	}
	
	@Override 
	public List<Review> selectReview(String title) {
		return reviewMap.selectReview(title);
	}
	
	@Override
	public void insertReview(Review review) {
		reviewMap.insertReview(review);
	}
	
	@Override
	public void updateReview(int reviewNum) {
		reviewMap.updateReview(reviewNum);
	}
	
	@Override
	public void deleteReview(int reviewNum) {
		reviewMap.deleteReview(reviewNum);
	}
	
	@Override
	public int countBoard() {
		return reviewMap.countBoard();
	}

	@Override
	public List<Review> selectBoard(PagingVO vo) {
		return reviewMap.selectBoard(vo);
	}
}