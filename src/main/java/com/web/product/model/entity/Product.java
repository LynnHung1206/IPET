package com.web.product.model.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GeneratorType;

import com.core.model.entities.Core;
import com.web.productImg.model.entity.ProductImg;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(catalog = "IPETDB", name = "product")
public class Product extends Core{

	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PROD_ID")
	private Integer prodID;
	@Column(name = "PROD_NAME")
	private String prodName;
	@Column(name = "PROD_PRICE")
	private Integer prodPrice;
	@Column(name = "ADDED_TIME", insertable = false)
	private Date addedTime;
	@Column(name = "PROD_DESCRIPTION")
	private String prodDescription;
	@Column(name = "PROD_STATUS", insertable = false)
	private Integer prodStatus;
	@Column(name = "TYPE_ID")
	private Integer typeID;
	
}
