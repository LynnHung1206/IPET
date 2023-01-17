package com.web.order.model.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "order_detail", catalog = "ipetdb")
public class OrderDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	@Column(name = "order_id")
	private Integer orderID;
	@Column(name = "prod_id")
	private Integer prodID;
	@Column(name = "detail_quantity")
	private Integer detailQuantity;
	@Column(name = "detail_price")
	private Integer detailPrice;
	
	public Integer getOrderID() {
		return orderID;
	}

	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}

	public Integer getProdID() {
		return prodID;
	}

	public void setProdID(Integer prodID) {
		this.prodID = prodID;
	}

	public Integer getDetailQuantity() {
		return detailQuantity;
	}

	public void setDetailQuantity(Integer detailQuantity) {
		this.detailQuantity = detailQuantity;
	}

	public Integer getDetailPrice() {
		return detailPrice;
	}

	public void setDetailPrice(Integer detailPrice) {
		this.detailPrice = detailPrice;
	}

	public OrderDetail() {
		
	}
	
	
	
	
}
