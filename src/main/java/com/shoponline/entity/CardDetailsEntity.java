package com.shoponline.entity;

import javax.persistence.Column;

/*@Entity
@Table(name = "carddetails")*/
public class CardDetailsEntity extends BaseEntity {
	@Column(name ="name")
	private String name;
	@Column(name = "price")
	private int price;
	@Column(name = "count")
	private int count;
	/*
	 * @ManyToMany(mappedBy = "carddetails") private List<ItemEntity> item = new
	 * ArrayList<ItemEntity>();
	 * 
	 * @ManyToOne(fetch = FetchType.LAZY)
	 * 
	 * @JoinColumn(name = "card_carddetails_id") private CardEntity card;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	/*
	 * public List<ItemEntity> getItem() { return item; } public void
	 * setItem(List<ItemEntity> item) { this.item = item; } public CardEntity
	 * getCard() { return card; } public void setCard(CardEntity card) { this.card =
	 * card; }
	 */



}
