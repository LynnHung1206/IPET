package com.web.salonSale.model.dao.impl;

import java.util.List;
import com.web.salonSale.model.dao.SaleDAO;
import com.web.salonSale.model.entities.Sale;

public class SaleDAOImpl implements SaleDAO{
	
	@Override
	public Integer add(Sale sale) {
		getSession().merge(sale);
		return sale.getSaleId();
	}

	@Override
	public Integer deleteById(Integer saleId) {
		Sale sale = new Sale();
		sale.setSaleId(saleId);
		
		getSession().remove(sale);
		return saleId;
	}

	@Override
	public Sale getById(Integer saleId) {
		return getSession().get(Sale.class, saleId);
	}

	@Override
	public List<Sale> getAll() {
		final String hql = "FROM Sale ORDER BY saleId";
		return getSession().createQuery(hql, Sale.class).list();
	}

	@Override
	public List<Sale> findNotYetStartSale() {
		final String sql = "select * from SALON_SALE where START_TIME > now() order by SALE_ID;";
		return getSession().createNativeQuery(sql, Sale.class).list();
	}

	@Override
	public List<Sale> findOnSale() {
		final String sql = "select * from SALON_SALE where START_TIME <= now() and END_TIME >= now() order by SALE_ID;";
		return getSession().createNativeQuery(sql, Sale.class).list();
	}

	@Override
	public List<Sale> findEndedSale() {
		final String sql = "select * from SALON_SALE where END_TIME < now() order by SALE_ID;";
		return getSession().createNativeQuery(sql, Sale.class).list();
	}

}
