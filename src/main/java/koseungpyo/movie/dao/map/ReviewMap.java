package koseungpyo.movie.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import koseungpyo.movie.domain.Review;
import koseungpyo.movie.util.PagingVO;

public interface ReviewMap {
	List<Review> selectReviews();
	List<Review> selectReview(@Param("title") String title);
	void insertReview(Review review);
	void updateReview(int reviewNum);
	void deleteReview(int reviewNum);
	
	public List<Review> selectBoard(PagingVO vo);
	public int countBoard();
}

