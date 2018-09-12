package com.beatit.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beatit.dto.Concern;
import com.beatit.repository.ConcernRepository;

@Service
public class ConcernService {

	@Autowired
	private ConcernRepository concernRepository;
	
	public List<Concern> getConcernList(){
		return concernRepository.findAll();
	}
	
	public Set<Concern> getProxyConcernSet(List<String> concernList){
		Set<Concern> concern = new HashSet<>();
		for(String concernId:concernList){
				Concern concernObj = concernRepository.getOne(Integer.parseInt(concernId));
				concern.add(concernObj);
		}
		return concern;
	}
	
}
