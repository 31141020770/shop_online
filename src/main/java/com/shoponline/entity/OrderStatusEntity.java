package com.shoponline.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "orderstatus")
public class OrderStatusEntity extends BaseEntity{
	@Column(name = "name")
	private String name;
	@Column(name = "code")
	private String code;
	@Column(name = "status")
	private String status;

	

	public String getName() {
		return name;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}	
}
