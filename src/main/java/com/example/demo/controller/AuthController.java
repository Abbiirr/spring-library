package com.example.demo.controller;

import com.example.demo.model.User;
import com.example.demo.service.UserService;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.demo.enums.Role;

import javax.crypto.spec.SecretKeySpec;
import java.security.Key;
import java.security.SecureRandom;
import java.util.Date;
import java.util.Optional;

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
      user.setRole(Role.Student.name());
    }

    // Set user status to active
    user.setStatus("online");

    // Save the user to the database
    userService.saveUser(user);

    return ResponseEntity.status(HttpStatus.CREATED).body("User registered successfully");
  }

  @PostMapping("/login")
public ResponseEntity<String> login(@RequestBody User user) {

  // Check if the user exists in the database
  User existingUser = userService.findByUsername(user.getUsername());

  if (existingUser == null) {
    return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Invalid username or password");
  }

  // Check if the user's password matches the hashed password in the database
  if (!BCrypt.checkpw(user.getPassword(), existingUser.getPassword())) {
    return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Invalid username or password");
  }

    // Convert the user's role to an Enum value
//  Role userRole = Role.valueOf((existingUser.getRole().toString()));

    SecureRandom random = new SecureRandom();
byte[] keyBytes = new byte[32];
random.nextBytes(keyBytes);
Key key = new SecretKeySpec(keyBytes, "HmacSHA256");

  // Generate a JWT token for the user
  String token = Jwts.builder()
    .claim("id", existingUser.getId())
    .claim("username", user.getUsername())
    .claim("role", existingUser.getRole())
    .signWith(SignatureAlgorithm.HS256, key)
    .setExpiration(new Date(System.currentTimeMillis() + 86400000)) // 24 hours
    .compact();

  // Update the user's access token and status to online
  existingUser.setAccessToken(token);
  existingUser.setStatus("online");
  userService.updateUser(existingUser);

  return ResponseEntity.status(HttpStatus.OK).body(token);
}


}
