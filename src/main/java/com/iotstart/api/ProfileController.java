package com.iotstart.api;

import com.iotstart.repository.entity.UserEntity;
import com.iotstart.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Optional;

@Controller
@RequestMapping("/profile")
public class ProfileController {

    @Autowired
    private UserService userService;

    @GetMapping
    public String profilePage(Model model) {
        // For demo purposes, we'll use a hardcoded user ID
        // In a real application, you would get this from the session/authentication
        Integer userId = 1; // This should come from session/authentication
        
        Optional<UserEntity> userOpt = userService.findById(Long.valueOf(userId));
        if (userOpt.isPresent()) {
            model.addAttribute("user", userOpt.get());
        } else {
            // Create a demo user if not exists
            UserEntity demoUser = new UserEntity();
            demoUser.setUserId(userId);
            demoUser.setFullName("Demo User");
            demoUser.setEmail("demo@example.com");
            demoUser.setPhone("");
            demoUser.setImagePath("");
            demoUser.setRoleId(2);
            model.addAttribute("user", demoUser);
        }
        
        return "profile";
    }

    @PostMapping("/update")
    public String updateProfile(
            @RequestParam("fullName") String fullName,
            @RequestParam("phone") String phone,
            @RequestParam("email") String email,
            @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
            RedirectAttributes redirectAttributes) {
        
        try {
            // For demo purposes, we'll use a hardcoded user ID
            Integer userId = 1; // This should come from session/authentication
            
            userService.updateProfile(userId, fullName, phone, email, imageFile);
            redirectAttributes.addFlashAttribute("successMessage", "Profile updated successfully!");
            
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error updating profile: " + e.getMessage());
        }
        
        return "redirect:/profile";
    }
}
