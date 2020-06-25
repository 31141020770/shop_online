package com.shoponline.entity;



import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "card")
public class CardEntity extends BaseEntity{
	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "orderstatus_id")
	private OrderStatusEntity orderstatus;
	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "item_id")
	private ItemEntity item;
	@Column(name = "price")
	private int price;
	@Column(name = "count")
	private int count;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private UserEntity user;

	public OrderStatusEntity getOrderstatus() {
		return orderstatus;
	}

	public void setOrderstatus(OrderStatusEntity orderstatus) {
		this.orderstatus = orderstatus;
	}

	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
		this.user = user;
	}

	public ItemEntity getItem() {
		return item;
	}

	public void setItem(ItemEntity item) {
		this.item = item;
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
	
}
