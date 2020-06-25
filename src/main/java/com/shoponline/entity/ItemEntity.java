package com.shoponline.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "item")
public class ItemEntity extends BaseEntity {
	@Column(name = "name")
	private String name;
	@Column(name = "price")
	private int price;
	@Column(name ="thumbnail")
	private String thumbnail;
	@Column(name ="description", columnDefinition = "TEXT")
	private String description;
	@Column(name = "content", columnDefinition = "TEXT")
	private String content;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "category_id")
	private CategoryEntity category;

	/*
	 * @ManyToMany(fetch = FetchType.LAZY)
	 * 
	 * @JoinTable(name = "item_carddetails", joinColumns = @JoinColumn(name =
	 * "itemid"), inverseJoinColumns = @JoinColumn(name = "carddetailsid")) private
	 * List<CardDetailsEntity> carddetails = new ArrayList<CardDetailsEntity>();
	 */
	
	
	/*
	 * public List<CardDetailsEntity> getCarddetails() { return carddetails; }
	 * public void setCarddetails(List<CardDetailsEntity> carddetails) {
	 * this.carddetails = carddetails; }
	 */
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
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public CategoryEntity getCategory() {
		return category;
	}
	public void setCategory(CategoryEntity category) {
		this.category = category;
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
	
}
