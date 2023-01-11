package com.core.model.service;

import com.core.util.HibernateUtil;
import org.hibernate.Session;

/**
 * @author Yu-Jing
 * @create 2023/1/3 上午 11:54
 */
public interface CoreService {
    default Session getSession(){
        return HibernateUtil.getSessionFactory().getCurrentSession();
    }

//    Since we use the WebFilter to filter all request ("/*"),and handle the transaction.
//    We do not need to write the transaction here.
//
//       default Transaction beginTransaction(){
//       // 對 "當前 session" 開啟 transaction
//       return getSession().beginTransaction();
//   }
//
//   default void commit(){
//       // 對 "當前transaction" 進行 commit
//       getSession().getTransaction().commit();
//   };
//
//   default void rollback(){
//       // 對 "當前transaction" 進行 rollback
//       getSession().getTransaction().rollback();
//   };
}
