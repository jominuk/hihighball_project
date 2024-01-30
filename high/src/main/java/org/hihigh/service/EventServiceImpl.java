package org.hihigh.service;

import java.util.List;

import org.hihigh.domain.EventVO;
import org.hihigh.persistance.EventMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class EventServiceImpl implements EventService {

	@Setter(onMethod_= @Autowired)
	private EventMapper eventmapper;
	
	
	@Override
	public List<EventVO> eventlist() {
		return eventmapper.eventlist();
	}
	
	@Override
	public void insertevent(EventVO event) {
	    eventmapper.insertevent(event);
	}


}









