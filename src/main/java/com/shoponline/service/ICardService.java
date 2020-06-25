package com.shoponline.service;

import java.util.List;

import com.shoponline.dto.CardDTO;

public interface ICardService {
	void save(long id, String user);
	List<CardDTO> findCardByUseNameAndOrderStatus(String userName, long orderStatus);
	
}
