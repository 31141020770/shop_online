package com.shoponline.dto;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ItemDTO extends AbstractDTO<ItemDTO> implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1025206351394019440L;
	private String name;
	private int price;
	private String description;
	private String content;
	private Long categoryId;
	private String categoryCode;
	private List<MultipartFile> thumbnail;
	private String urlthumbnail;
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public List<MultipartFile> getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(List<MultipartFile> thumbnail) {
		this.thumbnail = thumbnail;
	}
	public Long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}
	public String getUrlthumbnail() {
		return urlthumbnail;
	}
	public void setUrlthumbnail(String urlthumbnail) {
		this.urlthumbnail = urlthumbnail;
	}

	
	
}
