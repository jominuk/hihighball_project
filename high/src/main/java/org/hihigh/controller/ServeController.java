package org.hihigh.controller;

import org.hihigh.domain.EventVO;
import org.hihigh.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/serve/*")
public class ServeController {
	
	@Setter(onMethod_ = @Autowired)
	private EventService eventservice;
	
	// 예약 입력
    @GetMapping("/event")
	public void event() {}
    @PostMapping("/event")
    public String event(EventVO event, RedirectAttributes rttr) {
    	eventservice.insertevent(event);
    	rttr.addFlashAttribute("meg", "예약되었습니다!");
    	return "redirect:/serve/event";
    }
 
    @GetMapping("aboutus")
	public void aboutus() {}
    
    @GetMapping("products")
	public void products() {}
    
    @GetMapping("recipeintro")
	public void recipeintro() {}
    
}
