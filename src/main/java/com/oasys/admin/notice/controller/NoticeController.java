package com.oasys.admin.notice.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oasys.admin.notice.service.NoticeService;
import com.oasys.common.notice.vo.NoticeVO;
import com.oasys.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/notice/*")
@AllArgsConstructor
public class NoticeController {

	private NoticeService noticeService;
	
	
	@GetMapping(value = "/noticeList")
	public String noticeList(@ModelAttribute("data") NoticeVO nvo , Model model) {
		log.info("noticeList 호출성공");
		log.info("keyword :" + nvo.getKeyword());
		log.info("search : " + nvo.getSearch());
		
		List<NoticeVO> noticeList = noticeService.noticeList(nvo);
		model.addAttribute("noticeList",noticeList);
		
	int total = noticeService.noticeListCnt(nvo);
		model.addAttribute("pageMaker", new PageDTO(nvo, total));
		
		return "admin/notice/noticeList";
	}
	
	/************************
	 * 글쓰기 폼 출력하기
	 ************************/
	@RequestMapping(value = "/noticeWriteForm")
	public String writeForm(@ModelAttribute("data") NoticeVO nvo) {
		log.info("writeForm 호출 성공");
	
		return "admin/notice/noticeWriteForm";
	}
	
	/************************
	 * 새 게시물 등록
	 ************************/
	@RequestMapping(value = "/noticeInsert" , method = RequestMethod.POST)
	public String noticeInsert(NoticeVO nvo , Model model) {
		log.info("noticeInsert 호출성공");
		
		int result = 0;
		String url = "";
		
		result = noticeService.noticeInsert(nvo);
		if(result == 1) {
			url = "/admin/notice/noticeList";
			}
		
		return "redirect:"+url; 
		}

		/************************
		 * 글 상세보기 구현
		 ************************/
		@RequestMapping(value = "/noticeDetail" , method= RequestMethod.GET)
		public String noticeDetail(@ModelAttribute("data") NoticeVO nvo, Model model) {
			log.info("noticeDetail 호출 설공");
			log.info("nvo" + nvo);
		
			NoticeVO detail = noticeService.noticeDetail(nvo);
			model.addAttribute("detail" , detail);
		
			return "admin/notice/noticeDetail";
		}
		
		
		/************************
		 * 글 수정
		 ************************/
		@RequestMapping(value="/noticeUpdateForm")
		public String noticeUpdateForm(@ModelAttribute("data") NoticeVO nvo, Model model ) {
		log.info("noticeUpdateForm 호출성공");
		log.info("n_num = " + nvo.getN_num());
		
		NoticeVO updateData = noticeService.updateForm(nvo);
		
		model.addAttribute("updateData" , updateData);
		
		return "admin/notice/noticeUpdateForm";		
	}
		
		/************************
		 * 게시물 수정
		 ************************/
		@RequestMapping(value="/noticeUpdate" , method = RequestMethod.POST)
		public String noticeUpdate(@ModelAttribute NoticeVO nvo, RedirectAttributes ras) {
			log.info("noticeupdate 호출성공");
			
			int result = 0;
			String url = "";
			
			result = noticeService.noticeUpdate(nvo);
			ras.addFlashAttribute("data" , nvo);
		
			if(result == 1) {
				url="/admin/notice/noticeDetail";
			}else {
				url="/admin/notice/noticeUpdateForm";
			}
			
			return "redirect:" + url;
		}
		
		/************************
		 * 게시물 삭제
		 ************************/
		@RequestMapping(value="/noticeDelete")
		public String noticeDelete(@ModelAttribute NoticeVO nvo) {
			log.info("noticeDelete 호출성공");
			
			int result = 0;
			String url = "";
			
			result = noticeService.noticeDelete(nvo.getN_num());
			
			if(result == 1) {
				url = "/admin/notice/noticeList";
			}else {
				url="/admin/notice/noticeDetail?j_no = " + nvo.getN_num();
			}
		
			return "redirect:" + url;
		
		}
		
	
}
