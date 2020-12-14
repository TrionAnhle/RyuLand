package com.ryuland.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ryuland.entity.TransactionDetailEntity;

public interface IOrderDetailRepository extends JpaRepository<TransactionDetailEntity, Long>{
	
	@Query("SELECT t FROM TransactionDetailEntity t WHERE t.transaction.id = :transactionid")
	List<TransactionDetailEntity> finAllById(@Param("transactionid") Long id);
}
