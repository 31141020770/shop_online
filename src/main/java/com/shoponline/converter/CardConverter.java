package com.shoponline.converter;

import org.springframework.stereotype.Component;

import com.shoponline.dto.CardDTO;
import com.shoponline.entity.CardEntity;
@Component
public class CardConverter {
	public CardDTO toDTO(CardEntity entity) {
		CardDTO result = new CardDTO();
		result.setId(entity.getId());
		result.setName(entity.getItem().getName());
		result.setPrice(entity.getPrice());
		result.setCount(entity.getCount());
		result.setTotal(entity.getCount()*entity.getPrice());
		result.setThumbnail(entity.getItem().getThumbnail());
		return result;
	}
	public CardEntity toEntity(CardDTO DTO) {
		CardEntity result = new CardEntity();
		return result;
	}
}
