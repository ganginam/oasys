package com.oasys.client.notice.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oasys.admin.notice.service.NoticeService;
import com.oasys.common.notice.vo.NoticeVO;
import com.oasys.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/notice/*")
@AllArgsConstructor	
public class ClientNoticeController {

		private NoticeService noticeService;
	
	
	@GetMapping(value = "/noticeList")
	public String noticeeList(@ModelAttribute("data") NoticeVO nvo , Model model) {
		log.info("noticeList 호출성공");
		log.info("keyword :" + nvo.getKeyword());
		log.info("search : " + nvo.getSearch());
		
		List<NoticeVO> noticeList = noticeService.noticeList(nvo);
		model.addAttribute("noticeList",noticeList);
		
	int total = noticeService.noticeListCnt(nvo);
		model.addAttribute("pageMaker", new PageDTO(nvo, total));
		
		return "client/notice/noticeList";
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
		
			return "client/notice/noticeDetail";
		}
}
