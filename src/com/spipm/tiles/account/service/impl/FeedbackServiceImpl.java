package com.spipm.tiles.account.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import org.hibernate.Query;

import com.spipm.tiles.account.dao.FeedbackDao;
import com.spipm.tiles.account.entity.Feedback;
import com.spipm.tiles.account.service.FeedbackService;

@Component
public class FeedbackServiceImpl implements FeedbackService {
	
	@Autowired
	private FeedbackDao feedbackDao;
	public List<Feedback> getFeedbackList(){
		return feedbackDao.getAll(); 
	}
	public List<Feedback> getFeedbackBy(final String propertyName, final Object value){
		return feedbackDao.findBy(propertyName, value);
	}
	public List<Feedback> getFeedbackBy(final String propertyName, final Object value, final String propertyName1, final Object value1){
		return feedbackDao.findBy(propertyName, value, propertyName1, value1);
	}
	public List<Feedback> queryForPage(int offset, int length , String orderBy, boolean isAsc) {
        //查询所有的记录数
		String hql = "from Feedback ";
		if(orderBy!=null)
			hql += " order by "+ orderBy + (isAsc ? " asc" : " desc");			
        Query query= (Query) feedbackDao.createQuery(hql);    
         query.setFirstResult(offset);
         query.setMaxResults(length); 
         return query.list(); 
        }
	public void deleteById(final Object id){
		try{
			feedbackDao.deleteById(id);
		}catch(Exception e){
			System.out.println(e);
		}
	}
	public void addFeedback(Feedback feedback){
		feedbackDao.save(feedback);
	}
	public void updateFeedback(Feedback feedback){
		feedbackDao.update(feedback);
	}
}

