package com.ywx.tiles.account.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import org.hibernate.Query;
import com.ywx.tiles.account.dao.TeamDao;
import com.ywx.tiles.account.entity.Team;
import com.ywx.tiles.account.service.TeamService;

@Component
public class TeamServiceImpl implements TeamService {
	
	@Autowired
	private TeamDao teamDao;
	public List<Team> getTeamList(){
		return teamDao.getAll(); 
	}
	public List<Team> getTeamBy(final String propertyName, final Object value){
		return teamDao.findBy(propertyName, value);
	}
	public List<Team> getTeamBy(final String propertyName, final Object value, final String propertyName1, final Object value1){
		return teamDao.findBy(propertyName, value, propertyName1, value1);
	}
	public List<Team> queryForPage(int offset, int length, String orderBy, boolean isAsc) {
        //查询所有的记录数
		String hql = "from Team ";
		if(orderBy!=null)
			hql += " order by "+ orderBy + (isAsc ? " asc" : " desc");			
        Query query= (Query) teamDao.createQuery(hql);    
         query.setFirstResult(offset);
         query.setMaxResults(length); 
         return query.list(); 
        }
	public void deleteById(final Object id){
		teamDao.deleteById(id);
	}
	public void addTeam(Team team){
		teamDao.save(team);
	}
	public void updateTeam(Team team){
		teamDao.update(team);
	}
	public List<Team> getTeamList(String orderBy, boolean isAsc){
		return teamDao.getAll(orderBy,isAsc); 
    }
	public void addTeamNumber(final Object id, String number){
		List<Team> teamList = getTeamBy("id", id);
		if(teamList!=null&&teamList.size()!=0){
			Team team  = teamList.get(0);
			team.setTeamNumber(number+",");
			updateTeam(team);
		}
	}
}

