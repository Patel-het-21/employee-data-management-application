package com.employeedatamanagement.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class EmployeeResponseDto {

	private Long id;
	private String firstName;
	private String lastName;
	private LocalDate dateOfBirth;
	private int age;
	private String mobile;
	private String email;
	private String gender;
	private String address1;
	private String address2;

}