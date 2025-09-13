package com.AISolution.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DatabaseTestController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/test-db")
    public String testDatabase(Model model) {
        try {
            // Test database connection
            String result = jdbcTemplate.queryForObject("SELECT 'Database connection successful!' as message", String.class);
            model.addAttribute("message", result);
            model.addAttribute("status", "success");
            
            // Test if users table exists and get count
            try {
                Integer userCount = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM users", Integer.class);
                model.addAttribute("userCount", userCount);
            } catch (Exception e) {
                model.addAttribute("userCount", "Users table not found: " + e.getMessage());
            }
            
        } catch (Exception e) {
            model.addAttribute("message", "Database connection failed: " + e.getMessage());
            model.addAttribute("status", "error");
        }
        
        return "test-db";
    }
}
