package com.ryuland.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ryuland.entity.CategoryEntity;

public interface ICategoryRepository extends JpaRepository<CategoryEntity, Long>{

}
