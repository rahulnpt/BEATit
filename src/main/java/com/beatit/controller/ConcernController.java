package com.beatit.controller;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.beatit.dto.Concern;
import com.beatit.dto.User;
import com.beatit.repository.UserRepository;
import com.beatit.service.ConcernService;
import com.beatit.service.UserDetailsImpl;

@Controller
public class ConcernController {

	@Autowired
	private ConcernService concernService;
	
	@Autowired
	private UserRepository userRepository;
	
	@GetMapping("/concern")
	public ModelAndView showConcernPage(HttpServletRequest request,ModelAndView modelAndView) {
		modelAndView.setViewName("concern");
		modelAndView.addObject("concerns",concernService.getConcernList());
		return modelAndView;
	}
	
	@PostMapping(value="/concern")
	public void submitUserConcerns(@RequestParam("concernLst[]") List<String> concernList,
			HttpServletRequest request,ModelAndView modelAndView){
		
		Set<Concern> proxyConcernSet = concernService.getProxyConcernSet(concernList);
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserDetailsImpl userDetails = (UserDetailsImpl)authentication.getPrincipal();
		User user = userDetails.getUser();
		user.setConcerns(proxyConcernSet);
		userRepository.save(user);
	}
	
}
