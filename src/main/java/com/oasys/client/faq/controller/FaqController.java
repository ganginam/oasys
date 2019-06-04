package com.oasys.client.faq.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oasys.client.faq.service.FaqService;
import com.oasys.common.faq.vo.FaqVO;
import com.oasys.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/faq/*")

public class FaqController {
	
	private FaqService boardService;
	
	/***************************************
	 * 글목록 구현하기(페이징 처리 목록)
	 *******************************************/
	@RequestMapping(value="/faqList", method = RequestMethod.GET)
	public String faqList(@ModelAttribute("data") FaqVO fvo, Model model ){
		log.info("faqList 호출성공");
		log.info("keyword: " + fvo.getKeyword());
		log.info("search :" + fvo.getSearch());
		
		
		List<FaqVO> faqList = faqService.faqList(fvo);
		model.addAttribute("faqList", faqList);
		
	}
}