package com.ryuland.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ryuland.entity.ItemCart;
import com.ryuland.entity.UserProductId;

public interface ICartRepository extends JpaRepository<ItemCart, UserProductId>{

}
