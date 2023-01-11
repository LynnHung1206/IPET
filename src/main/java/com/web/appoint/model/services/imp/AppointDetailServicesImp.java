package com.web.appoint.model.services.imp;

import com.web.appoint.model.services.AppointDetailServices;
import com.web.appoint.model.dao.imp.AppointmentDetailImp;
import com.web.appoint.model.entities.AppointmentDetail;

import java.util.List;

/**
 * @author Yu-Jing
 * @create 2023/1/3 下午 08:16
 */
public class AppointDetailServicesImp implements AppointDetailServices {
    private final AppointmentDetailImp appointmentDetailImp = new AppointmentDetailImp();

    @Override
    public List<AppointmentDetail> findAllServices() {
        List<AppointmentDetail> all = appointmentDetailImp.getAll();
        // 完整顯示 svcId svcName svcPrice SALE_ID saleName salePrice
        // 必須與service and service category 資料串接 (先暫不接)
        for (AppointmentDetail appoint : all) {
            appoint.setSvcName(appoint.getSvcId() + "-服務名稱");
            appoint.setSaleName(appoint.getSaleId() + "-方案名稱");
        }
        return all;
    }
}
