package com.beatit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beatit.dto.User;
import com.beatit.service.UserService;

@Controller
public class LoginController {

	@Autowired
	private UserService userService;
	
	@Autowired
    protected AuthenticationManager authenticationManager;
	
	@GetMapping("/login")
	public String showLoginPage() {
		return "login";
	}
	
	@GetMapping("/register")
	public ModelAndView showRegistrationPage(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("register");
		modelAndView.addObject("user",new User());
		return modelAndView;
	}
	
	@PostMapping("/register")
	public ModelAndView registerNewUser(@Valid User user,BindingResult bindingResult,HttpServletRequest request,HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		User userObj = userService.findUserByEmail(user.getEmail());
		if(userObj != null){
			bindingResult.rejectValue("email", "error.user", "This email id is already registered.");
		}
		if(bindingResult.hasErrors()){
			modelAndView.setViewName("register");
			return modelAndView;
		}else{
			String unEncodedPwd = user.getPassword();
			userService.saveUser(user);
			modelAndView.setViewName("redirect:/concern");
			authWithAuthManager(request,user.getEmail(),unEncodedPwd);
		}
		return modelAndView;
	}
	
	public void authWithAuthManager(HttpServletRequest request, String email, String password) {
	    UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(email, password);
	    authToken.setDetails(new WebAuthenticationDetails(request));
	    Authentication authentication = authenticationManager.authenticate(authToken);
	    SecurityContextHolder.getContext().setAuthentication(authentication);
	}
	
}
