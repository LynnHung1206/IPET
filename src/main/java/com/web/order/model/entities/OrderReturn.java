package com.web.order.model.entities;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "order_return" , catalog = "ipetdb")
public class OrderReturn {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	@Column(name = "return_id")
	private Integer returnID;
	@Column(name = "order_id")
	private Integer orderID;
	@Column(name = "return_apply_date")
	private Date returnApplyDate;
	@Column(name = "return_status")
	private Integer returnStatus;
	
	public OrderReturn() {
		
	}
	public Integer getReturnID() {
		return returnID;
	}
	public void setReturnID(Integer returnID) {
		this.returnID = returnID;
	}
	public Integer getOrderID() {
		return orderID;
	}
	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}
	public Date getReturnApplyDate() {
		return returnApplyDate;
	}
	public void setReturnApplyDate(Date returnApplyDate) {
		this.returnApplyDate = returnApplyDate;
	}
	public Integer getReturnStatus() {
		return returnStatus;
	}
	public void setReturnStatus(Integer returnStatus) {
		this.returnStatus = returnStatus;
	}
	
	
}
