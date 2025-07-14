package com.demo.Product.Repository;

import com.demo.Product.Model.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ReviewRepo extends JpaRepository<Review, Long> {
    List<Review> findByCategoryAndRating(String category, int rating);
}
