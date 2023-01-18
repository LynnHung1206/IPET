package com.web.pet.model.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.core.model.entities.Core;
@Entity
@Table(name = "Pet", catalog = "ipetdb")
public class Pet extends Core {
	
	private static final long serialVersionUID = 1L;
	@Column(name = "PET_ID")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer petId;
	@Column(name = "MEM_ID")
	private Integer memId;
	@Column(name = "PET_NAME")
	private String petName;
	@Column(name = "PET_VAR_ID")
	private String petVarId;
	@Column(name = "PET_SIZE")
	private String petSize;
	@Column(name = "PET_GEN")
	private String petGen;
	@Column(name = "PET_BIRTH")
	private Date petBirth;
	@Column(name = "PET_STATUS")
	private Integer petStatus;

	public Integer getPetId() {
		return petId;
	}
	public void setPetId(Integer petId) {
		this.petId = petId;
	}
	public Integer getMemId() {
		return memId;
	}
	public void setMemId(Integer memId) {
		this.memId = memId;
	}
	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}
	public String getPetVarId() {
		return petVarId;
	}
	public void setPetVarId(String petVarId) {
		this.petVarId = petVarId;
	}
	public String getPetSize() {
		return petSize;
	}
	public void setPetSize(String petSize) {
		this.petSize = petSize;
	}
	public String getPetGen() {
		return petGen;
	}
	public void setPetGen(String petGen) {
		this.petGen = petGen;
	}
	public Date getPetBirth() {
		return petBirth;
	}
	public void setPetBirth(Date petBirth) {
		this.petBirth = petBirth;
	}
	public Integer getPetStatus() {
		return petStatus;
	}
	public void setPetStatus(Integer petStatus) {
		this.petStatus = petStatus;
	}	
	
}
