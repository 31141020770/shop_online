package com.shoponline.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shoponline.entity.ItemEntity;

public interface ItemRepository extends JpaRepository<ItemEntity, Long>{
	List<ItemEntity> findByCategoryCode(String code);
}
