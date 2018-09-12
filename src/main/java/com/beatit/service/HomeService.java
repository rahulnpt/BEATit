package com.beatit.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beatit.dto.Concern;
import com.beatit.repository.ConcernRepository;

@Service
public class HomeService {

	@Autowired
	private ConcernRepository concernRepository;
	
	@RequestMapping("/admin")
	public String[] getConcernsForProblems(){
		System.out.println("inside setConcernsForProblems");
		List<Concern> concernList = concernRepository.findAll();
		//Map<String,String> concernOptions = new LinkedHashMap<>();
		String [] concernOptions = new String[concernList.size()];
		int i=0;
		for(Concern concern:concernList){
			//concernOptions.put(Integer.toString(concern.getId()), concern.getName());
			concernOptions[i] = concern.getName();
			System.out.println("setting concerns here "+concern.getName());
			i++;
		}
		return concernOptions;
	}
	
	
}
