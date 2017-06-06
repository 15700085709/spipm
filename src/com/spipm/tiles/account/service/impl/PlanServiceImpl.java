package com.spipm.tiles.account.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import org.hibernate.Query;

import com.spipm.tiles.account.dao.PlanDao;
import com.spipm.tiles.account.entity.Plan;
import com.spipm.tiles.account.service.PlanService;

@Component
public class PlanServiceImpl implements PlanService {
	
	@Autowired
	private PlanDao planDao;
	public List<Plan> getPlanList(){
		return planDao.getAll(); 
	}
	public List<Plan> getPlanBy(final String propertyName, final Object value){
		return planDao.findBy(propertyName, value);
	}
	public List<Plan> getPlanBy(final String propertyName, final Object value, final String propertyName1, final Object value1){
		return planDao.findBy(propertyName, value, propertyName1, value1);
	}
	public List<Plan> queryForPage(int offset, int length , String orderBy, boolean isAsc) {
        //查询所有的记录数
		String hql = "from Plan ";
		if(orderBy!=null)
			hql += " order by "+ orderBy + (isAsc ? " asc" : " desc");			
        Query query= (Query) planDao.createQuery(hql);    
         query.setFirstResult(offset);
         query.setMaxResults(length); 
         return query.list(); 
        }
	public void deleteById(final Object id){
		try{
			planDao.deleteById(id);
		}catch(Exception e){
			System.out.println(e);
		}
	}
	public void addPlan(Plan plan){
		planDao.save(plan);
	}
	public void updatePlan(Plan plan){
		planDao.update(plan);
	}
	
	public List<Plan> getPlanByHQL(String hql){
		return planDao.createQuery(hql).list();
	}
}

