package com.shoponline.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.shoponline.converter.Categoryconverter;
import com.shoponline.dto.CategoryDTO;
import com.shoponline.entity.CategoryEntity;
import com.shoponline.repository.CategoryRepository;
import com.shoponline.service.ICategoryService;
@Service
public class CategoryService implements ICategoryService{
	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	private Categoryconverter categoryConverter;
	@Override
	public Map<String, String> findAll() {
		Map<String, String> result = new HashMap<String, String>();
		List<CategoryEntity> entity = categoryRepository.findAll();
		for(CategoryEntity item: entity) {
			result.put(item.getCode(),item.getName());
		}
		return result;
	}
	@Override
	public List<CategoryDTO> findAllList() {
		List<CategoryEntity> categoryEntity = categoryRepository.findAll();
		List<CategoryDTO> dto = new ArrayList<CategoryDTO>();
		for(CategoryEntity item: categoryEntity) {
			CategoryDTO categoryDTO = categoryConverter.toDTO(item);
			dto.add(categoryDTO);
		}
		return dto;
	}
	@Override
	public List<CategoryDTO> findAll(Pageable pageable) {
		List<CategoryDTO> models = new ArrayList<>();
		List<CategoryEntity> entities = categoryRepository.findAll(pageable).getContent();
		for(CategoryEntity item : entities) {
			CategoryDTO itemDTO = categoryConverter.toDTO(item);
			models.add(itemDTO);
		}
		return models;
	}
	@Override
	public Integer getTotalItem() {
		return (int) categoryRepository.count();
	}
	@Override
	public CategoryDTO findbyId(long id) {
		CategoryEntity entity = categoryRepository.findOne(id);
		return categoryConverter.toDTO(entity);
	}
	@Override
	@Transactional
	public void save(CategoryDTO dto) {
		CategoryEntity itemEntity = new CategoryEntity();
		if(dto.getId() != null) {
			CategoryEntity oldItem = categoryRepository.findOne(dto.getId());
			itemEntity = categoryConverter.toEntity(oldItem, dto);
		} else {
			itemEntity = categoryConverter.toEntity(dto);
		}
		categoryRepository.save(itemEntity);
		
	}
	@Override
	public CategoryDTO getcontenById() {
		// TODO Auto-generated method stub
		return null;
	}


}
