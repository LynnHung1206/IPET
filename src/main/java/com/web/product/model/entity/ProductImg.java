package com.web.product.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import com.core.model.entities.Core;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(catalog = "IPETDB", name = "product_img")
public class ProductImg extends Core{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "IMG_ID")
	private Integer imgID;
	@Column(name = "IMG_FILE")
	private byte[] imgFile;
	
	public Integer getImgID() {
		return imgID;
	}
	public void setImgID(Integer imgID) {
		this.imgID = imgID;
	}
	public byte[] getImgFile() {
		return imgFile;
	}
	public void setImgFile(byte[] imgFile) {
		this.imgFile = imgFile;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
