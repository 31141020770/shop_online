package com.shoponline.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoponline.constant.SystemConstant;
import com.shoponline.converter.CardConverter;
import com.shoponline.dto.CardDTO;
import com.shoponline.entity.CardEntity;
import com.shoponline.entity.ItemEntity;
import com.shoponline.entity.OrderStatusEntity;
import com.shoponline.entity.UserEntity;
import com.shoponline.repository.CardRepository;
import com.shoponline.repository.ItemRepository;
import com.shoponline.repository.OrderStatusRepository;
import com.shoponline.repository.UserRepository;
import com.shoponline.service.ICardService;

@Service
public class CardService implements ICardService {
	@Autowired
	private ItemRepository itemRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private CardRepository cardRepository;
	@Autowired
	private CardConverter cardConverter;

	@Autowired
	private OrderStatusRepository orderStatusRepository;

	@Override
	@Transactional
	public void save(long id, String user) {
		ItemEntity itemEntity = new ItemEntity();
		itemEntity = itemRepository.findOne(id);
		UserEntity userEntity = new UserEntity();
		userEntity = userRepository.findOneByUserNameAndStatus(user, SystemConstant.ACTIVE_STATUS);
		OrderStatusEntity orderStatusEntity = new OrderStatusEntity();
		orderStatusEntity = orderStatusRepository.findOne((long) 1);
		if (userEntity.getCard().isEmpty() ) {
			CardEntity cardEntity = new CardEntity();
			cardEntity.setUser(userEntity);
			cardEntity.setOrderstatus(orderStatusEntity);
			cardEntity.setItem(itemEntity);
			cardEntity.setPrice(itemEntity.getPrice());
			cardEntity.setCount(1);
			cardRepository.save(cardEntity);
		} else {
			CardEntity card = new CardEntity();
			card = cardRepository.findByUserUserNameAndOrderstatusCodeAndItemId(userEntity.getUserName() ,orderStatusEntity.getCode(), itemEntity.getId());
			if(card == null) {
				CardEntity cardEntity = new CardEntity();
				cardEntity.setUser(userEntity);
				cardEntity.setOrderstatus(orderStatusEntity);
				cardEntity.setItem(itemEntity);
				cardEntity.setPrice(itemEntity.getPrice());
				cardEntity.setCount(1);
				cardRepository.save(cardEntity);
			}else {
				card.setCount(card.getCount() + 1);
				cardRepository.save(card);
			}
		}
	}

	@Override
	public List<CardDTO> findCardByUseNameAndOrderStatus(String userName, long orderStatus) {
		List<CardEntity> card = cardRepository.findByUserUserNameAndOrderstatusId(userName, 1);
		List<CardDTO> models = new ArrayList<CardDTO>();
		for(CardEntity item : card) {
			CardDTO cardDTO = new CardDTO();
			cardDTO = cardConverter.toDTO(item);
			models.add(cardDTO);
		}
		return models;
	}

}
