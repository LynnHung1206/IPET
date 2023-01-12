package com.web.appoint.model.entities;

import com.core.model.entities.Core;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Objects;

/**
 * @author Yu-Jing
 * @create 2022-12-24-上午 10:31
 */
@Getter
@Setter
@ToString
//@NoArgsConstructor
//@AllArgsConstructor
@Entity
@Table(name = "salon_appointment", catalog = "ipetdb")
public class Appointment extends Core {
    private static final long serialVersionUID = 1L;
    @Column(name = "APM_ID")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer apmID;
    @Column(name = "APM_STATUS")
    private Integer apmStatus;
    @Transient
    private String apmStatusDesc;
    @Column(name = "MEM_ID")
    private Integer memID;
    @Transient
    private String memName;
    @Column(name = "PET_ID")
    private Integer  petID;
    @Transient
    private String petName;
    @Column(name = "SCH_ID")
    private Integer schID;
    @Transient
    private Date schDate;
    @Transient
    private String schPeriod;
    @Column(name = "APM_BUILD_TIME", insertable = false)
    private Timestamp apmBuildTime;
    @Column(name = "CUSTOMER_NOTE")
    private String customerNote;
    @Column(name = "TOTAL_PRICE")
    private Integer totalPrice;
    @Transient
    private AppointmentDetail[] appointmentDetails;

    public Appointment() {
    }

    public Appointment(Integer apmID, Integer apmStatus, String apmStatusDesc, Integer memID, String memName, Integer petID, String petName, Integer schID, Date schDate, String schPeriod, Timestamp apmBuildTime, String customerNote, Integer totalPrice, AppointmentDetail[] appointmentDetails) {
        this.apmID = apmID;
        this.apmStatus = apmStatus;
        this.apmStatusDesc = apmStatusDesc;
        this.memID = memID;
        this.memName = memName;
        this.petID = petID;
        this.petName = petName;
        this.schID = schID;
        this.schDate = schDate;
        this.schPeriod = schPeriod;
        this.apmBuildTime = apmBuildTime;
        this.customerNote = customerNote;
        this.totalPrice = totalPrice;
        this.appointmentDetails = appointmentDetails;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Appointment that = (Appointment) o;
        return apmID.equals(that.apmID) && apmStatus.equals(that.apmStatus) && memID.equals(that.memID) && petID.equals(that.petID) && schID.equals(that.schID) && apmBuildTime.equals(that.apmBuildTime) && Objects.equals(customerNote, that.customerNote) && totalPrice.equals(that.totalPrice) && appointmentDetails.equals(that.appointmentDetails);
    }


    @Override
    public int hashCode() {
        return Objects.hash(apmID, apmStatus, memID, petID, schID, apmBuildTime, customerNote, totalPrice, appointmentDetails);
    }

    public Integer getApmID() {
        return apmID;
    }

    public void setApmID(Integer apmID) {
        this.apmID = apmID;
    }

    public Integer getApmStatus() {
        return apmStatus;
    }

    public void setApmStatus(Integer apmStatus) {
        this.apmStatus = apmStatus;
    }

    public String getApmStatusDesc() {
        return apmStatusDesc;
    }

    public void setApmStatusDesc(String apmStatusDesc) {
        this.apmStatusDesc = apmStatusDesc;
    }

    public Integer getMemID() {
        return memID;
    }

    public void setMemID(Integer memID) {
        this.memID = memID;
    }

    public String getMemName() {
        return memName;
    }

    public void setMemName(String memName) {
        this.memName = memName;
    }

    public Integer getPetID() {
        return petID;
    }

    public void setPetID(Integer petID) {
        this.petID = petID;
    }

    public String getPetName() {
        return petName;
    }

    public void setPetName(String petName) {
        this.petName = petName;
    }

    public Integer getSchID() {
        return schID;
    }

    public void setSchID(Integer schID) {
        this.schID = schID;
    }

    public Date getSchDate() {
        return schDate;
    }

    public void setSchDate(Date schDate) {
        this.schDate = schDate;
    }

    public String getSchPeriod() {
        return schPeriod;
    }

    public void setSchPeriod(String schPeriod) {
        this.schPeriod = schPeriod;
    }

    public Timestamp getApmBuildTime() {
        return apmBuildTime;
    }

    public void setApmBuildTime(Timestamp apmBuildTime) {
        this.apmBuildTime = apmBuildTime;
    }

    public String getCustomerNote() {
        return customerNote;
    }

    public void setCustomerNote(String customerNote) {
        this.customerNote = customerNote;
    }

    public Integer getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Integer totalPrice) {
        this.totalPrice = totalPrice;
    }

    public AppointmentDetail[] getAppointmentDetails() {
        return appointmentDetails;
    }

    public void setAppointmentDetails(AppointmentDetail[] appointmentDetails) {
        this.appointmentDetails = appointmentDetails;
    }
}
