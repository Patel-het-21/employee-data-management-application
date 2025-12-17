package com.employeedatamanagement.dto;

import java.time.LocalDate;

import com.employeedatamanagement.validation.AgeRange;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @author Het Patel
 * @since 11/12/25
 * 
 * Data Transfer Object (DTO) used for employee create and update requests.
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class EmployeeRequestDto {

	/**
	 * Employee's first name.
	 */
	@NotBlank(message = "First name is required")
	@Size(min = 2, max = 50)
	@Pattern(regexp = "^[A-Za-z ]+$", message = "First name must contain only alphabets and spaces")
	private String firstName;
	/**
	 * Employee's last name.
	 */
	@NotBlank(message = "Last name is required")
	@Size(min = 2, max = 50)
	@Pattern(regexp = "^[A-Za-z ]+$", message = "Last name must contain only alphabets and spaces")
	private String lastName;
	/**
	 * Employee's date of birth.
	 * <p>
	 * Age must be between 18 and 110 years.
	 * </p>
	 */
	@NotNull(message = "Date of birth is required")
	@AgeRange(min = 18, max = 110, message = "Age must be between 18 and 110")
	private LocalDate dateOfBirth;
	/**
	 * Employee's mobile number.
	 */
	@NotBlank(message = "Mobile is required")
	@Pattern(regexp = "^[1-9][0-9]{9}$", message = "Mobile must be 10 digits and not start with 0")
	private String mobile;
	/**
	 * Primary address of the employee.
	 */
	@NotBlank(message = "Address1 is required")
	@Size(max = 255)
	private String address1;
	/**
	 * Secondary address of the employee (optional).
	 */
	@Size(max = 255)
	private String address2;
	/**
	 * Employee's gender.
	 */
	@NotBlank(message = "Gender is required")
	private String gender;
	/**
	 * Employee's email address.
	 */
	@NotBlank(message = "Email is required")
	@Email(message = "Invalid email format")
	@Size(max = 254)
	private String email;

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

	public EmployeeRequestDto(
			@NotBlank(message = "First name is required") @Size(min = 2, max = 50) @Pattern(regexp = "^[A-Za-z ]+$", message = "First name must contain only alphabets and spaces") String firstName,
			@NotBlank(message = "Last name is required") @Size(min = 2, max = 50) @Pattern(regexp = "^[A-Za-z ]+$", message = "Last name must contain only alphabets and spaces") String lastName,
			@NotNull(message = "Date of birth is required") LocalDate dateOfBirth,
			@NotBlank(message = "Mobile is required") @Pattern(regexp = "^[1-9][0-9]{9}$", message = "Mobile must be 10 digits and not start with 0") String mobile,
			@NotBlank(message = "Address1 is required") @Size(max = 255) String address1,
			@Size(max = 255) String address2, @NotBlank(message = "Gender is required") String gender,
			@NotBlank(message = "Email is required") @Email(message = "Invalid email format") @Size(max = 100) String email) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.dateOfBirth = dateOfBirth;
		this.mobile = mobile;
		this.address1 = address1;
		this.address2 = address2;
		this.gender = gender;
		this.email = email;
	}

	public EmployeeRequestDto() {
		super();
		// TODO Auto-generated constructor stub
	}

}