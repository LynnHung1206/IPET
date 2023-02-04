package com.web.list.model.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.*;

import com.web.product.model.entity.Product;

@Entity
@Table(name = "wish_list", catalog = "ipetdb")
public class WishList {
	@EmbeddedId
	private WishListPK wishListPK;
	
	@ManyToOne
    @JoinColumn(name = "prod_id", insertable = false, updatable = false)
	private Product product;
	

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
	public WishList() {
		
	}

	public WishListPK getWishListPK() {
		return wishListPK;
	}


	public void setWishListPK(WishListPK wishListPK) {
		this.wishListPK = wishListPK;
	}


	@Embeddable
	public static class WishListPK implements Serializable {

		private static final long serialVersionUID = 4661648067013487581L;

		@Column(name = "mem_id")
		private Integer memID;
		@Column(name = "prod_id")
		private Integer prodID;
		

		public WishListPK() {

		}

		public WishListPK(Integer memID) {
			super();
			this.memID = memID;

		}

		public WishListPK(Integer memID, Integer prodID) {
			super();
			this.memID = memID;
			this.prodID = prodID;
		}

		public Integer getMemID() {
			return memID;
		}

		public void setMemID(Integer memID) {
			this.memID = memID;
		}

		public Integer getProdID() {
			return prodID;
		}

		public void setProdID(Integer prodID) {
			this.prodID = prodID;
		}

		@Override
		public int hashCode() {
			return Objects.hash(memID, prodID);
		}

		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			WishListPK other = (WishListPK) obj;
			return Objects.equals(memID, other.memID) && Objects.equals(prodID, other.prodID);
		}

		@Override
		public String toString() {
			return "WishListPK [memID=" + memID + ", prodID=" + prodID + "]";
		}

	}

}
