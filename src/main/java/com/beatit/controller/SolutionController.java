package com.beatit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class SolutionController{
	
	@GetMapping("/solution")
	public String showAnswerPage() {
		return "solution";
	}
	
	@PostMapping("{id}/solution")
	public String submitSolution(@PathVariable("id") int problmId) {
		return "solution";
	}
}
