package com.ryuland.repository;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ryuland.entity.TransactionEntity;

public interface IOrderRepository extends JpaRepository<TransactionEntity, Long>{
	
	@Query(value = "SELECT * FROM transaction WHERE user_id = :userid ORDER BY createddate DESC;", 
			  nativeQuery = true)
	List<TransactionEntity> findAllByUserId(@Param("userid") Long userId);
	
	
}
