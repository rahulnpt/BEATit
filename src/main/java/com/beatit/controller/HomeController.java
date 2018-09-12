package com.beatit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.beatit.dto.Problem;
import com.beatit.service.HomeService;

@Controller
public class HomeController {
	
	private final Logger LOGGER = LoggerFactory.getLogger(this.getClass());	
	
	@Autowired
	private HomeService  homeService ;
	
	
	@GetMapping(value={"/","/home"})
	public String showLandingPage(Model model){
		LOGGER.info("HomeController-showLandingPage");
		model.addAttribute("problem",new Problem());
		model.addAttribute("concernOptions",homeService.getConcernsForProblems());
		return "home";
	}
	
}
