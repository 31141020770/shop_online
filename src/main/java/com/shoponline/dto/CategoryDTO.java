package com.shoponline.dto;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class CategoryDTO extends AbstractDTO<CategoryDTO> implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1025206351394019440L;
	private String name;
	private String code;
	private List<MultipartFile> thumbnail;
	private String urlthumbnail;
	
	public String getName() {
		return name;
	}
	public String getUrlthumbnail() {
		return urlthumbnail;
	}
	public void setUrlthumbnail(String urlthumbnail) {
		this.urlthumbnail = urlthumbnail;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public List<MultipartFile> getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(List<MultipartFile> thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getUrlThumbnail() {
		return urlthumbnail;
	}
	public void setUrlThumbnail(String urlThumbnail) {
		urlthumbnail = urlThumbnail;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	
}
