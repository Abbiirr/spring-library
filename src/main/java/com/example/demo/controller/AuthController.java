package com.example.demo.controller;

import com.example.demo.model.User;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.demo.enums.Role;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

  @Autowired
  private UserService userService;



  @PostMapping("/register")
  public ResponseEntity<String> registerUser(@RequestBody User user) {

    // Check if the email is already registered
    if (userService.existsByUsername(user.getUsername())) {
      return ResponseEntity.status(HttpStatus.CONFLICT).body("Username already exists");
    }

    // Set user role to student if not specified
    if (user.getRole() == null) {
      user.setRole(Role.Student);
    }

    // Set user status to active
    user.setStatus("online");

    // Save the user to the database
    userService.saveUser(user);

    return ResponseEntity.status(HttpStatus.CREATED).body("User registered successfully");
  }
}
