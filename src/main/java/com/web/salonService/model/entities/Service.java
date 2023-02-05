package com.web.salonService.model.entities;

import java.io.Serial;
import java.util.Objects;
import javax.persistence.*;
import com.core.model.entities.Core;
import com.web.salonService.model.services.*;

@Entity
@Table(name = "SALON_SERVICE", catalog = "ipetdb")
public class Service extends Core {
	@Serial
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "SVC_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer svcId;
	
	@Column(name = "SVC_NAME")
	private String svcName;
	
	@Column(name = "SVC_CONTENT")
	private String svcContent;
	
	@Column(name = "SVC_IMG")
	private byte[] svcImg;
	
	@Column(name = "SVC_CATEGORY_ID")
	private Integer catId;
	
	@Transient
    private String catName;
	
	@Column(name = "TYPE_ID")
	private Integer typeId;
	
	@Transient
    private String typeName;
	
	@Column(name = "SVC_PRICE")
	private Integer svcPrice;
	
	@Transient
    private Integer salePrice;
	
	@Column(name = "SVC_STATUS")
	private Integer svcStatus;
	
	@Transient
    private String svcStatusName;
	
	public Service(Integer svcId, String svcName, String svcContent, byte[] svcImg, Integer catId, Integer typeId, Integer svcPrice, Integer svcStatus) {
		this.svcId = svcId;
		this.svcName = svcName;
		this.svcContent = svcContent;
		this.svcImg = svcImg;
		this.catId = catId;
		this.typeId = typeId;
		this.svcPrice = svcPrice;
		this.svcStatus = svcStatus;
	}
	
	public Service(String svcName, String svcContent, byte[] svcImg, Integer catId, Integer typeId, Integer svcPrice, Integer svcStatus) {
		this.svcName = svcName;
		this.svcContent = svcContent;
		this.svcImg = svcImg;
		this.catId = catId;
		this.typeId = typeId;
		this.svcPrice = svcPrice;
		this.svcStatus = svcStatus;
	}
	
	public Service() {}
	
	public Integer getSvcId() {
		return svcId;
	}

	public void setSvcId(Integer svcId) {
		this.svcId = svcId;
	}

	public String getSvcName() {
		return svcName;
	}

	public void setSvcName(String svcName) {
		this.svcName = svcName;
	}

	public String getSvcContent() {
		return svcContent;
	}

	public void setSvcContent(String svcContent) {
		this.svcContent = svcContent;
	}

	public byte[] getSvcImg() {
		return svcImg;
	}

	public void setSvcImg(byte[] svcImg) {
		this.svcImg = svcImg;
	}

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

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
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

	public Integer getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(Integer salePrice) {
		this.salePrice = salePrice;
	}

	public Integer getSvcStatus() {
		return svcStatus;
	}

	public void setSvcStatus(Integer svcStatus) {
		this.svcStatus = svcStatus;
	}

	public String getSvcStatusName() {
		return svcStatusName;
	}

	public void setSvcStatusName(String svcStatusName) {
		this.svcStatusName = svcStatusName;
	}

	//for join catId to CategoryVO
	public Category getCategoryVO() {
		CategoryService categoryService = new CategoryService();
		Category category = categoryService.getOneCategory(catId);
		return category;
	}
	
	//for join typeId to PetTypeVO
	public PetType getPetTypeVO() {
		PetTypeService petTypeService = new PetTypeService();
		PetType petType = petTypeService.getOnPetType(typeId);
		return petType;
	}

	@Override
	public int hashCode() {
		return Objects.hash(svcId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Service other = (Service) obj;
		return Objects.equals(svcId, other.svcId);
	}
	
}
