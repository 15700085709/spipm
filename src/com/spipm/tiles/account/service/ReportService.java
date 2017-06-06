package com.spipm.tiles.account.service;

import java.util.List;

import com.spipm.tiles.account.entity.Report;

public interface ReportService {

	List<Report> getReportList();
	List<Report> getReportBy(final String propertyName, final Object value);
	List<Report> getReportBy(final String propertyName, final Object value, final String propertyName1, final Object value1);
    List<Report> queryForPage(int offset, int length , String orderBy, boolean isAsc);
    void deleteById(final Object id);
    void addReport(Report report);
    void updateReport(Report report);
}
