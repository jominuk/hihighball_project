package org.hihigh.persistance;

import java.util.List;

import org.hihigh.domain.EventVO;

public interface EventMapper {

	List<EventVO> eventlist();
	
	void insertevent(EventVO event);
}
