package com.ryuland.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ryuland.entity.ProductEntity;

public interface IProductRepository extends JpaRepository<ProductEntity, Long>{

}
