package com.example.demo.service;

import com.example.demo.model.User;
import com.example.demo.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Optional;

@Service
public class UserService {


    private UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void register(User user) throws Exception {
        if (userRepository.findByUsername(user.getEmail()) != null) {
            throw new Exception("Email already in use");
        }
        // Set default values for createdAt, updatedAt, accessToken, and status
        user.setCreatedAt(LocalDateTime.now());
        user.setUpdatedAt(LocalDateTime.now());
        user.setAccessToken("");
        user.setStatus("active");
        userRepository.save(user);
    }

    public boolean existsByUsername(String username) {
        return userRepository.existsByUsername(username);
    }

    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }



    public void saveUser(User user) {
    LocalDateTime now = LocalDateTime.now();
    user.setCreatedAt(now);
    user.setUpdatedAt(now);
    userRepository.save(user);
}

    public void updateUser(User existingUser) {
    LocalDateTime now = LocalDateTime.now();
    existingUser.setUpdatedAt(now);
    userRepository.save(existingUser);

    }
}

