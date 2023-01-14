package com.web.salonService.model.entities;

import java.io.Serial;
import java.util.Objects;
import javax.persistence.*;
import com.core.model.entities.Core;

@Entity
@Table(name = "SALON_SERVICE_PET_TYPE", catalog = "ipetdb")
public class PetType extends Core{
	@Serial
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "TYPE_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer typeId;
	
	@Column(name = "TYPE_NAME")
	private String typeName;
	
	@Column(name = "PET_SIZE")
	private String petSize;
	
	
	public PetType(Integer typeId, String typeName, String petSize) {
		this.typeId = typeId;
		this.typeName = typeName;
		this.petSize = petSize;
	}
	
	public PetType(String typeName, String petSize) {
		this.typeName = typeName;
		this.petSize = petSize;
	}
	
	public PetType() {}
	
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
	public String getPetSize() {
		return petSize;
	}
	public void setPetSize(String petSize) {
		this.petSize = petSize;
	}
	@Override
	public int hashCode() {
		return Objects.hash(typeId);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PetType other = (PetType) obj;
		return Objects.equals(typeId, other.typeId);
	}
}
