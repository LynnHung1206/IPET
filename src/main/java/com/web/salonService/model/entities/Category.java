package com.web.salonService.model.entities;

import java.io.Serial;
import java.util.Objects;
import javax.persistence.*;
import com.core.model.entities.Core;

@Entity
@Table(name = "SALON_SERVICE_CATEGORY", catalog = "ipetdb")
public class Category extends Core{
	@Serial
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "SVC_CATEGORY_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer catId;
	
	@Column(name = "SVC_CATEGORY_NAME")
	private String catName;
	
	@Column(name = "SVC_CATEGORY_IMG")
	private byte[] catImg;
	
	@Column(name = "SVC_CATEGORY_STATUS")
	private Integer catStatus;
	
	
	public Category(Integer catId, String catName, byte[] catImg, Integer catStatus) {
		this.catId = catId;
		this.catName = catName;
		this.catImg = catImg;
		this.catStatus = catStatus;
	}
	
	public Category(String catName, byte[] catImg, Integer catStatus) {
		this.catName = catName;
		this.catImg = catImg;
		this.catStatus = catStatus;
	}
	
	public Category() {}
	
	public Integer getCatId() {
		return catId;
	}
	public void setCatId(Integer catId) {
		this.catId = catId;
	}
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}
	public byte[] getCatImg() {
		return catImg;
	}
	public void setCatImg(byte[] catImg) {
		this.catImg = catImg;
	}
	public Integer getCatStatus() {
		return catStatus;
	}
	public void setCatStatus(Integer catStatus) {
		this.catStatus = catStatus;
	}
	@Override
	public int hashCode() {
		return Objects.hash(catId);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Category other = (Category) obj;
		return Objects.equals(catId, other.catId);
	}
	
	
}
