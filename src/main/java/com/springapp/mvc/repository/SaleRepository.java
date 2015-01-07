package com.springapp.mvc.repository;

import com.springapp.mvc.model.Sale;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("saleRepository")
public interface SaleRepository extends JpaRepository<Sale, Long> {
}
