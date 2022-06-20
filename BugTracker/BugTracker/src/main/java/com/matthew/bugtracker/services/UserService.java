package com.matthew.bugtracker.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.matthew.bugtracker.models.LoginUser;
import com.matthew.bugtracker.models.User;
import com.matthew.bugtracker.repositories.UserRepository;


@Service
public class UserService {

	// ===== DEPENDENCY INJECTION =====
    @Autowired
    private UserRepository userRepo;
    
    
    // ===== CREATE =====
    public User register(User newUser, BindingResult result) {
        if(userRepo.findByEmail(newUser.getEmail()).isPresent()) {
            result.rejectValue("email", "Unique", "INVALID ATTEMPT!");
        }
        if(!newUser.getPassword().equals(newUser.getConfirm())) {
            result.rejectValue("confirm", "Matches", "INVALID ATTEMPT!");
        }
        if(result.hasErrors()) {
            return null;
        } else {
            String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
            newUser.setPassword(hashed);
            return userRepo.save(newUser);
        }
    }
    
    
    // ===== VALIDATE USER =====
    public User login(LoginUser newLogin, BindingResult result) {
        if(result.hasErrors()) {
            return null;
        }
        Optional<User> potentialUser = userRepo.findByUserId(newLogin.getUserId());
        if(!potentialUser.isPresent()) {
            result.rejectValue("email", "Unique", "Unknown Login Info!");
            return null;
        }
        User user = potentialUser.get();
        if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
            result.rejectValue("password", "Matches", "Unknown Login Info!");
        }
        if(result.hasErrors()) {
            return null;
        } else {
            return user;
        }
    }
    
    
    // ===== READ ONE =====
    public User oneUser(Long id) {
    	Optional<User> optUser = userRepo.findById(id);
    	if(optUser.isPresent()) {
    		return optUser.get();
    	} else {
    		return null;
    	}
    }
    
    
    // ===== READ ALL =====
    public List<User> allUsers() {
    	return userRepo.findAll();
    }
    
}
