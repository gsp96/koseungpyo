package koseungpyo.movie.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


import koseungpyo.movie.domain.Review;
import koseungpyo.movie.domain.User;
import koseungpyo.movie.service.ReviewService;

@Controller 
@RequestMapping("/review")
public class ReviewController{
	@Autowired private ReviewService reviewService;	
	
	@RequestMapping("/listReview")
	public String listReview() {
		return "review/listReview";
	}
	
	@ResponseBody
	@PostMapping("/listReview")
	public List<Review> getReviews() {
		return reviewService.getReviews();
	}
	
	@RequestMapping(value = "/selectReview", method=RequestMethod.GET)
	public String selectReview(Model model, @RequestParam("title") String title) {
	    List<Review> reviewList = reviewService.getselectReview(title);
	    model.addAttribute("reviewList", reviewList);
		return "review/selectReview";
	}
	
	
	@RequestMapping("/addReview")
	public String addReview() {
		return "review/addReview";
	}
	
	@ResponseBody
	@PostMapping("/addReview")
	public void addReview(Review review, HttpServletRequest httpRequest) {
		HttpSession session = httpRequest.getSession();
		int userNum = (int) session.getAttribute("userNum");
		review.setUserNum(userNum);
		reviewService.addReview(review);
	}

	@RequestMapping("/fixReview")
	public String fixReview() {
		return "review/fixReview";
	}
	
	@ResponseBody
	@PutMapping("fixReview/{reviewNum}")
	public void fixReview(@PathVariable int reviewNum) {
		reviewService.fixReview(reviewNum);
	}
			
	@ResponseBody	
	@DeleteMapping("del/{reviewNum}")
	public void delReview(@PathVariable int reviewNum) {
		reviewService.delReview(reviewNum);
	}
}