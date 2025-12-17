package com.employeedatamanagement.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @author Het Patel
 * @since 11/12/25
 * 
 * Data Transfer Object (DTO) used to send employee data in API responses.
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class EmployeeResponseDto {

	/**
	 * Unique identifier of the employee.
	 */
	private Long id;
	/**
	 * Employee's first name.
	 */
	private String firstName;
	/**
	 * Employee's last name.
	 */
	private String lastName;
	/**
	 * Employee's date of birth.
	 */
	private LocalDate dateOfBirth;
	/**
	 * Employee's calculated age.
	 */
	private int age;
	/**
	 * Employee's mobile number.
	 */
	private String mobile;
	/**
	 * Employee's email address.
	 */
	private String email;
	/**
	 * Employee's gender.
	 */
	private String gender;
	/**
	 * Employee's primary address.
	 */
	private String address1;
	/**
	 * Employee's secondary address.
	 */
	private String address2;

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	/**
	 * @return the dateOfBirth
	 */
	public LocalDate getDateOfBirth() {
		return dateOfBirth;
	}

	/**
	 * @param dateOfBirth the dateOfBirth to set
	 */
	public void setDateOfBirth(LocalDate dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	/**
	 * @return the age
	 */
	public int getAge() {
		return age;
	}

	/**
	 * @param age the age to set
	 */
	public void setAge(int age) {
		this.age = age;
	}

	/**
	 * @return the mobile
	 */
	public String getMobile() {
		return mobile;
	}

	/**
	 * @param mobile the mobile to set
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the gender
	 */
	public String getGender() {
		return gender;
	}

	/**
	 * @param gender the gender to set
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}

	/**
	 * @return the address1
	 */
	public String getAddress1() {
		return address1;
	}

	/**
	 * @param address1 the address1 to set
	 */
	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	/**
	 * @return the address2
	 */
	public String getAddress2() {
		return address2;
	}

	/**
	 * @param address2 the address2 to set
	 */
	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public EmployeeResponseDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EmployeeResponseDto(Long id, String firstName, String lastName, LocalDate dateOfBirth, int age,
			String mobile, String email, String gender, String address1, String address2) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.dateOfBirth = dateOfBirth;
		this.age = age;
		this.mobile = mobile;
		this.email = email;
		this.gender = gender;
		this.address1 = address1;
		this.address2 = address2;
	}

}