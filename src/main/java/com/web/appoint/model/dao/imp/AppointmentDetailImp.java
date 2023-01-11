package com.web.appoint.model.dao.imp;

import com.web.appoint.model.dao.AppointmentDetailDAO;
import com.web.appoint.model.entities.AppointmentDetail;
import org.hibernate.Session;

import java.util.List;


/**
 * @author Yu-Jing
 * @create 2022-12-24-上午 10:36
 */
public class AppointmentDetailImp implements AppointmentDetailDAO {

    @Override
    public AppointmentDetail.PK add(AppointmentDetail appointmentDetail) {
        Session session = getSession();
        session.persist(appointmentDetail);
        AppointmentDetail.PK pk = new AppointmentDetail.PK();
        pk.svcId = appointmentDetail.getSvcId();
        pk.apmId = appointmentDetail.getApmId();
        return pk;
    }

    @Override
    public AppointmentDetail.PK[] addBatch(AppointmentDetail[] appointmentDetails) {
        Session session = getSession();
        AppointmentDetail.PK[] pks = new AppointmentDetail.PK[appointmentDetails.length];
        int i = 0;
        for (AppointmentDetail appointmentDetail : appointmentDetails) {
            session.persist(appointmentDetail);
            AppointmentDetail.PK pk = new AppointmentDetail.PK();
            pk.svcId = appointmentDetail.getSvcId();
            pk.apmId = appointmentDetail.getApmId();
            pks[i] = pk;
            i++;
        }
        return pks;
    }

    @Override
    public Integer deleteByApmId(Integer ampID) {
        Session session = getSession();
        String hql  = "DELETE FROM AppointmentDetail WHERE ampID = :ampID";
        return session.createQuery(hql)
                .setParameter("ampID", ampID)
                .executeUpdate();
    }


    @Override
    public List<AppointmentDetail> getAll() {
        Session session = getSession();
        String hql = "FROM AppointmentDetail";
        return session.createQuery(hql, AppointmentDetail.class).list();
    }


    @Override
    public AppointmentDetail getById(AppointmentDetail.PK id) {
        Session session = getSession();
        return session.get(AppointmentDetail.class, id);
    }

    @Override
    public Integer getTotalPriceByApmId(Integer apmID) {
        Session session = getSession();
        Integer price = 0;
        String hql = "FROM AppointmentDetail WHERE apmId = :apmID";
        List<AppointmentDetail> list = session.createQuery(hql, AppointmentDetail.class)
                .setParameter("apmID", apmID)
                .list();
        for (AppointmentDetail appointDetail : list) {
            price += appointDetail.getSalePrice();
        }
        return price;
    }

    @Override
    public List<AppointmentDetail> getAllServicesByApmId(Integer apmID) {
        Session session = getSession();
        String hql = "FROM AppointmentDetail WHERE apmId = :apmID";
        return session.createQuery(hql, AppointmentDetail.class).
                setParameter("apmID", apmID)
                .list();
    }

}
