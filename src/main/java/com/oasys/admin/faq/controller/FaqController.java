package com.oasys.admin.faq.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oasys.admin.faq.service.FaqService;
import com.oasys.common.faq.vo.FaqVO;
import com.oasys.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/faq/*")
@AllArgsConstructor
public class FaqController {
	
	private FaqService faqService;
	
	//글목록 구현하기
	@RequestMapping(value="/faqList", method = RequestMethod.GET)
	public String faqList(@ModelAttribute("data") FaqVO fvo, Model model ) {
		
		List<FaqVO> faqList = faqService.faqList(fvo);
		model.addAttribute("faqList", faqList);
		
		//전체 레코드수 구현
		int total = faqService.faqListCnt(fvo);
		model.addAttribute("pageMaker", new PageDTO(fvo, total));
				
		return "admin/faq/faqList";
	}

	//글쓰기 화면(폼)(jsp) 출력하기
	@RequestMapping(value="/faqWrite")
	public String faqWrite(@ModelAttribute("data") FaqVO fvo, Model model) {
		
		return "admin/faq/faqWrite";
	}

	//글쓰기 구현
	@RequestMapping(value="/faqInsert", method = RequestMethod.POST)
	public String faqInsert(@ModelAttribute FaqVO fvo, Model model) {
		
		int result = 0;
		String url = "";
		
		result = faqService.faqInsert(fvo);
		if(result == 1) {
			url = "/admin/faq/faqList";
		}
		
		List<FaqVO> faqList = faqService.faqList(fvo);
		model.addAttribute("faqList", faqList);
		
		return "redirect:" + url;
		
		}
	
	//글 상세보기 구현
	@RequestMapping(value="/faqDetail", method = RequestMethod.GET)
	public String faqDetail(@ModelAttribute("data") FaqVO fvo, Model model) {
		
		FaqVO detail = faqService.faqDetail(fvo);
		model.addAttribute("detail", detail);
		
		return "admin/faq/faqDetail";
	}
	//수정폼(화면)
	@RequestMapping(value="/faqModify")
	public String updateForm(@ModelAttribute("data") FaqVO fvo, Model model) {
		
		FaqVO updateData = faqService.updateForm(fvo);
		
		model.addAttribute("updateData", updateData);
		
		return "admin/faq/faqModify";
	}

	//글수정
	@RequestMapping(value="/faqUpdate", method = RequestMethod.POST)
	public String faqUpdate(@ModelAttribute FaqVO fvo, RedirectAttributes ras) {
		
		int result = 0;
		String url = "";
		
		result = faqService.faqUpdate(fvo);
		ras.addFlashAttribute("data", fvo);
		
		if(result == 1) {
			url = "/admin/faq/faqDetail";
		}else {
			url = "/admin/faq/updateForm";
		}
		
		return "redirect:" + url;
	}

	//삭제구현
	@RequestMapping(value="/faqDelete")
	public String faqDelete(@ModelAttribute FaqVO fvo) {
		
		int result = 0;
		String url = "";
		
		result = faqService.faqDelete(fvo.getFa_num());
		
		if(result == 1) {
			url = "/admin/faq/faqList";
		}else {
			url= "/admin/faq/faqDetail?fa_num" + fvo.getFa_num();
		}
		
		return "redirect:" + url;
	}


}
