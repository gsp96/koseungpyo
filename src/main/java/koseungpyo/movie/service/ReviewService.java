package koseungpyo.movie.service;

import java.util.List;

import koseungpyo.movie.domain.Review;
import koseungpyo.movie.util.PagingVO;

public interface ReviewService {
	List<Review> getReviews();
	List<Review> getselectReview(String title);
	void addReview(Review review);
	void fixReview(int reviewNum);
	void delReview(int reviewNum);
	
	public List<Review> selectBoard(PagingVO vo);
	public int countBoard();
}