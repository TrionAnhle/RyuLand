package com.ryuland.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ryuland.entity.ProductEntity;

public interface IProductRepository extends JpaRepository<ProductEntity, Long>{

	@Query(value = "SELECT * FROM product ORDER BY createddate DESC LIMIT 10", 
			  nativeQuery = true)
	List<ProductEntity> findListByTime();
	
	@Query(value = "SELECT * FROM product ORDER BY discount DESC LIMIT 10", 
			  nativeQuery = true)
	List<ProductEntity> findListByDiscount();
	
	
}
