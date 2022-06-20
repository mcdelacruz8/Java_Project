package com.matthew.bugtracker.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.matthew.bugtracker.models.Bug;

@Repository
public interface BugRepository extends CrudRepository<Bug, Long> {
	List<Bug> findAll();
}
