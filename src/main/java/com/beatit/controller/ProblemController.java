package com.beatit.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.beatit.dto.Problem;
import com.beatit.service.ProblemService;
import com.beatit.service.UserDetailsImpl;
import com.beatit.util.CommonUtil;

@Controller
public class ProblemController {

	@Autowired
	private ProblemService problemService;
	
	@Autowired
	private CommonUtil commonUtil;
	
	
	//return the blank Problem page
	@GetMapping("/ask")
	public String askProblem(Model model) {
		model.addAttribute("problem", new Problem());
		return "problem";
	} 
	
	@PostMapping("/problem/submit")
	public void getProblemDetails(@Valid @ModelAttribute("problem") Problem problem,
										BindingResult bindingResult,HttpServletResponse response){
		try {
			JSONObject resultJson = new JSONObject();
			resultJson.put("beanValidationFailed", false);
			if(bindingResult.hasErrors()){
				resultJson.put("beanValidationFailed", true);
				resultJson.put("view","home");
				resultJson = commonUtil.getFieldErrors(bindingResult,resultJson);
			}else{
				Authentication auth = SecurityContextHolder.getContext().getAuthentication();
				if( null != auth){
					UserDetailsImpl userDetailsImpl = (UserDetailsImpl) auth.getPrincipal();
					problem.setUser_id(userDetailsImpl.getUser().getUserId());
					problem.setUser_name(userDetailsImpl.getUser().getFirstName());
				}
				problemService.saveProblem(problem);
				resultJson.put("view","solution");
				resultJson.put("problemId", problem.getId());
			}
			response.getWriter().write(resultJson.toString());
		}
		catch (JSONException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("/problem/{id}")
	public ModelAndView getProblemById(@PathVariable("id") int problemId) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("problem", problemService.getProblemById(problemId));
		modelAndView.setViewName("solution");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if( null != auth){
			UserDetailsImpl userDetailsImpl = (UserDetailsImpl) auth.getPrincipal();
			modelAndView.addObject("user", userDetailsImpl.getUser());
		}
		return modelAndView;
	}
	
}
