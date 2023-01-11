package com.web.appoint.model.services.imp;

import com.web.appoint.model.dao.AppointmentDetailDAO;
import com.web.appoint.model.dao.imp.AppointmentDetailImp;
import com.web.appoint.model.entities.AppointmentDetail;
import com.web.appoint.model.services.AppointDetailServices;

import java.util.List;

/**
 * @author Yu-Jing
 * @create 2023/1/3 下午 08:16
 */
public class AppointDetailServicesImp implements AppointDetailServices {
    private final AppointmentDetailDAO appointmentDetailDAO;

    public AppointDetailServicesImp(){
        appointmentDetailDAO = new AppointmentDetailImp();
    }
    @Override
    public List<AppointmentDetail> findAllServices() {
        List<AppointmentDetail> all = appointmentDetailDAO.getAll();
        // 完整顯示 svcId svcName svcPrice SALE_ID saleName salePrice
        // TODO:必須與service and service category 資料串接 (先暫不接)
        for (AppointmentDetail appoint : all) {
            appoint.setSvcName(appoint.getSvcId() + "-服務名稱");
            appoint.setSaleName(appoint.getSaleId() + "-方案名稱");
        }
        return all;
    }
}
