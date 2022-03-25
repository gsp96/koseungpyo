package koseungpyo.movie.domain;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class Review {
	private int reviewNum;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private LocalDate writedDate;
	private String content;
	private String title;
	private double grade;
	private int userNum;
	private String userName;
	private int movieNum;
}