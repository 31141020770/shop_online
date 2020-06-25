package com.shoponline.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.shoponline.dto.ItemDTO;

public interface IItemService {
	List<ItemDTO> findAll(Pageable pageable);

	List<ItemDTO> findAllItem();
	
	List<ItemDTO> findItemByCode(String code);

	Integer getTotalItem();

	ItemDTO findbyId(long id);

	void save(ItemDTO dto);

	ItemDTO getcontenById();
}
