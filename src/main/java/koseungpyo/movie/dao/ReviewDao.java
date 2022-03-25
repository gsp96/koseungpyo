package koseungpyo.movie.dao;

import java.util.List;

import koseungpyo.movie.domain.Review;
import koseungpyo.movie.util.PagingVO;

public interface ReviewDao {
	List<Review> selectReviews();
	List<Review> selectReview(String title);
	void insertReview(Review review);
	void updateReview(int reviewNum);
	void deleteReview(int reviewNum);
	
	public List<Review> selectBoard(PagingVO vo);
	public int countBoard();
} 