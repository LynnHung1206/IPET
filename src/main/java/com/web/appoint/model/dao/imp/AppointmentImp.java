package com.web.appoint.model.dao.imp;


import com.web.appoint.model.dao.AppointmentDAO;
import com.web.appoint.model.entities.Appointment;
import org.hibernate.Session;

import java.util.List;

/**
 * @author Yu-Jing
 * @create 2022-12-24-上午 10:30
 */
public class AppointmentImp implements AppointmentDAO {


    @Override
    public Integer add(Appointment appointment) {
        Session session = getSession();
        session.persist(appointment);
        return appointment.getApmID();
    }

    @Override
    public Integer update(Appointment newAppointment) {
        Session session = getSession();
        Appointment oldAppointment = session.get(Appointment.class, newAppointment.getApmID());
        oldAppointment.setApmStatus(newAppointment.getApmStatus());
        oldAppointment.setSchID(newAppointment.getSchID());
        oldAppointment.setCustomerNote(newAppointment.getCustomerNote());
        return newAppointment.getApmID();
    }



    @Override
    public List<Appointment> getAll() {
        Session session = getSession();
        String hql = "FROM Appointment";
        return session.createQuery(hql, Appointment.class).list();
    }

    @Override
    public Appointment getById(Integer id) {
        Session session = getSession();
        return session.get(Appointment.class, id);
    }

    @Override
    public Appointment findAppointBySchId(Integer schID) {
        Session session = getSession();
        String hql = "FROM Appointment WHERE schID = :schID";
        return session.createQuery(hql, Appointment.class)
                .setParameter("schID", schID)
                .getResultList().stream().findFirst().orElse(null); // in order to get null if we do not find data (getsingleresult will throw exception)
    }
    
    @Override
    public List<Appointment> findAppointByMemId(Integer memID) {
    	Session session = getSession();
    	String hql = "FROM Appointment WHERE memID = :memID";
    	return session.createQuery(hql, Appointment.class)
    			.setParameter("memID", memID)
    			.list();
    }

    @Override
    public List<Appointment> findAppointByStatus(Integer status) {
        Session session = getSession();
        String hql = "FROM Appointment WHERE apmStatus = :status";
        return session.createQuery(hql, Appointment.class)
                .setParameter("status", status)
                .list();
    }

}
