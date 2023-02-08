package com.web.list.redis.model;

import java.io.Serializable;

public class CartItemVO implements Serializable {

	private static final long serialVersionUID = 1385878795026939078L;

	private Integer prodID; // 商品ID
	private Integer count; // 數量
	private String prodName; // 商品名稱
	private Integer price; // 價錢

	public CartItemVO() {

	}

	public CartItemVO(Integer prodID, Integer count, String prodName, Integer price) {
		super();
		this.prodID = prodID;
		this.count = count;
		this.prodName = prodName;
		this.price = price;
	}

	public Integer getProdID() {
		return prodID;
	}

	public void setProdID(Integer prodID) {
		this.prodID = prodID;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "CartItemVO [prodID=" + prodID + ", count=" + count + ", prodName=" + prodName + ", price=" + price
				+ "]";
	}

}
