package com.demo.Product.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.demo.Product.Model.LoginModel;

public interface ProductRepo extends JpaRepository<LoginModel,Integer> {

}
