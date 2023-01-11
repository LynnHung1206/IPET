package com.web.appoint.model.services;

import com.core.model.service.CoreService;
import com.web.appoint.model.entities.AppointmentDetail;

import java.util.List;

/**
 * @author Yu-Jing
 * @create 2023/1/3 下午 08:02
 */
public interface AppointDetailServices extends CoreService {
    List<AppointmentDetail> findAllServices();
}
