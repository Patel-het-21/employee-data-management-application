package com.employeedatamanagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {

	@GetMapping("/")
	public String home() {
		return "employee-form"; // Loads employee-list.jsp
	}

	@GetMapping("/employee-form")
	public String form() {
		return "employee-form"; // Loads employee-form.jsp
	}

	@GetMapping("/employee-list")
	public String list() {
		return "employee-list"; // Loads employee-list.jsp
	}
}
