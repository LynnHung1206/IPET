package com.web.order.model.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "order_master", catalog = "ipetdb")
public class OrderMaster  {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	@Column(name = "order_id")
	private Integer orderID;
	@Column(name = "mem_id")
	private Integer memID;
	@Column(name = "order_sum")
	private Integer orderSum;
	@Column(name = "order_date")
	private Date orderDate;
	@Column(name = "order_status")
	private Integer orderStatus;
	@Column(name = "order_rec_name")
	private String orderRecName;
	@Column(name = "order_rec_phone")
	private String orderRecPhone;
	@Column(name = "order_rec_address")
	private String orderRecAddress;
	
	public OrderMaster() {
		
	}
	public Integer getOrderID() {
		return orderID;
	}
	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}
	public Integer getMemID() {
		return memID;
	}
	public void setMemID(Integer memID) {
		this.memID = memID;
	}
	public Integer getOrderSum() {
		return orderSum;
	}
	public void setOrderSum(Integer orderSum) {
		this.orderSum = orderSum;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Integer getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getOrderRecName() {
		return orderRecName;
	}
	public void setOrderRecName(String orderRecName) {
		this.orderRecName = orderRecName;
	}
	public String getOrderRecPhone() {
		return orderRecPhone;
	}
	public void setOrderRecPhone(String orderRecPhone) {
		this.orderRecPhone = orderRecPhone;
	}
	public String getOrderRecAddress() {
		return orderRecAddress;
	}
	public void setOrderRecAddress(String orderRecAddress) {
		this.orderRecAddress = orderRecAddress;
	}
	
}
