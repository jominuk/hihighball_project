package org.hihigh.service;

import org.hihigh.domain.EventVO;
import org.hihigh.persistance.EventMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class EventServiceTest {

	@Setter(onMethod_ = @Autowired)
	private EventService eventservice;

	
	/*
	@Test
	public void testList() {
		eventservice.eventlist().forEach(list -> log.info(list));
	}
	*/
	
	
	@Test
	public void testinsert() {
	    EventVO ev = new EventVO();
	    
	    ev.setId("jominuk1025");
	    ev.setCompany("지오");
	    ev.setName("조미눙");
	    ev.setTel("01021546598");
	    ev.setNum("2명");
	    ev.setDatech("2012-12-01");
		
	    eventservice.insertevent(ev);
		log.info(ev);
	}

}
























