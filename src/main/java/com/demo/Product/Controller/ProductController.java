package com.demo.Product.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.demo.Product.Repository.ProductRepo;
import com.demo.Product.Repository.ReviewRepo;

import java.util.List;
import com.demo.Product.Model.LoginModel;
import com.demo.Product.Model.Review;

//import java.util.*;

@Controller
public class ProductController {
    
    @Autowired
    ProductRepo repo;
    
    @Autowired
    ReviewRepo reviewRepo;

    @GetMapping("/")
    public String showLoginForm() {
        return "Login";
    }

    @GetMapping("/signupjsp")
    public String showSignup() {
        return "Signup";
    }

    @PostMapping("/login")
    public String checkUser(@RequestParam String name, @RequestParam String password) {
        if ("admin".equalsIgnoreCase(name) && "gce".equals(password)) {
            return "redirect:/admin";
        }

        boolean exists = repo.findAll().stream()
            .anyMatch(user -> user.getName().equals(name) && user.getPassword().equals(password));

        if (exists) {
            return "index";
        } else {
            return "Login";
        }
    }


    @PostMapping("/signup")
    public String createUser(@ModelAttribute LoginModel login) {
        repo.save(login);
        return "Login";
    }
    
    @GetMapping("/admin")
    public String showAdminForm(Model model) {
        model.addAttribute("review", new Review());
        return "admin";
    }

    @PostMapping("/admin/add")
    public String addReview(@ModelAttribute Review review) {
        reviewRepo.save(review);
        return "redirect:/admin"; // redirect to clear form or optionally show success
    }

    @PostMapping("/index")
    public String handleCategoryAndRating(
            @RequestParam String category,
            @RequestParam int rating,
            Model model
    ) {
        List<Review> reviews = reviewRepo.findByCategoryAndRating(category, rating);
        model.addAttribute("reviews", reviews);
        model.addAttribute("category", category);
        model.addAttribute("rating", rating);
        return "index";
    }

}
