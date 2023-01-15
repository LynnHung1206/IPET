package com.web.appoint.model.services.imp;

import com.web.appoint.model.dao.AppointmentDetailDAO;
import com.web.appoint.model.dao.imp.AppointmentDetailImp;
import com.web.appoint.model.entities.AppointmentDetail;
import com.web.appoint.model.services.AppointDetailServices;
import com.web.salonSale.model.dao.SaleDAO;
import com.web.salonSale.model.dao.impl.SaleDAOImpl;
import com.web.salonService.model.dao.ServiceDAO;
import com.web.salonService.model.dao.impl.ServiceDAOImpl;

import java.util.List;

/**
 * @author Yu-Jing
 * @create 2023/1/3 下午 08:16
 */
public class AppointDetailServicesImp implements AppointDetailServices {
    private final AppointmentDetailDAO appointmentDetailDAO;
    private final SaleDAO saleDAO;
    private final ServiceDAO serviceDAO;

    public AppointDetailServicesImp(){
        appointmentDetailDAO = new AppointmentDetailImp();
        saleDAO = new SaleDAOImpl();
        serviceDAO = new ServiceDAOImpl();
    }
    @Override
    public List<AppointmentDetail> findAllServices() {
        List<AppointmentDetail> all = appointmentDetailDAO.getAll();
        for (AppointmentDetail appoint : all) {
            appoint.setSvcName( serviceDAO.getById(appoint.getSvcId()).getSvcName());
            appoint.setSaleName(saleDAO.getById(appoint.getSaleId()).getSaleName());
        }
        return all;
    }
}
