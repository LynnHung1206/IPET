package com.web.order.model.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

@Entity
@IdClass(OrderDetailPK.class)
@Table(name = "order_detail", catalog = "ipetdb")
public class OrderDetail {
	
	@Id
	@Column(name = "order_id")
	private Integer orderID;
	@Id
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
}

class OrderDetailPK implements Serializable{

	private static final long serialVersionUID = 1L;
	
	protected Integer orderID;
	protected Integer prodID;

	public OrderDetailPK() {

	}
	
	public OrderDetailPK(Integer orderID, Integer prodID) {
		this.orderID = orderID;
		this.prodID = prodID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(orderID, prodID);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderDetailPK other = (OrderDetailPK) obj;
		return Objects.equals(orderID, other.orderID) && Objects.equals(prodID, other.prodID);
	}
	
}
