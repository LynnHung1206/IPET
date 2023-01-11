package com.web.appoint.model.dao;

import com.core.model.dao.CoreDAO;
import com.web.appoint.model.entities.AppointmentDetail;

import java.util.List;

/**
 * @author Yu-Jing
 * @create 2023/1/3 下午 01:21
 */
public interface AppointmentDetailDAO  extends CoreDAO<AppointmentDetail, AppointmentDetail.PK> {
    AppointmentDetail.PK[] addBatch(AppointmentDetail[] ts);
    Integer deleteByApmId(Integer apmID);
    Integer getTotalPriceByApmId(Integer apmID);
    List<AppointmentDetail> getAllServicesByApmId(Integer apmID);

}
