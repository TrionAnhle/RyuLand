package com.ryuland.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ryuland.entity.TransactionEntity;

public interface IOrderRepository extends JpaRepository<TransactionEntity, Long>{

}
