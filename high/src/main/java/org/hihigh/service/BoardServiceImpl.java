package org.hihigh.service;

import java.util.List;
import java.util.Map;

import org.hihigh.domain.BoardVO;
import org.hihigh.domain.ReplyVO;
import org.hihigh.persistance.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_= @Autowired)
	private BoardMapper boardmapper;
	
	@Override
	public List<BoardVO> blist() {
		log.info("============bList ===========");
		return boardmapper.blist();
	}

	
	
    @Override
    public BoardVO read(Long bnum) {
        return boardmapper.read(bnum);
    }

	@Override
	public int deletepost(Long bnum) {
		return boardmapper.deletepost(bnum);
	}

	@Override
	public int upCount(Long bnum) {
		return boardmapper.upCount(bnum);
	}

	@Override
	public int totalpost() {
	    return boardmapper.totalpost();
	}

	@Override
	public List<BoardVO> search(String keyfield, String keyword) {
	    return boardmapper.search(keyfield, keyword);
	}
	/*
	@Override
	public void postupdate(BoardVO board) {
		boardmapper.postupdate(board);
	}*/
	
	@Override
	public int insertreply(ReplyVO reply) {
		log.info("register......" + reply);
		return boardmapper.insertreply(reply);
	}

	@Override
	public List<ReplyVO> getReplies(Long bnum) {
		return boardmapper.getReplies(bnum);
	}

	@Override
	public int deleteReply(Long renum) {
		return boardmapper.deleteReply(renum);
	}

	@Override
	public int Reupdate(ReplyVO reply) {
		return boardmapper.Reupdate(reply);
	}

	@Override
	public void insertLike(Map<String, Object> paramMap) {
		boardmapper.insertLike(paramMap);
	}

	@Override
	public void deleteLike(Map<String, Object> paramMap) {
		boardmapper.deleteLike(paramMap);
	}

	@Override
	public int isLiked(Map<String, Object> paramMap) {
		return boardmapper.isLiked(paramMap);
	}

	@Override
	public List<BoardVO> myPostList(String id) {
	    return boardmapper.myPostList(id);
	}

	@Override
	public void postupdate(Long bnum,String profile, String subject, String postfile, String contents) {
		boardmapper.postupdate(bnum, profile, subject, postfile, contents);
	}

	@Override
	public void insertBoard(String id, String subject, String contents, String postfile, String profile) {
		boardmapper.insertBoard(id, subject, contents, postfile, profile);
	}



	@Override
	public List<ReplyVO> totalReply() {
		return boardmapper.totalReply();
	}



	

}










