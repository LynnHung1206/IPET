package com.core.model.dao;

import com.core.util.HibernateUtil;
import org.hibernate.Session;

import java.util.List;

/**
 * @author Yu-Jing
 * @create 2022-12-24-上午 08:40
 */

// I is the PK; T is the entity
public interface CoreDAO<T, I>{
    List<T> getAll();
    T getById(I id);
    I add(T t);

    default Session getSession(){
        return HibernateUtil.getSessionFactory().getCurrentSession();
    }
}
