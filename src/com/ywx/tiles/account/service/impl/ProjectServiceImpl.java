package com.ywx.tiles.account.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import org.hibernate.Query;
import com.ywx.tiles.account.dao.ProjectDao;
import com.ywx.tiles.account.entity.Project;
import com.ywx.tiles.account.service.ProjectService;

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
	public List<Project> queryForPage(int offset, int length) {
        //查询所有的记录数
        Query query= (Query) projectDao.createQuery("from Project");    
         query.setFirstResult(offset);
         query.setMaxResults(length);            
         return query.list(); 
        }
	public void deleteById(final Object id){
		projectDao.deleteById(id);
	}
	public void addProject(Project project){
		projectDao.save(project);
	}
}

