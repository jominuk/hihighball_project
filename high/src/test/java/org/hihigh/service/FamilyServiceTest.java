package org.hihigh.service;

import org.hihigh.domain.FamilyVO;
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
public class FamilyServiceTest {

	   @Setter(onMethod_=@Autowired)
	   private FamilyService familyservice;

	   /*
	   @Test
	   public void testMamberGetList() {
		   familyservice.getMemberList().forEach(list -> log.info(list));
	   }
	   */
	   
	   /*
			@Test
			public void testIdCheck() {
				boolean result = familyservice.selectId("admin");
				
				if(result) {
					log.info("==========================    아이디 존재 ");
				}else {
					log.info("==========================    아이디 입력 가능");
				}
			}
		*/
	   
	   /*
	   @Test
	   public void testInsertMember() {
		   FamilyVO fa = new FamilyVO();
		   
		    fa.setId("ersffdsf");
		    fa.setPwd("123123");
		    fa.setName("조민욱");
		    fa.setTel("");
		    fa.setEmail("");
		   
		   familyservice.insertMember(fa);
	   }
	   */
	   
	
}



















