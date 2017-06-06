package com.spipm.tiles.account.service;

import java.util.List;

import com.spipm.tiles.account.entity.Feedback;

public interface FeedbackService {

	List<Feedback> getFeedbackList();
	List<Feedback> getFeedbackBy(final String propertyName, final Object value);
	List<Feedback> getFeedbackBy(final String propertyName, final Object value, final String propertyName1, final Object value1);
    List<Feedback> queryForPage(int offset, int length , String orderBy, boolean isAsc);
    void deleteById(final Object id);
    void addFeedback(Feedback feedback);
    void updateFeedback(Feedback feedback);
}
