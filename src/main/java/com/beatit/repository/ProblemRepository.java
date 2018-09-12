package com.beatit.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.beatit.dto.Problem;

@Repository
public interface ProblemRepository extends JpaRepository<Problem, Integer>{
	
	Problem findById(int id);
}
