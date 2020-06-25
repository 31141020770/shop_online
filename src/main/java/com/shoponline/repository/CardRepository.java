package com.shoponline.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shoponline.entity.CardEntity;

public interface CardRepository extends JpaRepository<CardEntity, Long>{
	CardEntity findByUserUserNameAndOrderstatusCodeAndItemId(String userName, String orderStatusName, long itemId);
	CardEntity findByItemId(long itemId);
	List<CardEntity> findByUserUserNameAndOrderstatusId(String userName, long orderStatusId);
}
