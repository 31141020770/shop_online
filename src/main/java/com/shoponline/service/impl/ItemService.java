package com.shoponline.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.shoponline.converter.Itemconverter;
import com.shoponline.dto.ItemDTO;
import com.shoponline.entity.CategoryEntity;
import com.shoponline.entity.ItemEntity;
import com.shoponline.repository.CategoryRepository;
import com.shoponline.repository.ItemRepository;
import com.shoponline.service.IItemService;
@Service
public class ItemService implements IItemService {
	@Autowired
	private ItemRepository itemRepository;
	@Autowired
	private Itemconverter itemConverter;
	@Autowired
	private CategoryRepository categoryEntity;
	@Override
	public List<ItemDTO> findAll(Pageable pageable) {
		List<ItemDTO> models = new ArrayList<>();
		List<ItemEntity> entities = itemRepository.findAll(pageable).getContent();
		for(ItemEntity item : entities) {
			ItemDTO itemDTO = itemConverter.toDTO(item);
					models.add(itemDTO);
		}
		return models;
	}
	@Override
	public Integer getTotalItem() {

		return (int) itemRepository.count();
	}
	@Override
	public ItemDTO findbyId(long id) {
		ItemEntity entity = itemRepository.findOne(id);
		return itemConverter.toDTO(entity);
	}
	@Override
	@Transactional
	public void save(ItemDTO dto){
		CategoryEntity category = categoryEntity.findOneByCode(dto.getCategoryCode());
		ItemEntity itemEntity = new ItemEntity();
		if(dto.getId() != null) {
			ItemEntity oldItem = itemRepository.findOne(dto.getId());
			oldItem.setCategory(category);
			itemEntity = itemConverter.toEntity(oldItem, dto);
		} else {
			itemEntity = itemConverter.toEntity(dto);
			itemEntity.setCategory(category);
		}
		itemRepository.save(itemEntity);
		/* return itemConverter.toDTO(itemRepository.save(itemEntity)); */
	}
	@Override
	public ItemDTO getcontenById() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<ItemDTO> findAllItem() {
		List<ItemDTO> models = new ArrayList<>();
		List<ItemEntity> itemEntity = itemRepository.findAll();
		for(ItemEntity item : itemEntity) {
			ItemDTO itemDTO = itemConverter.toDTO(item);
			models.add(itemDTO);
		}
		return models;
	}
	@Override
	public List<ItemDTO> findItemByCode(String code) {
		List<ItemDTO> models = new ArrayList<ItemDTO>();
		List<ItemEntity> itemEntity = itemRepository.findByCategoryCode(code);
		for(ItemEntity item : itemEntity) {	
			ItemDTO itemDTO = itemConverter.toDTO(item);
			models.add(itemDTO);
		}
		return models;
	}

}
