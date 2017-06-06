package com.spipm.tiles.account.service;

import java.util.List;

import com.spipm.tiles.account.entity.Deployment;

public interface DplService {

	List<Deployment> getDplList();
	List<Deployment> getDplBy(final String propertyName, final Object value);
	List<Deployment> getDplBy(final String propertyName, final Object value, final String propertyName1, final Object value1);
	List<Deployment> queryForPage(int offset, int length , String orderBy, boolean isAsc);
    void deleteById(final Object id);
    void addDpl(Deployment deployment);
    void updateDpl(Deployment deployment);
	List<Deployment> getDplBySQL(String sql);
	List<Deployment> getDplByHQL(String hql);
	int getMaxVersion();
}
