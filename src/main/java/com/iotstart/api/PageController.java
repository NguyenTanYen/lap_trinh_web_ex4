package com.iotstart.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {

    @GetMapping("/home")
    public String home() {
        return "home"; // -> /WEB-INF/jsp/home.jsp
    }

    @GetMapping("/login")
    public String login() {
        return "login"; // -> /WEB-INF/jsp/login.jsp
    }
}
