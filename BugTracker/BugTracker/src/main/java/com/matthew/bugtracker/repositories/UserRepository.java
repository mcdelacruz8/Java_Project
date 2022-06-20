package com.matthew.bugtracker.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.matthew.bugtracker.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {	
	Optional<User> findByEmail(String email);
	Optional<User> findByUserId(String userId);
	List<User> findAll();
}
