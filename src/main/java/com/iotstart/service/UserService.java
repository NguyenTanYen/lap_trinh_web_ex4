package com.iotstart.service;

import com.iotstart.repository.entity.UserEntity;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

public interface UserService {
    UserEntity save(UserEntity user);
    Optional<UserEntity> findById(Long id);
    Optional<UserEntity> findByUsername(String username);
    List<UserEntity> findAll();
    UserEntity update(UserEntity user);
    UserEntity updateProfile(Integer userId, String fullName, String phone, String email, MultipartFile imageFile);
    void deleteById(Long id);
    boolean existsByUsername(String username);
    boolean existsByEmail(String email);
    String saveImageFile(MultipartFile imageFile, Integer userId);
}
