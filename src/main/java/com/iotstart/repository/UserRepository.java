package com.iotstart.repository;

import com.iotstart.repository.entity.UserEntity;
import java.util.List;
import java.util.Optional;

public interface UserRepository {
    UserEntity save(UserEntity user);
    Optional<UserEntity> findById(Long id);
    Optional<UserEntity> findByUsername(String username);
    List<UserEntity> findAll();
    UserEntity update(UserEntity user);
    void deleteById(Long id);
    boolean existsByUsername(String username);
    boolean existsByEmail(String email);
}
