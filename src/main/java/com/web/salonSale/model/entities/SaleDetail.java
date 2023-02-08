package com.web.salonSale.model.entities;

import java.io.Serial;
import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.core.model.entities.Core;

@Entity
@IdClass(SaleDetail.PK.class)
@Table(name = "SALON_SALE_DETAIL", catalog = "ipetdb")
public class SaleDetail extends Core{
	@Serial
	private static final long serialVersionUID = 1L;
	
	public static class PK implements Serializable{
		@Serial
		private static final long serialVersionUID = 1L;
		
		@Id
		@Column(name = "SALE_ID")
		public Integer saleId;
		
		@Id
		@Column(name = "SVC_ID")
		public Integer svcId;
		
		@Override
		public int hashCode() {
			return Objects.hash(saleId, svcId);
		}
		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			PK other = (PK) obj;
			return Objects.equals(saleId, other.saleId) && Objects.equals(svcId, other.svcId);
		}
	}
	
	@Id
	@Column(name = "SALE_ID")
	private Integer saleId;
	
	@Id
	@Column(name = "SVC_ID")
	private Integer svcId;

	@Column(name = "SALE_PRICE")
	private Integer salePrice;
	
	@Transient
	private String saleStatus;
	
	@Transient
	private String svcName;
	
	@Transient
	private String catName;
	
	@Transient
    private String typeName;
	
	@Transient
	private Integer svcPrice;
	
	public SaleDetail(Integer saleId, Integer svcId, Integer salePrice) {
		this.saleId = saleId;
		this.svcId = svcId;
		this.salePrice = salePrice;
	}
	
	public SaleDetail() {}

	public Integer getSaleId() {
		return saleId;
	}

	public void setSaleId(Integer saleId) {
		this.saleId = saleId;
	}

	public Integer getSvcId() {
		return svcId;
	}

	public void setSvcId(Integer svcId) {
		this.svcId = svcId;
	}

	public Integer getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(Integer salePrice) {
		this.salePrice = salePrice;
	}
	
	public String getSaleStatus() {
		return saleStatus;
	}

	public void setSaleStatus(String saleStatus) {
		this.saleStatus = saleStatus;
	}

	public String getSvcName() {
		return svcName;
	}

	public void setSvcName(String svcName) {
		this.svcName = svcName;
	}

	public String getCatName() {
		return catName;
	}

	public void setCatName(String catName) {
		this.catName = catName;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public Integer getSvcPrice() {
		return svcPrice;
	}

	public void setSvcPrice(Integer svcPrice) {
		this.svcPrice = svcPrice;
	}

	@Override
	public int hashCode() {
		return Objects.hash(saleId, svcId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SaleDetail other = (SaleDetail) obj;
		return Objects.equals(saleId, other.saleId) && Objects.equals(svcId, other.svcId);
	}
	
}
