package koseungpyo.movie.domain;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class UserDTO {
	private String userId;
	private String pw;
	private String userName;
	private LocalDate birthDate;
	private LocalDate regDate;
	private String email;
	private double phoneNumber;
}