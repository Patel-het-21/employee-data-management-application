package com.employeedatamanagement.validation;

import java.time.LocalDate;
import java.time.Period;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class AgeRangeValidator implements ConstraintValidator<AgeRange, java.time.LocalDate> {

	private int min;
	private int max;

	@Override
	public void initialize(AgeRange constraintAnnotation) {
		this.min = constraintAnnotation.min();
		this.max = constraintAnnotation.max();
	}

	@Override
	public boolean isValid(LocalDate dob, ConstraintValidatorContext context) {
		if (dob == null)
			return false;
		LocalDate today = LocalDate.now();
		if (dob.isAfter(today))
			return false;
		int age = Period.between(dob, today).getYears();
		return age >= min && age <= max;
	}
}
