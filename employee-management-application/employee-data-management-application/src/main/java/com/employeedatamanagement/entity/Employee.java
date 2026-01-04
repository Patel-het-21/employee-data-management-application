package com.employeedatamanagement.entity;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @author Het Patel
 * @since 11/12/25
 * 
 *        Entity representing an employee record in the system.
 */
@Entity
@Table(name = "employee", uniqueConstraints = { @UniqueConstraint(columnNames = "mobile"),
		@UniqueConstraint(columnNames = "email") })
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Employee {

	/**
	 * Primary key of the employee table.
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	/**
	 * Employee's first name.
	 */
	@Column(name = "first_name", length = 50, nullable = false)
	private String firstName;
	/**
	 * Employee's last name.
	 */
	@Column(name = "last_name", length = 50, nullable = false)
	private String lastName;
	/**
	 * Employee's date of birth.
	 */
	@Column(name = "date_of_birth", nullable = false)
	private LocalDate dateOfBirth;
	/**
	 * Employee's mobile number.
	 */
	@Column(name = "mobile", length = 10, nullable = false, unique = true)
	private String mobile;
	/**
	 * Employee's primary address.
	 */
	@Column(name = "address1", length = 255, nullable = false)
	private String address1;
	/**
	 * Employee's secondary address.
	 */
	@Column(name = "address2", length = 255)
	private String address2;
	/**
	 * Employee's age.
	 */
	@Column(name = "age", nullable = false)
	private Integer age;
	/**
	 * Employee's gender.
	 */
	@Column(name = "gender", length = 10, nullable = false)
	private String gender;
	/**
	 * Employee's email address.
	 */
	@Column(name = "email", length = 255, nullable = false, unique = true)
	private String email;

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
	 * @return the age
	 */
	public Integer getAge() {
		return age;
	}

	/**
	 * @param age the age to set
	 */
	public void setAge(Integer age) {
		this.age = age;
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

	public Employee(Long id, String firstName, String lastName, LocalDate dateOfBirth, String mobile, String address1,
			String address2, Integer age, String gender, String email) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.dateOfBirth = dateOfBirth;
		this.mobile = mobile;
		this.address1 = address1;
		this.address2 = address2;
		this.age = age;
		this.gender = gender;
		this.email = email;
	}

	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}

}