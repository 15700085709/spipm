package com.ywx.tiles.account.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import org.hibernate.Query;
import com.ywx.tiles.account.dao.DplDao;
import com.ywx.tiles.account.entity.Deployment;
import com.ywx.tiles.account.entity.User;
import com.ywx.tiles.account.service.DplService;

@Component
public class DplServiceImpl implements DplService {
	
	@Autowired
	private DplDao dplDao;
	public List<Deployment> getDplList(){
		return dplDao.getAll(); 
	}
	public List<Deployment> getDplBy(final String propertyName, final Object value){
		return dplDao.findBy(propertyName, value);
	}
	public List<Deployment> getDplBy(final String propertyName, final Object value, final String propertyName1, final Object value1){
		return dplDao.findBy(propertyName, value, propertyName1, value1);
	}
	public List<Deployment> queryForPage(int offset, int length, String orderBy, boolean isAsc) {
        //查询所有的记录数
		String hql = "from Deployment ";
		if(orderBy!=null)
			hql += " order by "+ orderBy + (isAsc ? " asc" : " desc");			
        Query query= (Query) dplDao.createQuery(hql);    
         query.setFirstResult(offset);
         query.setMaxResults(length); 
         return query.list(); 
        }
	public void deleteById(final Object id){
		dplDao.deleteById(id);
	}
	public void addDpl(Deployment deployment){
		dplDao.save(deployment);
	}
	public void updateDpl(Deployment deployment) {
		dplDao.update(deployment);
		
	}
	public List<Deployment> getDplBySQL(String sql){
		return dplDao.createSQLQuery(sql).list();
	}
	
	public int getMaxVersion(){
		Object obj = dplDao.createQuery("select max(dplVersion) from Deployment").uniqueResult();
		int maxVsersion = Integer.parseInt(obj!=null?obj.toString():"0");
		return maxVsersion;
	}
	
	public List<Deployment> getDplByHQL(String hql){
		return dplDao.createQuery(hql).list();
	}
}

