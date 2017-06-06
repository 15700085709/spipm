package com.spipm.tiles.account.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import org.hibernate.Query;

import com.spipm.tiles.account.dao.EvaluationDao;
import com.spipm.tiles.account.entity.Evaluation;
import com.spipm.tiles.account.service.EvaluationService;

@Component
public class EvaluationServiceImpl implements EvaluationService {
	
	@Autowired
	private EvaluationDao evaluationDao;
	public List<Evaluation> getEvaluationList(){
		return evaluationDao.getAll(); 
	}
	public List<Evaluation> getEvaluationBy(final String propertyName, final Object value){
		return evaluationDao.findBy(propertyName, value);
	}
	public List<Evaluation> getEvaluationBy(final String propertyName, final Object value, final String propertyName1, final Object value1){
		return evaluationDao.findBy(propertyName, value, propertyName1, value1);
	}
	public List<Evaluation> queryForPage(int offset, int length , String orderBy, boolean isAsc) {
        //查询所有的记录数
		String hql = "from Evaluation ";
		if(orderBy!=null)
			hql += " order by "+ orderBy + (isAsc ? " asc" : " desc");			
        Query query= (Query) evaluationDao.createQuery(hql);    
         query.setFirstResult(offset);
         query.setMaxResults(length); 
         return query.list(); 
        }
	public void deleteById(final Object id){
		try{
			evaluationDao.deleteById(id);
		}catch(Exception e){
			System.out.println(e);
		}
	}
	public void addEvaluation(Evaluation evaluation){
		evaluationDao.save(evaluation);
	}
	public void updateEvaluation(Evaluation evaluation){
		evaluationDao.update(evaluation);
	}
}

