package org.hihigh.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.hihigh.domain.BoardVO;
import org.hihigh.domain.ReplyVO;
import org.hihigh.persistance.FamilyMapper;
import org.hihigh.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {
	
	@Setter(onMethod_= @Autowired)
	private BoardService boardservice;
	@Setter(onMethod_= @Autowired)
	private FamilyMapper familymapper;
	
	// 게시물 목록
	@GetMapping("/blist")
	public void blist(HttpSession session,Model model) {
		String userId = (String) session.getAttribute("idKey");
	    int totalPosts = boardservice.totalpost();
	    List<BoardVO> boardList = boardservice.blist();
	    
	    model.addAttribute("totalPosts", totalPosts);
	    model.addAttribute("userId", userId);
	    model.addAttribute("blist", boardList);
	}

	// 게시물 검색
	@PostMapping("/search")
	public String search(@RequestParam String keyfield, @RequestParam String keyword, Model model) {
	    List<BoardVO> searchResult = boardservice.search(keyfield, keyword);
	    model.addAttribute("blist", searchResult);
		return "/board/blist";
	}

	// 게시물 입력
	@GetMapping("/postform")
	public void postForm() {}
	
	@PostMapping("/postForm")
	public String postForm(
	        @RequestParam String id,
	        @RequestParam String subject,
	        @RequestParam String contents,
	        @RequestParam(required = false) MultipartFile postfile,
	        @RequestParam(required = false) String profile,
	        RedirectAttributes rttr,
	        HttpSession session) {
	    try {

	        if (postfile != null && !postfile.isEmpty()) {
	        	// 실제 톰켓 서버를 이용해서 이미지 업로드를 바로 진행할 수 있게 만듬
	        	String uploadPath = "C:/spring/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/high/resources/upload";
	        	// String uploadPath = "C:/spring-project/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/high/resources/upload";
	            String fileName = postfile.getOriginalFilename();
	            String filePath = uploadPath + File.separator + fileName;

	            postfile.transferTo(new File(filePath));
	        }
	        
	        boardservice.insertBoard(id, subject, contents, postfile != null ? postfile.getOriginalFilename() : null, profile);
	        
	        rttr.addFlashAttribute("meg", "suc");
	        return "redirect:/board/blist";
	    } catch (Exception e) {
	        e.printStackTrace();
	        rttr.addFlashAttribute("meg", "fal");
	        return "redirect:/board/blist";
	    }
	}
	
	// 게시물 자세히 보기
	@GetMapping("/read")
	public String read(@RequestParam("no") Long bnum, Model model) {
	    boardservice.upCount(bnum);

	    BoardVO board = boardservice.read(bnum);
	    model.addAttribute("board", board);

	    return "/board/read";
	}

	// 게시물 수정
	@GetMapping("/postupdate")
	public String postupdate(@RequestParam Long bnum, Model model) {
		BoardVO board = boardservice.read(bnum);
	    model.addAttribute("post", board);
	    
		return "/board/postupdate";
	}
	@PostMapping("/postupdate")
	public String postupdate(
	    @RequestParam Long bnum,
	    @RequestParam String profile,
	    @RequestParam String subject,
	    @RequestParam(required = false) MultipartFile postfile,
	    @RequestParam String contents,
	    HttpSession session,
	    RedirectAttributes rttr) {
		
	    try {
	        if (postfile != null && !postfile.isEmpty()) {
	            String uploadPath = "C:/spring/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/high/resources/upload";
	            //String uploadPath = "C:/spring-project/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/high/resources/upload";
	            String fileName = postfile.getOriginalFilename();
	            String filePath = uploadPath + File.separator + fileName;

	            // 기존 이미지가 존재하는지 확인
	            String existingFileName = (String) session.getAttribute("image");
	            if (existingFileName != null && !existingFileName.isEmpty()) {
	                File existingFile = new File(uploadPath + File.separator + existingFileName);
	                existingFile.delete();
	            }
	            
	            // 새로운 이미지를 업로드
	            postfile.transferTo(new File(filePath));
	            session.setAttribute("image", fileName);
	        }

	        boardservice.postupdate(bnum, profile, subject, postfile != null ? postfile.getOriginalFilename() : null, contents);
	        rttr.addFlashAttribute("meg", "suc");
	        
	        rttr.addAttribute("no", bnum);

	        return "redirect:/board/read";
	    } catch (Exception e) {
	        e.printStackTrace();
	        rttr.addFlashAttribute("meg", "fal");
	        return "redirect:/board/blist";
	    }
	}

	// 게시물 삭제
	@GetMapping("/deletepost")
	public String deletepost(@RequestParam("bnum") Long bnum, RedirectAttributes rttr, HttpSession session) {
	    String id = (String) session.getAttribute("idKey");
	    BoardVO board = boardservice.read(bnum);

	    if (board != null && (id.equals(board.getId()) || "admin".equals(id))) {
	        if (board.getPostfile() != null) {
	        	String uploadPath = "C:/spring/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/high/resources/upload";
	            //String uploadPath = "C:/spring-project/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/high/resources/upload";
	            String filePath = uploadPath + File.separator + board.getPostfile();
	            File file = new File(filePath);
	            if (file.exists()) file.delete();
	        }

	        int result = boardservice.deletepost(bnum);

	        if (result > 0) {
	            rttr.addFlashAttribute("YES", "삭제가 완료되었습니다!");
	        } else {
	            rttr.addFlashAttribute("errorMessage", "Failed to delete post");
	        }
	    } else {
	        rttr.addFlashAttribute("NO", "게시물을 삭제할 권한이 없습니다.");
	    }

	    return "redirect:/board/blist";
	}
	
	
	/* 댓글 ajax 와 json 구현*/
	@PostMapping(value = "/read", consumes = "application/json", produces= { MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insertreply(@RequestBody ReplyVO reply) {
		int result = boardservice.insertreply(reply);
		
		return result == 1 ? new ResponseEntity<>("success", HttpStatus.OK) 
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	@GetMapping(value = "/getReplies", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ReplyVO>> getRepliesAjax(@RequestParam Long bnum) {
	    List<ReplyVO> replies = boardservice.getReplies(bnum);
	    return new ResponseEntity<>(replies, HttpStatus.OK);
	}
	@DeleteMapping(value = "/{renum}", produces= { MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deleteReply(@PathVariable Long renum) {
		int result = boardservice.deleteReply(renum);
		
		return result == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	@RequestMapping(value="/{renum}", consumes="application/json", produces=MediaType.TEXT_PLAIN_VALUE, method={RequestMethod.PUT, RequestMethod.PATCH})
    public ResponseEntity<String> updateReply(@PathVariable Long renum, @RequestBody ReplyVO vo) {
        int result = boardservice.Reupdate(vo);
        
        return result == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
	
	
	
	// 좋아요 입력, 삭제
	@PostMapping("/toggleLike")
	@ResponseBody
	public String toggleLike(@RequestParam String id, @RequestParam int bnum) {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("id", id);
	    paramMap.put("bnum", bnum);

	    int likeCount = boardservice.isLiked(paramMap);

	    if (likeCount > 0) {
	        boardservice.deleteLike(paramMap);
	        return "unliked";
	    } else {
	        boardservice.insertLike(paramMap);
	        return "liked";
	    }
	}

	// 좋아요 상태 조회
	@GetMapping("/getLikeStatus")
	@ResponseBody
	public String getLikeStatus(@RequestParam String id, @RequestParam int bnum) {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("id", id);
	    paramMap.put("bnum", bnum);

	    int likeCount = boardservice.isLiked(paramMap);

	    return likeCount > 0 ? "liked" : "unliked";
	}

}





















