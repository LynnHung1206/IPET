package com.web.appoint.model.entities;

import com.core.model.entities.Core;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serial;
import java.io.Serializable;
import java.util.Objects;

/**
 * @author Yu-Jing
 * @create 2022-12-24-上午 10:36
 */

@Getter
@Setter
@ToString
//@NoArgsConstructor
//@AllArgsConstructor
@Entity
@IdClass(AppointmentDetail.PK.class)
@Table(name = "salon_appointment_detail", catalog = "ipetdb")
public class AppointmentDetail extends Core {
    @Serial
    private static final long serialVersionUID = 2L;
    public  static class PK implements Serializable{
        @Serial
        private static final long serialVersionUID = 22L;
        @Column(name ="APM_ID")
        @Id
        public Integer apmId;
        @Column(name ="SVC_ID")
        @Id
        public Integer svcId;

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            PK pk = (PK) o;
            return apmId.equals(pk.apmId) && svcId.equals(pk.svcId);
        }

        @Override
        public int hashCode() {
            return Objects.hash(apmId, svcId);
        }
    }

    @Column(name ="APM_ID")
    @Id
    private Integer apmId;
    @Column(name ="SVC_ID")
    @Id
    private Integer svcId;
    @Transient
    private String svcName;
    @Transient
    private String svcContent;
    @Column(name = "SALE_ID")
    private Integer saleId;
    @Transient
    private String saleName;
    @Column(name = "SVC_PRICE")
    private Integer svcPrice;
    @Column(name = "SALE_PRICE")
    private Integer salePrice;

    public AppointmentDetail() {
    }

    public AppointmentDetail(Integer apmId, Integer svcId, String svcName, String svcContent, Integer saleId, String saleName, Integer svcPrice, Integer salePrice) {
        this.apmId = apmId;
        this.svcId = svcId;
        this.svcName = svcName;
        this.svcContent = svcContent;
        this.saleId = saleId;
        this.saleName = saleName;
        this.svcPrice = svcPrice;
        this.salePrice = salePrice;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AppointmentDetail that = (AppointmentDetail) o;
        return apmId.equals(that.apmId) && svcId.equals(that.svcId) && saleId.equals(that.saleId) && svcPrice.equals(that.svcPrice) && salePrice.equals(that.salePrice);
    }

    @Override
    public int hashCode() {
        return Objects.hash(apmId, svcId, saleId, svcPrice, salePrice);
    }

    public Integer getApmId() {
        return apmId;
    }

    public void setApmId(Integer apmId) {
        this.apmId = apmId;
    }

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
}
