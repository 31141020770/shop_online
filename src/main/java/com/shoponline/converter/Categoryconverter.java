package com.shoponline.converter;

import org.springframework.stereotype.Component;

import com.shoponline.dto.CategoryDTO;
import com.shoponline.entity.CategoryEntity;
@Component
public class Categoryconverter {
	public CategoryDTO toDTO(CategoryEntity entity) {
		CategoryDTO result = new CategoryDTO();
		result.setId(entity.getId());
		result.setName(entity.getName());
		result.setCode(entity.getCode());
		result.setUrlThumbnail(entity.getThumbnail());
		return result;
	}
	public CategoryEntity toEntity(CategoryDTO DTO) {
		CategoryEntity result = new CategoryEntity();
		result.setName(DTO.getName());
		result.setCode(DTO.getCode());
		result.setThumbnail(DTO.getUrlThumbnail());
		return result;
	}
	public CategoryEntity toEntity(CategoryEntity result, CategoryDTO dto) {
		result.setName(dto.getName());
		result.setCode(dto.getCode());
		result.setThumbnail(dto.getUrlThumbnail());
		return result;
	}
}
