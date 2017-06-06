package com.spipm.tiles.account.service;

import java.util.List;

import com.spipm.tiles.account.entity.Plan;

public interface PlanService {

	List<Plan> getPlanList();
	List<Plan> getPlanBy(final String propertyName, final Object value);
	List<Plan> getPlanBy(final String propertyName, final Object value, final String propertyName1, final Object value1);
    List<Plan> queryForPage(int offset, int length , String orderBy, boolean isAsc);
    void deleteById(final Object id);
    void addPlan(Plan plan);
    void updatePlan(Plan plan);
    List<Plan> getPlanByHQL(String hql);
}
