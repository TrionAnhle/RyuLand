package com.ryuland.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ryuland.entity.RoleEntity;

public interface IRoleRepository extends JpaRepository<RoleEntity, Long>{

}
