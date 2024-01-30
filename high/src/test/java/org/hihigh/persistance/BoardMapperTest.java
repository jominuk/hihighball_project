package org.hihigh.persistance;

import org.hihigh.domain.ReplyVO;
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
public class BoardMapperTest {

	@Setter(onMethod_= @Autowired)
	private BoardMapper boardmapper;
	
	
	@Test
	public void testBoardList() {
		boardmapper.blist().forEach(list -> log.info(list));
	}
	
	
	/*
	@Test
	public void testInsertBoard() {
	    BoardVO bo = new BoardVO();

	    bo.setUserid("admin");
	    bo.setSubject("테스트 중입니다");
	    bo.setContents("테스트 내용입니다");
	    bo.setFilename(null);
	    bo.setCount(1);

	    boardmapper.insertBoard(bo);
	    log.info(bo);
	}
*/
	
	
	/*
	@Test
	public void testUpdate( ) {
		ReplyVO reply = new ReplyVO();
		reply.setRenum(1L);
		reply.setBnum(7L);
		reply.setId("admin");
		reply.setRecontents("댓글 수정해본다");
		
		int count = boardmapper.Reupdate(reply);
		
		log.info(count);
		
	}
	*/
	
	
	

}
