package com.matthew.bugtracker.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.matthew.bugtracker.models.Bug;
import com.matthew.bugtracker.models.LoginUser;
import com.matthew.bugtracker.models.User;
import com.matthew.bugtracker.services.BugService;
import com.matthew.bugtracker.services.UserService;

@Controller
public class MainController {

	// ===== DEPENDENCY INJECTION =====
	@Autowired
	private UserService userServ;
	@Autowired
	private BugService bugServ;

	// ***************** USER SECTION *****************

	// ======== CREATE ========
	@GetMapping("/login")
	public String indexLogin(Model model) {
//		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "login.jsp";
	}

	@GetMapping("/register")
	public String indexRegister(Model model) {
		model.addAttribute("newUser", new User());
//		model.addAttribute("newLogin", new LoginUser());
		return "register.jsp";
	}

	// Register Method
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model,
			HttpSession session) {
		userServ.register(newUser, result);
		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "register.jsp";
		}
		session.setAttribute("user_id", newUser.getId());
		return "redirect:/dashboard";
	}

	// Login Method
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model,
			HttpSession session) {
		User user = userServ.login(newLogin, result);
		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "login.jsp";
		}
		session.setAttribute("user_id", user.getId());
		// gets the username and stores it in a variable
		session.setAttribute("user_name", user.getFirstName());
		return "redirect:/dashboard";
	}

	// ======== SUCCESS ROUTE ========
	@GetMapping("/dashboard")
	public String home(HttpSession sesh, Model model) {
		Long userID = (Long) sesh.getAttribute("user_id");
		if (userID == null) {
			return "redirect:/";
		} else {
			List<Bug> bugs = bugServ.allBugs();
			model.addAttribute("bugs", bugs);
			User thisUser = userServ.oneUser(userID);
			model.addAttribute("userName", thisUser.getFirstName());
			return "/bugs/dashboard.jsp";
		}
	}
	
	// ************* Not sure about this 
	// ======== READ ONE ========
	@GetMapping("/users/{userId}")
	public String showUser(@PathVariable("userId") Long id, Model model) {
		User employee = userServ.oneUser(id);
		model.addAttribute("employee", employee);
		return "/bugs/dashboard.jsp";
	}
	// ************* Not sure about this ^^^^

	@GetMapping("/logout")
	public String logout(HttpSession sesh) {
		sesh.invalidate();
		return "redirect:/login";
	}

	// ***************** BUG SECTION *****************

	// ======== CREATE ========
	// Renders new page
	@GetMapping("/bugs/new")
	public String newBug(@ModelAttribute("bug") Bug bug, HttpSession sesh, Model model) {
		Long userId = (Long) sesh.getAttribute("user_id");
		List<User> users = userServ.allUsers();
		model.addAttribute("users", users);
		if (sesh.getAttribute("user_id") != null) {
			model.addAttribute("user_id", userId);
			return "/bugs/newBug.jsp";
		} else {
			return "redirect:/dashboard";
		}
	}

	// Create Method
	@PostMapping("/bugs/new")
	public String createBug(@Valid @ModelAttribute("bug") Bug bug, BindingResult result, HttpSession sesh, Model model) {
		Long userId = (Long) sesh.getAttribute("user_id");
		if (result.hasErrors()) {
			List<User> users = userServ.allUsers();
			model.addAttribute("users", users);
			return "/bugs/newBug.jsp";
		} else {
			bugServ.createBug(bug);
			return "redirect:/dashboard";
		}
	}

	
	// ======== SHOW ONE ========
	@GetMapping("/bugs/{bugId}")
	public String showBug(@PathVariable("bugId") Long id, Model model, HttpSession sesh) {
		Long userId = (Long) sesh.getAttribute("user_id");
		User currentUser = userServ.oneUser(userId);
		Bug bug = bugServ.findBug(id);
		if(userId == null) {
			return "redirect:/login";
		} else if(bug == null) {
			return "redirect:/dashboard";
		} else {
			model.addAttribute("user", currentUser);
			model.addAttribute("bug", bug);
			return "/bugs/showBug.jsp";
		}
	}
	
	// ======== UPDATE ========
    // Edit Method
	@GetMapping("/bugs/{id}/edit")
	public String editBug(@PathVariable("id") Long id, Model model, HttpSession sesh) {
		Long userId = (Long) sesh.getAttribute("user_id");
		List<User> users = userServ.allUsers();
		model.addAttribute("users", users);
		if(id == null) {
			return "redirect:/dashboard";
		} else {
			Bug bug = bugServ.findBug(id);
			Long creatorId = bug.getUser().getId();
			model.addAttribute("bug", bug);
			return "/bugs/editBug.jsp";
		}
	}
	
	// Update Method
	@PutMapping("/bugs/{id}/edit")
	public String updateBug(@Valid @ModelAttribute("bug") Bug bug, BindingResult result, HttpSession sesh, Model model) {
		if(result.hasErrors()) {
			List<User> users = userServ.allUsers();
			model.addAttribute("users", users);
			return "/bugs/editBug.jsp";
		} else {
			bugServ.updateBug(bug);
			return "redirect:/dashboard";
		}
	}
	
	
	// ======== DELETE ========
	@DeleteMapping("/bugs/{id}")
	public String destroy(@PathVariable("id") Long id) {
		bugServ.destroyBug(id);
		return "redirect:/dashboard";
	}
}
