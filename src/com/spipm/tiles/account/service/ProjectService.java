package com.spipm.tiles.account.service;

import java.util.List;

import com.spipm.tiles.account.entity.Project;

public interface ProjectService {

	List<Project> getProjectList();
	List<Project> getProjectBy(final String propertyName, final Object value);
	List<Project> getProjectBy(final String propertyName, final Object value, final String propertyName1, final Object value1);
    List<Project> queryForPage(int offset, int length , String orderBy, boolean isAsc);
    void deleteById(final Object id);
    void addProject(Project project);
    void updateProject(Project project);
}
