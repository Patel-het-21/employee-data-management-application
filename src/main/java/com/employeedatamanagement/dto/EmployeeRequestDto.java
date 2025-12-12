package com.employeedatamanagement.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

import com.employeedatamanagement.validation.AgeRange;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class EmployeeRequestDto {

	@NotBlank(message = "First name is required")
	@Size(min = 2, max = 50)
	@Pattern(regexp = "^[A-Za-z ]+$", message = "First name must contain only alphabets and spaces")
	private String firstName;

	@NotBlank(message = "Last name is required")
	@Size(min = 2, max = 50)
	@Pattern(regexp = "^[A-Za-z ]+$", message = "Last name must contain only alphabets and spaces")
	private String lastName;

	@NotNull(message = "Date of birth is required")
	@AgeRange(min = 18, max = 110, message = "Age must be between 18 and 110")
	private LocalDate dateOfBirth;

	@NotBlank(message = "Mobile is required")
	@Pattern(regexp = "^[1-9][0-9]{9}$", message = "Mobile must be 10 digits and not start with 0")
	private String mobile;

	@NotBlank(message = "Address1 is required")
	@Size(max = 255)
	private String address1;

	@Size(max = 255)
	private String address2;

	@NotBlank(message = "Gender is required")
	private String gender;

	@NotBlank(message = "Email is required")
	@Email(message = "Invalid email format")
	@Size(max = 100)
	private String email;

}