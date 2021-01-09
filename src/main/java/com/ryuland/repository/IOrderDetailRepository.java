package com.ryuland.repository;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ryuland.entity.TransactionDetailEntity;

public interface IOrderDetailRepository extends JpaRepository<TransactionDetailEntity, Long>{
	
	@Query("SELECT t FROM TransactionDetailEntity t WHERE t.transaction.id = :transactionid")
	List<TransactionDetailEntity> finAllById(@Param("transactionid") Long id);
	
	@Query(value = "select product_id from transactiondetail group by product_id order by count(quantity) desc", 
			  nativeQuery = true)
	List<BigInteger> findProductIdByMostBuy();
}
