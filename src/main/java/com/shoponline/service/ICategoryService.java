package com.shoponline.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.shoponline.dto.CategoryDTO;

public interface ICategoryService {
	Map<String, String> findAll();

	List<CategoryDTO> findAll(Pageable pageable);

	List<CategoryDTO> findAllList();
	

	Integer getTotalItem();

	CategoryDTO findbyId(long id);

	void save(CategoryDTO dto);

	CategoryDTO getcontenById();
}
