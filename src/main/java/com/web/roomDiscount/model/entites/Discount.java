package com.web.roomDiscount.model.entites;

import java.io.Serial;
import java.sql.Date;
import java.util.Objects;
import javax.persistence.*;
import com.core.model.entities.Core;

@Entity
@Table(name = "ROOM_DISCOUNT", catalog = "ipetdb")
public class Discount extends Core{
	@Serial
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "DISCOUNT_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer discountId;
	
	@Column (name = "DISCOUNT_NAME")
	private String discountName;
	
	@Column (name = " DISCOUNT_CONTENT")
	private String discountContent;
	
	@Column (name = "ROOM_DIS")
	private Integer roomDis;
	
	@Column (name = "START_TIME")
	private Date startTime;
	
	@Column (name = "END_TIME")
	private Date endTime;
	
	public Discount(Integer discountId, String discountName, String discountContent, Integer roomDis, Date startTime, Date endTime) {
		this.discountId=discountId;
		this.discountName=discountName;
		this.discountContent=discountContent;
		this.roomDis=roomDis;
		this.startTime=startTime;
		this.endTime=endTime;
	}
	public Discount(String discountName, String discountContent, Integer roomDis, Date startTime, Date endTime) {
		this.discountName=discountName;
		this.discountContent=discountContent;
		this.roomDis=roomDis;
		this.startTime=startTime;
		this.endTime=endTime;
	}
	
	public Discount() {}
	
	public Integer getDiscountId() {
		return discountId;
	}
	public void setDiscountId(Integer discountId) {
		this.discountId = discountId;
	}
	public String getDiscountName() {
		return discountName;
	}
	public void setDiscountName(String discountName) {
		this.discountName = discountName;
	}
	public String getDiscountContent() {
		return discountContent;
	}
	public void setDiscountContent(String discountContent) {
		this.discountContent = discountContent;
	}
	public Integer getRoomDis() {
		return roomDis;
	}
	public void setRoomDis(Integer roomDis) {
		this.roomDis = roomDis;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(discountId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Discount other = (Discount) obj;
		return Objects.equals(discountId, other.discountId);
	}
}
