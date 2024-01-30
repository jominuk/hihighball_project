package org.hihigh.persistance;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.hihigh.domain.BoardVO;
import org.hihigh.domain.ReplyVO;

public interface BoardMapper {

	// 게시물 목록
	List<BoardVO> blist();
	
	// 내 게시물 목록
	List<BoardVO> myPostList(String id);
	
	// 게시물 입력
	void insertBoard(
		    @Param("id") String id,
		    @Param("subject") String subject,
		    @Param("contents") String contents,
		    @Param("postfile") String postfile,
		    @Param("profile") String profile);

	
	// 게시물 자세히 보기
	BoardVO read(Long bnum);
	
	// 게시물 수정
	// void postupdate(BoardVO board);

	void postupdate(
		    @Param("bnum") Long bnum,
		    @Param("profile") String profile,
		    @Param("subject") String subject,
		    @Param("postfile") String postfile,
		    @Param("contents") String contents);
	
	// 게시물 삭제
	int deletepost(Long bnum);
	
	// 게시물 조회 증가
	int upCount(Long bnum);
	
	// 게시물 총 수량
	int totalpost();

	// 게시물 검색
	List<BoardVO> search(@Param("keyfield") String keyfield, @Param("keyword") String keyword);
	
	// 댓글 CRUD
	int insertreply(ReplyVO reply);
	List<ReplyVO> getReplies(Long bnum);
	int Reupdate(ReplyVO reply);
	int deleteReply(Long renum);
	
	// 모든 댓글 불러오기
	List<ReplyVO> totalReply();
	
	// 좋아요 입력,삭제,조회
	void insertLike(Map<String, Object> paramMap);
	void deleteLike(Map<String, Object> paramMap);
	int isLiked(Map<String, Object> paramMap);
}
















