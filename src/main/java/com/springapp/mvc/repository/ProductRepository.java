package com.springapp.mvc.repository;

import com.springapp.mvc.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("productRepository")
public interface ProductRepository extends JpaRepository<Product, Long> {
    Product findByName(String name);
//    List<Sale> sales findByProduct(Product product);
}
