package com.employeedatamanagement.service;

import java.util.List;

import com.employeedatamanagement.dto.EmployeeRequestDto;
import com.employeedatamanagement.dto.EmployeeResponseDto;

public interface EmployeeService {

	EmployeeResponseDto createEmployee(EmployeeRequestDto dto);

	EmployeeResponseDto updateEmployee(Long id, EmployeeRequestDto dto);

	EmployeeResponseDto getEmployeeById(Long id);

	List<EmployeeResponseDto> getAllEmployees();

	void deleteEmployee(Long id);

	List<EmployeeResponseDto> searchByName(String name);

	boolean isEmailTaken(String email, Long excludingId);

	boolean isMobileTaken(String mobile, Long excludingId);
}
