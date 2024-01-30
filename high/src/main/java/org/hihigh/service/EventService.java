package org.hihigh.service;

import java.util.List;

import org.hihigh.domain.EventVO;

public interface EventService {

	List<EventVO> eventlist();
	
	void insertevent(EventVO event);
	
	
	
}
