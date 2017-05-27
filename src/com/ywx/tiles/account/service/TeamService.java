package com.ywx.tiles.account.service;

import java.util.List;
import com.ywx.tiles.account.entity.Team;

public interface TeamService {

	List<Team> getTeamList();
	List<Team> getTeamBy(final String propertyName, final Object value);
	List<Team> getTeamBy(final String propertyName, final Object value, final String propertyName1, final Object value1);
    List<Team> queryForPage(int offset, int length , String orderBy, boolean isAsc);
    void deleteById(final Object id);
    void addTeam(Team team);
    void updateTeam(Team team);
    List<Team> getTeamList(String orderBy, boolean isAsc);
    void addTeamNumber(final Object id, String number);
}
