package com.beatit.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.beatit.dto.Concern;

@Repository
public interface ConcernRepository extends JpaRepository<Concern, Integer>{
	Concern findByName(String name);
}
