package org.hihigh.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.hihigh.domain.BoardVO;
import org.hihigh.domain.EventVO;
import org.hihigh.domain.FamilyVO;
import org.hihigh.domain.Page;
import org.hihigh.domain.ReplyVO;
import org.hihigh.persistance.EventMapper;
import org.hihigh.persistance.FamilyMapper;
import org.hihigh.service.BoardService;
import org.hihigh.service.FamilyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/family/*")
@Log4j
public class FamilyController {
	
	@Setter(onMethod_=@Autowired)
	private FamilyMapper familymapper;
	@Setter(onMethod_=@Autowired)
	private FamilyService familyservice;
	@Setter(onMethod_= @Autowired)
	private BoardService boardservice;
	@Setter(onMethod_= @Autowired)
	private EventMapper eventservice;
	
	@PostMapping(value="/idcheckes", produces="text/plain; charset=UTF-8")
	public ResponseEntity<String> selectId(String id) {
	    boolean result = familymapper.selectId(id);
	    log.info(id);

	    if (result) {
	        return new ResponseEntity<>("이미 ID가 있습니다..", HttpStatus.OK);
	    } else {
	        return new ResponseEntity<>("사용 가능한 ID 입니다 !!", HttpStatus.OK);
	    }
	}
	
	@GetMapping("/family/joinForm")
	public void joinForm() {}

	@PostMapping("/joinForm")
	public String joinForm(FamilyVO family, RedirectAttributes rttr) {
	    try {
	        familymapper.insertMember(family);
	        rttr.addFlashAttribute("joinMeg", "회원가입 성공!");
	    } catch (Exception e) {
	        rttr.addFlashAttribute("joinMeg", "failed!");
	    }
	    
	    return "redirect:/family/login";
	}

	@GetMapping("/idfind")
	public void idfind() {}
	@PostMapping("/idfind")
	public String idfinds(@RequestParam String name, @RequestParam String email, FamilyVO fvo, Model model) {
		try {
			fvo.setName(name);
			fvo.setEmail(email);
			
			FamilyVO id = familymapper.idfind(fvo);
			
			model.addAttribute("findId", id);
		}catch (Exception e) {
			model.addAttribute("msg", "오류가 발생되었습니다.");
			e.printStackTrace();
		}
		return "family/idfind";
	}
	
	@GetMapping("/pwdfind")
	public void pwdfind() {}
	@PostMapping("/pwdfind")
	public void pwdfinds(@RequestParam String id, @RequestParam String name, FamilyVO fvo, Model model) {
		try {
			fvo.setId(id);
			fvo.setName(name);
			
			int search = familymapper.pwdfind(fvo);

			if(search == 0) {
				model.addAttribute("msg", "기입된 정보가 잘못되었습니다. 다시 입력해주세요.");
			}
			
			String newpwd = RandomStringUtils.randomAlphanumeric(10);
			fvo.setPwd(newpwd);
			familymapper.pwdUpdate(fvo);
			model.addAttribute("newPwd", newpwd);

		}catch (Exception e) {
			model.addAttribute("msg", "오류가 발생되었습니다.");
			e.printStackTrace();
		}
	}

	
	
	@GetMapping("/login")
	public String login() {
	    return "family/login";
	}
	@PostMapping("/login")
	public String login(FamilyVO fvo, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
	    FamilyVO name = familymapper.login(fvo);

	    if (name != null) {
	        session.setAttribute("idKey", fvo.getId());
	        redirectAttributes.addFlashAttribute("message", "suc");
	        
	        String profileImg = familymapper.selectImg(fvo.getId());
	        
	        session.setAttribute("profileImg", profileImg);
	        
	        return "redirect:/";
	    } else {
	        model.addAttribute("message", "error");
	        return "family/login";
	    }
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session,RedirectAttributes redirectAttributes) {
	    session.removeAttribute("idKey");
	    session.removeAttribute("img");
	    session.invalidate();
	    redirectAttributes.addFlashAttribute("msg", "logout");
	    return "redirect:/";
	}
	
	@PostMapping("/admDelete")
	public String admdelMem(@RequestParam("id") String id) {
	    familymapper.admdelMem(id);
	    return "redirect:/family/admmanage";
	}
	
	@GetMapping("/mypageSelect")
	public void mypageSelect() {}
	
	@GetMapping("/mypage")
    public String mypage(HttpSession session, Model model) {
		String id = (String) session.getAttribute("idKey");
        FamilyVO myInfo = familymapper.getMyInfo(id);
        
        model.addAttribute("myInfo", myInfo);

        return "family/mypage";
    }
	
	@PostMapping("/deletemember")
	public String deletemember(String id, HttpSession session) {
	    familymapper.admdelMem(id);
	    
	    session.invalidate();
	    
	    return "redirect:/";
	}
	

	@GetMapping("/updateform")
	public String showUpdateForm(HttpSession session, Model model) {
	    String id = (String) session.getAttribute("idKey");
	    FamilyVO myInfo = familymapper.getMyInfo(id);

	    model.addAttribute("myInfo", myInfo);
	    
        return "/family/updateform";
	}
	
	@PostMapping("/updateform")
	public String updateMember( 
			@RequestParam String id,
			@RequestParam(required = false) MultipartFile filename,
			@RequestParam String pwd,
			@RequestParam String tel,
			@RequestParam String email,	
			HttpSession session,
			RedirectAttributes rttr) {
		try {
			if(filename != null && !filename.isEmpty()) {
				String uploadPath = "C:/spring/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/high/resources/profile";
				// String uploadPath = "C:/spring-project/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/high/resources/profile";
	            String fileName = filename.getOriginalFilename();
	            String filePath = uploadPath + File.separator + fileName;
	            
	            String existingFileName = (String) session.getAttribute("profileImg");
	            if (existingFileName != null && !existingFileName.isEmpty()) {
	                File existingFile = new File(uploadPath + File.separator + existingFileName);
	                existingFile.delete();
	            }
	            filename.transferTo(new File(filePath));
	            
	            session.setAttribute("profileImg", fileName);
			}
			
			familymapper.updateMember(id, filename != null ? filename.getOriginalFilename() : null, pwd, tel, email);
			rttr.addFlashAttribute("meg", "suc");
			
			return "redirect:/family/mypage";
		}catch (Exception e) {
			e.printStackTrace();
		    rttr.addFlashAttribute("meg", "fal");
	        return "redirect:/family/mypage";
		}
	}
	
	@GetMapping("/admmanage")
	public String getTotalAge(
			@RequestParam(name = "num", defaultValue = "1") int num,
			HttpSession session, 
			Model model) {
		
		Page page = new Page();

		
		page.setNum(num);
		page.setCount(familymapper.count());
		
		List<FamilyVO> list = familymapper.mlistPage(page.getDisplayPost(), page.getPostNum());
		List<EventVO> elist = familymapper.admReser();
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		
		model.addAttribute("elist", elist);
		
		
		List<Map<String, Object>> ageCounts = familyservice.TotalAge();
		model.addAttribute("ageCounts", ageCounts);
		
		model.addAttribute("Balgre20", familyservice.Balgre("20대"));
	    model.addAttribute("Balgre30", familyservice.Balgre("30대"));
	    model.addAttribute("Balgre40", familyservice.Balgre("40대"));
	    model.addAttribute("Balgre50", familyservice.Balgre("50대"));
	    model.addAttribute("Balgre60", familyservice.Balgre("60대"));
	    
	    model.addAttribute("Perge20", familyservice.Perge("20대"));
	    model.addAttribute("Perge30", familyservice.Perge("30대"));
	    model.addAttribute("Perge40", familyservice.Perge("40대"));
	    model.addAttribute("Perge50", familyservice.Perge("50대"));
	    model.addAttribute("Perge60", familyservice.Perge("60대"));
	    
	    model.addAttribute("Fimrico20", familyservice.Fimrico("20대"));
	    model.addAttribute("Fimrico30", familyservice.Fimrico("30대"));
	    model.addAttribute("Fimrico40", familyservice.Fimrico("40대"));
	    model.addAttribute("Fimrico50", familyservice.Fimrico("50대"));
	    model.addAttribute("Fimrico60", familyservice.Fimrico("60대"));
	    
	    model.addAttribute("National20", familyservice.National("20대"));
	    model.addAttribute("National30", familyservice.National("30대"));
	    model.addAttribute("National40", familyservice.National("40대"));
	    model.addAttribute("National50", familyservice.National("50대"));
	    model.addAttribute("National60", familyservice.National("60대"));
	    
	    model.addAttribute("Geo20", familyservice.Geo("20대"));
	    model.addAttribute("Geo30", familyservice.Geo("30대"));
	    model.addAttribute("Geo40", familyservice.Geo("40대"));
	    model.addAttribute("Geo50", familyservice.Geo("50대"));
	    model.addAttribute("Geo60", familyservice.Geo("60대"));
	    
	    
		String userId = (String) session.getAttribute("idKey");
	    int totalPosts = boardservice.totalpost();
	    List<BoardVO> boardList = boardservice.blist();
	    
	    model.addAttribute("totalPosts", totalPosts);
	    model.addAttribute("userId", userId);
	    model.addAttribute("blist", boardList);
	    

	    List<ReplyVO> replylist = boardservice.totalReply();
	    model.addAttribute("replyli",replylist);
	    
	    return "/family/admmanage";
	}

	
	@GetMapping("/myPostList")
	public void mypostListController(Model model, HttpSession session) {
	    String id = (String) session.getAttribute("idKey");
	    model.addAttribute("mypostlist", boardservice.myPostList(id));
	}
	@GetMapping("/myReservation")
	public void myReservation(Model model, HttpSession session) {
		String id = (String)session.getAttribute("idKey");
		model.addAttribute("ReserList", familyservice.myReservation(id));
	}
	


	
	@GetMapping("/balgre")
	public String getBalgreEvents(Model model) {
		List<EventVO> balgreEvents = familyservice.getBalgre("발그레");
		model.addAttribute("events", balgreEvents);
		return "/family/balgre";
	}
	
	@PostMapping("/approveEvent")
	public String approveEvent(@RequestParam String id, @RequestParam String company, Model model) {
	    familyservice.approveEvent(id, company);

	    model.addAttribute("statusUpdate", true);

	    return "/family/balgre";
	}
	
	@PostMapping("/rejectEvent")
	public String rejectEvent(@RequestParam String id, Model model) {
	    familyservice.deleteById(id);

	    model.addAttribute("deleteUpdate", true);

	    return "/family/balgre";
	}

	
	
	@GetMapping("/kakaologin")
	public void kakaologin() {}
	
	@GetMapping("/login/oauth2/kakao")
	public String getAccessToken(@RequestParam("code") String code) {
		System.out.println("code = " + code);
		String clientId = "5333275e13f509e7d6bfa4bf7b2a093c";
		String clientSecret = "your_actual_kakao_client_secret";
		String redirectUri = "http://localhost:8080/family/login/oauth2/kakao";
		String grantType = "authorization_code";

		 String tokenUrl = "https://kauth.kakao.com/oauth/token?" +
                 "grant_type=" + grantType +
                 "&client_id=" + clientId +
                 "&client_secret=" + clientSecret +
                 "&redirect_uri=" + redirectUri +
                 "&code=" + code;
		 
		    RestTemplate restTemplate = new RestTemplate();
		    ResponseEntity<String> response = restTemplate.postForEntity(tokenUrl, null, String.class);

		    String accessToken = extractAccessToken(response.getBody());
		    
        return "home";
	}
	
	private String extractAccessToken(String responseBody) {
	    return "your_access_token";
	}
	
}














