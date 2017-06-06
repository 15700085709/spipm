package com.spipm.tiles.account.service;

import java.util.List;

import com.spipm.tiles.account.entity.Evaluation;

public interface EvaluationService {

	List<Evaluation> getEvaluationList();
	List<Evaluation> getEvaluationBy(final String propertyName, final Object value);
	List<Evaluation> getEvaluationBy(final String propertyName, final Object value, final String propertyName1, final Object value1);
    List<Evaluation> queryForPage(int offset, int length , String orderBy, boolean isAsc);
    void deleteById(final Object id);
    void addEvaluation(Evaluation evaluation);
    void updateEvaluation(Evaluation evaluation);
}
