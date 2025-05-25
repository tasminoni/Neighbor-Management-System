package com.example.nms_backend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WebController {
    
    @GetMapping("/")
    public String index() {
        return "redirect:/login.html";
    }
    
    @GetMapping("/login")
    public String login() {
        return "redirect:/login.html";
    }
    
    @GetMapping("/signup")
    public String signup() {
        return "redirect:/signup.html";
    }
} 