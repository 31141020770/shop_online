package com.shoponline.converter;

import org.springframework.stereotype.Component;

import com.shoponline.dto.ItemDTO;
import com.shoponline.entity.ItemEntity;
@Component
public class Itemconverter {
	public ItemDTO toDTO(ItemEntity entity) {
		ItemDTO result = new ItemDTO();
		result.setId(entity.getId());
		result.setName(entity.getName());
		result.setDescription(entity.getDescription());
		result.setPrice(entity.getPrice());
		result.setContent(entity.getContent());
		result.setCategoryCode(entity.getCategory().getCode());
		result.setUrlthumbnail(entity.getThumbnail());
		return result;
	}
	public ItemEntity toEntity(ItemDTO DTO) {
		ItemEntity result = new ItemEntity();
		result.setName(DTO.getName());
		result.setDescription(DTO.getDescription());
		result.setPrice(DTO.getPrice());
		result.setContent(DTO.getContent());
		result.setThumbnail(DTO.getUrlthumbnail());
		return result;
	}
	public ItemEntity toEntity(ItemEntity result, ItemDTO dto) {
		result.setName(dto.getName());
		result.setDescription(dto.getDescription());
		result.setPrice(dto.getPrice());
		result.setContent(dto.getContent());
		result.setThumbnail(dto.getUrlthumbnail());
		return result;
	}
}
