package com.oasys.client.faq.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oasys.admin.faq.service.FaqService;
import com.oasys.common.faq.vo.FaqVO;
import com.oasys.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/faq/*")
@AllArgsConstructor
public class ClientFaqController {
	private FaqService faqService;
	
	//글목록 구현하기(페이징 처리 목록)
	@RequestMapping(value="/faqList", method = RequestMethod.GET)
	public String faqList(@ModelAttribute("data") FaqVO fvo, Model model ) {
		log.info("client faqList 메서드 호출");
		List<FaqVO> faqList = faqService.faqList(fvo);
		model.addAttribute("faqList", faqList);
		
		//전체 레코드수 구현
		int total = faqService.faqListCnt(fvo);
		model.addAttribute("pageMaker", new PageDTO(fvo, total));
		
		return "client/faq/faqList";
		
		
	}
}
