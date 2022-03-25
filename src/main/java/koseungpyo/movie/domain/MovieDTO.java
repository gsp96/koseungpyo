package koseungpyo.movie.domain;

import java.time.LocalDate;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MovieDTO {
	private String title;
	private LocalDate openingDate;
	private String genre;
	private String directorName;
	private String mainActorName;
	private String posterFileName;
	private String audienceNum;
	private String topic;
}
