package com.spipm.tiles.account.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import org.hibernate.Query;

import com.spipm.tiles.account.dao.ReportDao;
import com.spipm.tiles.account.entity.Report;
import com.spipm.tiles.account.service.ReportService;

@Component
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	private ReportDao reportDao;
	public List<Report> getReportList(){
		return reportDao.getAll(); 
	}
	public List<Report> getReportBy(final String propertyName, final Object value){
		return reportDao.findBy(propertyName, value);
	}
	public List<Report> getReportBy(final String propertyName, final Object value, final String propertyName1, final Object value1){
		return reportDao.findBy(propertyName, value, propertyName1, value1);
	}
	public List<Report> queryForPage(int offset, int length , String orderBy, boolean isAsc) {
        //查询所有的记录数
		String hql = "from Report ";
		if(orderBy!=null)
			hql += " order by "+ orderBy + (isAsc ? " asc" : " desc");			
        Query query= (Query) reportDao.createQuery(hql);    
         query.setFirstResult(offset);
         query.setMaxResults(length); 
         return query.list(); 
        }
	public void deleteById(final Object id){
		try{
			reportDao.deleteById(id);
		}catch(Exception e){
			System.out.println(e);
		}
	}
	public void addReport(Report report){
		reportDao.save(report);
	}
	public void updateReport(Report report){
		reportDao.update(report);
	}
}

