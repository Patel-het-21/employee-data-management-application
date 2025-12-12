package com.employeedatamanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import com.employeedatamanagement.dto.EmployeeRequestDto;
import com.employeedatamanagement.dto.EmployeeResponseDto;
import com.employeedatamanagement.service.EmployeeService;

import jakarta.validation.Valid;

import java.util.List;

@RestController
@RequestMapping("/api/v1/employees")
@Validated
public class EmployeeController {

	private final EmployeeService service;

	@Autowired
	public EmployeeController(EmployeeService service) {
		this.service = service;
	}

	@PostMapping
	public ResponseEntity<EmployeeResponseDto> createEmployee(@Valid @RequestBody EmployeeRequestDto dto) {
		EmployeeResponseDto created = service.createEmployee(dto);
		return ResponseEntity.ok(created);
	}

	@PutMapping("/{id}")
	public ResponseEntity<EmployeeResponseDto> updateEmployee(@PathVariable Long id,
			@Valid @RequestBody EmployeeRequestDto dto) {
		EmployeeResponseDto updated = service.updateEmployee(id, dto);
		return ResponseEntity.ok(updated);
	}

	@GetMapping
	public ResponseEntity<List<EmployeeResponseDto>> getAll() {
		return ResponseEntity.ok(service.getAllEmployees());
	}

	@GetMapping("/{id}")
	public ResponseEntity<EmployeeResponseDto> getById(@PathVariable Long id) {
		return ResponseEntity.ok(service.getEmployeeById(id));
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<Void> delete(@PathVariable Long id) {
		service.deleteEmployee(id);
		return ResponseEntity.noContent().build();
	}

	@GetMapping("/search")
	public ResponseEntity<List<EmployeeResponseDto>> search(@RequestParam("name") String name) {
		return ResponseEntity.ok(service.searchByName(name));
	}

	// endpoints to check duplicates (optional helper)
	@GetMapping("/check-email")
	public ResponseEntity<Boolean> checkEmail(@RequestParam String email, @RequestParam(required = false) Long id) {
		return ResponseEntity.ok(service.isEmailTaken(email, id));
	}

	@GetMapping("/check-mobile")
	public ResponseEntity<Boolean> checkMobile(@RequestParam String mobile, @RequestParam(required = false) Long id) {
		return ResponseEntity.ok(service.isMobileTaken(mobile, id));
	}
}
