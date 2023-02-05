package com.web.salonService.model.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;

import com.web.salonService.model.dao.ServiceDAO;
import com.web.salonService.model.entities.Service;

public class ServiceDAOImpl implements ServiceDAO {

	@Override
	public Integer add(Service service) {
		getSession().merge(service);
		return service.getSvcId();
	}


	@Override
	public Integer[] addBatch(Service[] svcs) {
		Session session = getSession();
		Integer[] svcIds = new Integer[svcs.length];
		
		for(int i = 0; i < svcs.length; i++) {
			session.merge(svcs[i]);
			svcIds[i] = svcs[i].getSvcId();
		}
		return svcIds;
	}


	@Override
	public Integer deleteById(Integer svcId) {
		Service service = new Service();
		service.setSvcId(svcId);
		
		getSession().remove(service);
		return svcId;
	}

	@Override
	public Service getById(Integer svcId) {
		return getSession().get(Service.class, svcId);
	}

	@Override
	public List<Service> getAll() {
		final String hql = "FROM Service ORDER BY svcId";
		return getSession().createQuery(hql, Service.class).list();
	}
	
	@Override
	public List<Service> findSvcByCatId(Integer catId){
		final String hql = "FROM Service WHERE catId = :catId ORDER BY svcId";
		return getSession().createQuery(hql, Service.class)
				.setParameter("catId", catId)
				.list();
	}

	@Override
	public List<Service> getAllIf(Map<String, String[]> map) {
		try {
			Session session = getSession();
			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			CriteriaQuery<Service> criteriaQuery = criteriaBuilder.createQuery(Service.class);
			Root<Service> root = criteriaQuery.from(Service.class);
			
			List<Predicate> predicates = new ArrayList<>();
			
			Set<String> keys = map.keySet();
			
			for(String key : keys) {
				String value = map.get(key)[0];
				
				if(value != null && value.trim().length() != 0 && !"action".equals(key)) {
					if ("svcId".equals(key) || "catId".equals(key) || "typeId".equals(key)
							|| "svcPrice".equals(key) || "svcStatus".equals(key)) {
						predicates.add(criteriaBuilder.equal(root.get(key), Integer.parseInt(value)));
					}else if ("svcName".equals(key)) {
						predicates.add(criteriaBuilder.like(root.get(key), "%" + value + "%"));
					}else if ("lowerPrice".equals(key)) {
						predicates.add(criteriaBuilder.gt(root.get("svcPrice"), Integer.parseInt(value)));
					}else if ("highestPrice".equals(key)) {
						predicates.add(criteriaBuilder.lt(root.get("svcPrice"), Integer.parseInt(value)));
					}
				}
			}
			criteriaQuery.where(predicates.toArray(new Predicate[predicates.size()]));
			criteriaQuery.orderBy(criteriaBuilder.asc(root.get("svcId")));
			
			Query query = session.createQuery(criteriaQuery);
			return query.getResultList();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("複合查詢失敗");
			return null;
		}
		
		/* JDBC版
		Set<String> keys = map.keySet();
		StringBuffer whereCondition = new StringBuffer();
		int count = 0;
		for (String key : keys) {
			String value = map.get(key)[0];
			if (value != null && value.trim().length() != 0 && !"action".equals(key)) {
				count++;
				String aCondition = null;

				if ("SVC_ID".equals(key) || "SVC_CATEGORY_ID".equals(key) || "TYPE_ID".equals(key) || "SVC_PRICE".equals(key)
						|| "SVC_STATUS".equals(key)) {
					aCondition = key + "=" + value.trim();
				} else if ("SVC_NAME".equals(key)) {
					aCondition = key + " like '%" + value.trim() + "%'";	//字串查詢
				} else if ("lowerPrice".equals(key)) {
					aCondition = " SVC_PRICE > " + value.trim();			//最小數字
				} else if ("highestPrice".equals(key)) {
					aCondition = " SVC_PRICE < " + value.trim();			//最大數字
				}

				if (count == 1) {
					whereCondition.append(" where " + aCondition + " ");
				} else {
					whereCondition.append(" and " + aCondition + " ");
				}
			}
		}

		final String finalSql = "select * from SALON_SERVICE " + whereCondition + "order by SVC_ID";

		try (Connection connection = dataSource.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(finalSql);
				ResultSet resultSet = preparedStatement.executeQuery()) {
			List<Service> list = new ArrayList<>();
			while (resultSet.next()) {
				Service service = new Service();
				service.setSvcId(resultSet.getInt("SVC_ID"));
				service.setSvcName(resultSet.getString("SVC_NAME"));
				service.setSvcContent(resultSet.getString("SVC_CONTENT"));
				service.setSvcImg(resultSet.getBytes("SVC_IMG"));
				service.setCatId(resultSet.getInt("SVC_CATEGORY_ID"));
				service.setTypeId(resultSet.getInt("TYPE_ID"));
				service.setSvcPrice(resultSet.getInt("SVC_PRICE"));
				service.setSvcStatus(resultSet.getInt("SVC_STATUS"));
				list.add(service);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		*/
	}
}
