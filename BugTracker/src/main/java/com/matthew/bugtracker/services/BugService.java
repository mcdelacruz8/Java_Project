package com.matthew.bugtracker.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.matthew.bugtracker.models.Bug;
import com.matthew.bugtracker.repositories.BugRepository;

@Service
public class BugService {

	// ===== DEPENDENCY INJECTION =====
    @Autowired
    private BugRepository bugRepo;
    
    
    // ===== READ ALL =====
    public List<Bug> allBugs() {
    	return bugRepo.findAll();
    }
    
    
    // ===== READ ONE =====
    public Bug findBug(Long id) {
    	Optional<Bug> optBug = bugRepo.findById(id);
    	if(optBug.isPresent()) {
    		return optBug.get();
    	} else {
    		return null;
    	}
    }
    
    
    // ===== CREATE =====
    public Bug createBug(Bug bug) {
    	return bugRepo.save(bug);
    }
    
    
    // ===== UPDATE =====
    public Bug updateBug(Bug bug) {
    	return bugRepo.save(bug);
    }
    
    
    // ===== DELETE =====
    public void destroyBug(Long id) {
    	bugRepo.deleteById(id);
    }
}
