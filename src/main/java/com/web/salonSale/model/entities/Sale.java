package com.web.salonSale.model.entities;

import java.io.Serial;
import java.sql.Timestamp;
import java.util.Objects;
import javax.persistence.*;
import com.core.model.entities.Core;

@Entity
@Table(name = "SALON_SALE", catalog = "ipetdb")
public class Sale extends Core{
	@Serial
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "SALE_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer saleId;
	
	@Column(name = "SALE_NAME")
	private String saleName;
	
	@Column(name = "SALE_CONTENT")
	private String salContent;
	
	@Column(name = "START_TIME")
	private Timestamp startTime;
	
	@Column(name = "END_TIME")
	private Timestamp endTime;
	
	@Transient
	private String saleStatus;
	
	@Transient
	private SaleDetail[] saleDetails;
	
	public Sale(Integer saleId, String saleName, String salContent, Timestamp startTime, Timestamp endTime) {
		this.saleId = saleId;
		this.saleName = saleName;
		this.salContent = salContent;
		this.startTime = startTime;
		this.endTime = endTime;
	}
	
	public Sale(String saleName, String salContent, Timestamp startTime, Timestamp endTime) {
		this.saleName = saleName;
		this.salContent = salContent;
		this.startTime = startTime;
		this.endTime = endTime;
	}
	
	public Sale() {}
	
	public Integer getSaleId() {
		return saleId;
	}
	public void setSaleId(Integer saleId) {
		this.saleId = saleId;
	}
	public String getSaleName() {
		return saleName;
	}
	public void setSaleName(String saleName) {
		this.saleName = saleName;
	}
	public String getSalContent() {
		return salContent;
	}
	public void setSalContent(String salContent) {
		this.salContent = salContent;
	}
	public Timestamp getStartTime() {
		return startTime;
	}
	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}
	public Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	
	public String getSaleStatus() {
		return saleStatus;
	}

	public void setSaleStatus(String saleStatus) {
		this.saleStatus = saleStatus;
	}

	public SaleDetail[] getSaleDetails() {
		return saleDetails;
	}

	public void setSaleDetails(SaleDetail[] saleDetails) {
		this.saleDetails = saleDetails;
	}

	@Override
	public int hashCode() {
		return Objects.hash(saleId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Sale other = (Sale) obj;
		return Objects.equals(saleId, other.saleId);
	}
	
}
