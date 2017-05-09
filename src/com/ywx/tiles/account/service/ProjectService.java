package com.ywx.tiles.account.service;

import java.util.List;
import com.ywx.tiles.account.entity.Project;

public interface ProjectService {

	List<Project> getProjectList();
	List<Project> getProjectBy(final String propertyName, final Object value);
	List<Project> getProjectBy(final String propertyName, final Object value, final String propertyName1, final Object value1);
    List<Project> queryForPage(int offset, int length);
    void deleteById(final Object id);
    void addProject(Project project);
}
