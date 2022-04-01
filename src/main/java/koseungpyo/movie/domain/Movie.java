package koseungpyo.movie.domain;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Movie {
	private int movieNum;
	private String title;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate openingDate;
	private String genre;
	private String directorName;
	private String mainActorName;
	private String posterFileName;
	private MultipartFile posterFile;
	private String audienceNum;
	private String topic;
}