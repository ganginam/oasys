package com.oasys.admin.faq.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oasys.admin.faq.service.FaqService;
import com.oasys.common.faq.vo.FaqVO;
import com.oasys.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/faq/*")
@AllArgsConstructor
public class FaqController {
	
	private FaqService faqService;
	
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

	
	/************************
	 * �글쓰기 폼 출력하기
	 ************************/
	@RequestMapping(value="/faqWrite")
	public String faqWrite(@ModelAttribute("data") FaqVO fvo, Model model) {
		log.info("faqWrite  호출성공");
		
		return "faq/faqWrite";
	}
	
	
	/************************
	 * �� �Խù� ���
	 ************************/
	@RequestMapping(value="/faqInsert", method = RequestMethod.POST)
	public String faqInsert(@ModelAttribute FaqVO fvo, Model model) {
		log.info("faqInsert 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = faqService.faqInsert(fvo);
		if(result == 1) {
			url= "/faq/faqList";
		}/* else {
			model.addAttribute("code", 1);
			url = "/board/writeForm";
		}*/
		
		
		List<FaqVO> faqList = faqService.faqList(fvo);
		model.addAttribute("faqList", faqList);
		
		return "redirect:" + url;
	}
	
	/************************
	 * 글 상세보기 구현
	 ************************/
	@RequestMapping(value="/faqDetail", method = RequestMethod.GET)
	public String faqDetail(@ModelAttribute("data") FaqVO fvo, Model model) {
		log.info("faqDetail 호출 성공");
		log.info("fvo = " + fvo);
		log.info("fa_num = " + fvo.getFa_num());
		
		FaqVO detail = faqService.faqDetail(fvo);
		model.addAttribute("detail", detail);
		
		return "faq/faqDetail";
	}
	
	
	
	/************************
	 *수정폼
	 *@param : b_num
	 *@return : BoardVO
	 ************************/
	@RequestMapping(value="/faqUpdate")
	public String updateForm(@ModelAttribute("data") FaqVO fvo, Model model) {
		log.info("faqUpdate 호출성공");
		log.info("fa_num = " + fvo.getFa_num());
		
		FaqVO updateData = faqService.faqUpdate(fvo);
		
		model.addAttribute("updateData", updateData);
		
		return "/faq/faqUpdate";
	}
	
	/************************
	 * 글 수정 구현하기
	 ************************/
	@RequestMapping(value="/faqUpdate", method = RequestMethod.POST)
	public String faqUpdate(@ModelAttribute FaqVO fvo, RedirectAttributes ras) {
		log.info("faqUpdate 호출성공");
		
		int result = 0;
		String url = "";
		
		result = faqService.faqUpdate(fvo);
		ras.addFlashAttribute("data", fvo); 
		
		if(result == 1) {
			//url= "/board/boardDetail?b_num=" + bvo.getB_num();
			url= "/faq/faqDetail";
		} else {
			//url= "/board/updateForm?b_num=" + bvo.getB_num();	
			url= "/faq/faqUpdate";	
		}
		
		return "redirect:" + url; 
	}
	
	/************************
	 * �Խù� ����
	 ************************/
	@RequestMapping(value="/faqDelete")
	public String faqDelete(@ModelAttribute FaqVO fvo) {
		log.info("faqDelete 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = faqService.faqDelete(fvo.getFa_num());
		
		if(result == 1) {
			url = "/faq/faqList";
		}else {
			url= "/faq/faqDetail?fa_num=" + fvo.getFa_num();
		}
		
		return "redirect:" + url;
	}
	
}
