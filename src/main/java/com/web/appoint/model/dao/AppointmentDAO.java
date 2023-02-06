package com.web.appoint.model.dao;

import com.core.model.dao.CoreDAO;
import com.web.appoint.model.entities.Appointment;

import java.util.List;

/**
 * @author Yu-Jing
 * @create 2023/1/3 下午 01:18
 */
public interface AppointmentDAO  extends CoreDAO<Appointment, Integer> {
    // we could only update apmStatus, schDate, and Note
    Integer update(Appointment t);
    Appointment findAppointBySchId(Integer schID);
    List<Appointment> findAppointByMemId(Integer memID);
    List<Appointment> findAppointByStatus(Integer status);
}
