package com.web.salonSale.model.dao.impl;

import java.util.List;
import org.hibernate.Session;
import com.web.salonSale.model.dao.SaleDetailDAO;
import com.web.salonSale.model.entities.SaleDetail;

public class SaleDetailDAOImpl implements SaleDetailDAO{
	
	//新增優惠細項(一筆)
	@Override
	public SaleDetail.PK add(SaleDetail saleDetail) {
		getSession().merge(saleDetail);
		
		SaleDetail.PK pk = new SaleDetail.PK();
		pk.saleId = saleDetail.getSaleId();
		pk.svcId = saleDetail.getSvcId();
		return pk;
	}
	
	//大量新增
	@Override
	public SaleDetail.PK[] addBatch(SaleDetail[] saleDetails) {
		Session session = getSession();
		SaleDetail.PK[] pks = new SaleDetail.PK[saleDetails.length];
		
		for(int i = 0; i < saleDetails.length; i++) {
			session.merge(saleDetails[i]);
			pks[i].saleId = saleDetails[i].getSaleId();
			pks[i].svcId = saleDetails[i].getSvcId();
		}
		return pks;
	}

	//查詢某優惠的某服務
	@Override
	public SaleDetail getById(SaleDetail.PK pk) {
		return getSession().get(SaleDetail.class, pk);
	}

	//getAll()
	@Override
	public List<SaleDetail> getAll() {
		final String hql = "FROM SaleDetail ORDER BY saleId";
		return getSession().createQuery(hql, SaleDetail.class).list();
	}

	//查詢某優惠的所有服務
	@Override
	public List<SaleDetail> findSvcsById(Integer saleId) {
		final String hql = "FROM SaleDetail WHERE saleId = :saleId ORDER BY svcId";
		return getSession().createQuery(hql, SaleDetail.class)
				.setParameter("saleId", saleId)
				.list();
	}

	//刪除優惠細項(一筆)
	@Override
	public SaleDetail.PK deleteOneSvc(SaleDetail.PK pk) {
		SaleDetail saleDetail = new SaleDetail();
		saleDetail.setSaleId(pk.saleId);
		saleDetail.setSvcId(pk.svcId);
		
		getSession().remove(saleDetail);
		return pk;
	}

	//刪除整筆優惠用 - 單筆優惠的所有細項刪除
	@Override
	public Integer deleteBySaleId(Integer saleId) {
		final String hql = "DELETE FROM SaleDetail WHERE saleId = :saleId";
		return getSession().createQuery(hql)
				.setParameter("saleId", saleId)
				.executeUpdate();
	}

}
