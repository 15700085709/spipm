package com.spipm.tiles.account.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import org.hibernate.Query;

import com.spipm.tiles.account.dao.ProjectDao;
import com.spipm.tiles.account.entity.Project;
import com.spipm.tiles.account.service.ProjectService;

@Component
public class ProjectServiceImpl implements ProjectService {
	
	@Autowired
	private ProjectDao projectDao;
	public List<Project> getProjectList(){
		return projectDao.getAll(); 
	}
	public List<Project> getProjectBy(final String propertyName, final Object value){
		return projectDao.findBy(propertyName, value);
	}
	public List<Project> getProjectBy(final String propertyName, final Object value, final String propertyName1, final Object value1){
		return projectDao.findBy(propertyName, value, propertyName1, value1);
	}
	public List<Project> queryForPage(int offset, int length , String orderBy, boolean isAsc) {
        //查询所有的记录数
		String hql = "from Project ";
		if(orderBy!=null)
			hql += " order by "+ orderBy + (isAsc ? " asc" : " desc");			
        Query query= (Query) projectDao.createQuery(hql);    
         query.setFirstResult(offset);
         query.setMaxResults(length); 
         return query.list(); 
        }
	public void deleteById(final Object id){
		try{
			projectDao.deleteById(id);
		}catch(Exception e){
			System.out.println(e);
		}
	}
	public void addProject(Project project){
		projectDao.save(project);
	}
	public void updateProject(Project project){
		projectDao.update(project);
	}
}

