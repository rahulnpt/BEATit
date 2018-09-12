package com.beatit.service;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beatit.dto.Concern;
import com.beatit.dto.Problem;
import com.beatit.repository.ConcernRepository;
import com.beatit.repository.ProblemRepository;
import com.beatit.repository.UserRepository;

@Service()
public class ProblemService {

	@Autowired
	private ConcernRepository concernRepository; 
	
	@Autowired
	private ProblemRepository problemRepository;
	
	public void saveProblem(Problem problem){
		String[] concernOptions = problem.getConcernOptions();
		Set<Concern> concernSet = new HashSet<>();
		for(String name:concernOptions){
			concernSet.add(concernRepository.findByName(name));
		}
		problem.setConcerns(concernSet);
		problemRepository.save(problem);
	}
	
	/*public String getProblemDesc(){
		Optional<Problem> optional = problemRepository.findById(2);
		Problem problem = optional.get();
		return problem.getDescription();
	}*/
	
	public Problem getProblemById(int id) {
		return problemRepository.findById(id);
	}
	
}
