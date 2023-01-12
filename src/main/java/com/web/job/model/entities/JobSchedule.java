package com.web.job.model.entities;

import com.core.model.entities.Core;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serial;
import java.sql.Date;
import java.util.Objects;


/**
 * @author Yu-Jing
 * @create 2022-12-24-上午 10:19
 */

@Getter
@Setter
@ToString
//@NoArgsConstructor
//@AllArgsConstructor
@Entity
@Table(name = "salon_schedule", catalog = "ipetdb")
public class JobSchedule extends Core {
    @Serial
    private static final long serialVersionUID = 3L;

    @Column(name = "SCH_ID")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer schID;
    @Column(name = "SCH_DATE")
    private Date schDate;
    @Column(name = "SCH_PERIOD")
    private String schPeriod;
    @Column(name = "GROOMER_ID")
    private Integer groomerID;
    @Transient
    private String groomerName;
    @Column(name = "ASST_ID_1")
    private Integer asstID1;
    @Transient
    private String asstID1Name;
    @Column(name = "ASST_ID_2")
    private Integer asstID2;
    @Transient
    private String asstID2Name;
    @Column(name = "EMPLOYEE_NOTE")
    private String employeeNote;
    @Transient
    private Integer apmId;


    public JobSchedule(Integer schID, Date schDate, String schPeriod, Integer groomerID, String groomerName, Integer asstID1, String asstID1Name, Integer asstID2, String asstID2Name, String employeeNote, Integer apmId) {
        this.schID = schID;
        this.schDate = schDate;
        this.schPeriod = schPeriod;
        this.groomerID = groomerID;
        this.groomerName = groomerName;
        this.asstID1 = asstID1;
        this.asstID1Name = asstID1Name;
        this.asstID2 = asstID2;
        this.asstID2Name = asstID2Name;
        this.employeeNote = employeeNote;
        this.apmId = apmId;
    }

    public JobSchedule(Date schDate, String schPeriod, Integer groomerID, Integer asstID1, Integer asstID2, String employeeNote) {
        this.schDate = schDate;
        this.schPeriod = schPeriod;
        this.groomerID = groomerID;
        this.asstID1 = asstID1;
        this.asstID2 = asstID2;
        this.employeeNote = employeeNote;
    }

    public JobSchedule() {}

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

    public Integer getGroomerID() {
        return groomerID;
    }

    public void setGroomerID(Integer groomerID) {
        this.groomerID = groomerID;
    }

    public String getGroomerName() {
        return groomerName;
    }

    public void setGroomerName(String groomerName) {
        this.groomerName = groomerName;
    }

    public Integer getAsstID1() {
        return asstID1;
    }

    public void setAsstID1(Integer asstID1) {
        this.asstID1 = asstID1;
    }

    public String getAsstID1Name() {
        return asstID1Name;
    }

    public void setAsstID1Name(String asstID1Name) {
        this.asstID1Name = asstID1Name;
    }

    public Integer getAsstID2() {
        return asstID2;
    }

    public void setAsstID2(Integer asstID2) {
        this.asstID2 = asstID2;
    }

    public String getAsstID2Name() {
        return asstID2Name;
    }

    public void setAsstID2Name(String asstID2Name) {
        this.asstID2Name = asstID2Name;
    }

    public String getEmployeeNote() {
        return employeeNote;
    }

    public void setEmployeeNote(String employeeNote) {
        this.employeeNote = employeeNote;
    }

    public Integer getApmId() {
        return apmId;
    }

    public void setApmId(Integer apmId) {
        this.apmId = apmId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        JobSchedule that = (JobSchedule) o;
        return Objects.equals(schID, that.schID) && Objects.equals(schDate, that.schDate) && Objects.equals(schPeriod, that.schPeriod) && Objects.equals(groomerID, that.groomerID) && Objects.equals(groomerName, that.groomerName) && Objects.equals(asstID1, that.asstID1) && Objects.equals(asstID1Name, that.asstID1Name) && Objects.equals(asstID2, that.asstID2) && Objects.equals(asstID2Name, that.asstID2Name) && Objects.equals(employeeNote, that.employeeNote) && Objects.equals(apmId, that.apmId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), schID, schDate, schPeriod, groomerID, groomerName, asstID1, asstID1Name, asstID2, asstID2Name, employeeNote, apmId);
    }
}
