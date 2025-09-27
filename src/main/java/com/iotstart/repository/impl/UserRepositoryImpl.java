package com.iotstart.repository.impl;

import com.iotstart.repository.UserRepository;
import com.iotstart.repository.entity.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Optional;

@Repository
public class UserRepositoryImpl implements UserRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private final RowMapper<UserEntity> userRowMapper = new RowMapper<UserEntity>() {
        @Override
        public UserEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
            UserEntity user = new UserEntity();
            user.setUserId(rs.getInt("user_id"));
            user.setFullName(rs.getString("full_name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setRoleId(rs.getInt("role_id"));
            user.setPhone(rs.getString("phone"));
            user.setImagePath(rs.getString("image_path"));
            return user;
        }
    };

    @Override
    public UserEntity save(UserEntity user) {
        String sql = "INSERT INTO users (full_name, email, password, role_id, phone, image_path) " +
                    "VALUES (?, ?, ?, ?, ?, ?)";
        
        KeyHolder keyHolder = new GeneratedKeyHolder();
        
        jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setInt(4, user.getRoleId());
            ps.setString(5, user.getPhone());
            ps.setString(6, user.getImagePath());
            return ps;
        }, keyHolder);
        
        user.setUserId(keyHolder.getKey().intValue());
        return user;
    }

    @Override
    public Optional<UserEntity> findById(Long id) {
        String sql = "SELECT * FROM users WHERE user_id = ?";
        List<UserEntity> users = jdbcTemplate.query(sql, userRowMapper, id);
        return users.isEmpty() ? Optional.empty() : Optional.of(users.get(0));
    }

    @Override
    public Optional<UserEntity> findByUsername(String username) {
        String sql = "SELECT * FROM users WHERE email = ?";
        List<UserEntity> users = jdbcTemplate.query(sql, userRowMapper, username);
        return users.isEmpty() ? Optional.empty() : Optional.of(users.get(0));
    }

    @Override
    public List<UserEntity> findAll() {
        String sql = "SELECT * FROM users ORDER BY user_id DESC";
        return jdbcTemplate.query(sql, userRowMapper);
    }

    @Override
    public UserEntity update(UserEntity user) {
        String sql = "UPDATE users SET full_name = ?, email = ?, password = ?, role_id = ?, " +
                    "phone = ?, image_path = ? WHERE user_id = ?";
        
        jdbcTemplate.update(sql, 
            user.getFullName(), 
            user.getEmail(),
            user.getPassword(), 
            user.getRoleId(),
            user.getPhone(),
            user.getImagePath(), 
            user.getUserId());
        
        return user;
    }

    @Override
    public void deleteById(Long id) {
        String sql = "DELETE FROM users WHERE user_id = ?";
        jdbcTemplate.update(sql, id);
    }

    @Override
    public boolean existsByUsername(String username) {
        String sql = "SELECT COUNT(*) FROM users WHERE email = ?";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, username);
        return count != null && count > 0;
    }

    @Override
    public boolean existsByEmail(String email) {
        String sql = "SELECT COUNT(*) FROM users WHERE email = ?";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, email);
        return count != null && count > 0;
    }
}
