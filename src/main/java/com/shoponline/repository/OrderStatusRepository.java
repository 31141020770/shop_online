package com.shoponline.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shoponline.entity.OrderStatusEntity;

public interface OrderStatusRepository extends JpaRepository<OrderStatusEntity, Long>{
	
}
