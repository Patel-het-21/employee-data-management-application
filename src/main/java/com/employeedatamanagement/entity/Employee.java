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

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@Table(name = "employee", uniqueConstraints = { @UniqueConstraint(columnNames = "mobile"),@UniqueConstraint(columnNames = "email") })
public class Employee {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "first_name", length = 50, nullable = false)
	private String firstName;
	
	@Column(name = "last_name", length = 50, nullable = false)
	private String lastName;
	
	@Column(name = "date_of_birth", length = 50, nullable = false)
	private LocalDate dateOfBirth;
	
	@Column(name = "mobile", length = 10, nullable = false, unique = true)
	private String mobile;
	
	@Column(name = "address1", length = 255, nullable = false)
	private String address1;

	@Column(name = "address2", length = 255)
	private String address2;

	@Column(name = "age", nullable = false)
	private Integer age;

	@Column(name = "gender", length = 10, nullable = false)
	private String gender;

	@Column(name = "email", length = 100, nullable = false, unique = true)
	private String email;

}