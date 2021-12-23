package com.matthew.bugtracker.models;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class LoginUser {

	// ----- MEMBER VARIABLES -----
    @NotEmpty(message="UserID is required!")
    @Size(min=4, max=100)
    @Pattern(regexp="^[A-Za-z]*$",message = "Invalid Input")
    private String userId;
    
    @NotEmpty(message="Password is required!")
    @Size(min=8, max=128, message="Password must be between 8 and 128 characters")
    private String password;
    
    // ----- CONSTRUCTOR -----
    public LoginUser() {}

    // ----- GETTERS & SETTERS -----
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
}
