package com.ryuland.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ryuland.entity.CategoryEntity;

public interface ICategoryRepository extends JpaRepository<CategoryEntity, Long>{
	@Query(value = "SELECT * FROM category ORDER BY code LIMIT :offset , :limit", 
			  nativeQuery = true)
	List<CategoryEntity> findAllByPage(@Param("offset") Long offset, @Param("limit") Long limit);
}
