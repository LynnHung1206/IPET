package com.web.list.model.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import com.web.product.model.entity.Product;

@Entity
@Table(name = "cart_list", catalog = "ipetdb")
public class CartList {
	
	@Column(name="count" )
	private Integer count;
	
	@Column(name="total")
	private Integer total;
	
	@EmbeddedId
	private CartListPK cartListPK;
	

	@ManyToOne
    @JoinColumn(name = "prod_id", insertable = false, updatable = false)
	private Product product;
	
	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public CartListPK getCartListPK() {
		return cartListPK;
	}

	public void setCartListPK(CartListPK cartListPK) {
		this.cartListPK = cartListPK;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
	public CartList() {
		
	}
	
	@Embeddable
	public static class CartListPK implements Serializable {
		
		private static final long serialVersionUID = 7581683426060634798L;
	
		@Column(name = "MEM_ID")
		private Integer memID;
		@Column(name = "PROD_ID")
		private Integer prodID;
		
		public CartListPK() {
			
		}
		
		public CartListPK(Integer memID) {
			super();
			this.memID = memID;

		}

		public CartListPK(Integer memID, Integer prodID) {
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
			CartListPK other = (CartListPK) obj;
			return Objects.equals(memID, other.memID) && Objects.equals(prodID, other.prodID);
		}

		@Override
		public String toString() {
			return "CartListPK [memID=" + memID + ", prodID=" + prodID + "]";
		}
		
		
	}

	
}
