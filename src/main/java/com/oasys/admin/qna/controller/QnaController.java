package com.oasys.admin.qna.controller;


import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oasys.admin.qna.service.QnaService;
import com.oasys.common.qna.vo.QnaVO;
import com.oasys.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/qna/*")
@AllArgsConstructor

public class QnaController {

	private QnaService qnaService;
	
	//글목록 구현하기
	@RequestMapping(value="qnaList", method = RequestMethod.GET)
	public String qnaList(@ModelAttribute("data") QnaVO qvo, Model model) {
		log.info("qnaList 호출성공");
		log.info("keyword: " + qvo.getKeyword());
		log.info("search :" + qvo.getSearch());
		
		List<QnaVO> qnaList = qnaService.qnaList(qvo);
		model.addAttribute("qnaList", qnaList);
		
		//전체 레코드수 구현
		int total = qnaService.qnaListCnt(qvo);
		model.addAttribute("pageMaker", new PageDTO(qvo, total));
		
		return "admin/qna/qnaList";
	}
	
	//글쓰기 폼 출력하기
	@RequestMapping(value="/qnaWrite")
	public String qnaWrite(@ModelAttribute("data") QnaVO qvo, Model model) {
	
		return "admin/qna/qnaWrite";
	}
	//글쓰기 구현
	@RequestMapping(value="/qnaInsert", method = RequestMethod.POST)
	public String qnaInsert(@ModelAttribute QnaVO qvo, Model model) {
		
		int result = 0;
		String url = "";
		//qvo.setQa_anstatus("답변확인");
		
		result = qnaService.qnaInsert(qvo);
		if(result == 1) {
			url = "/admin/qna/qnaList";
		}
	
		List<QnaVO> qnaList = qnaService.qnaList(qvo);
		model.addAttribute("qnaList", qnaList);
		
		return "redirect:" + url;
		}
	
	//글 상세보기 구현
	@RequestMapping(value="/qnaDetail", method = RequestMethod.GET)
	public String qnaDetail(@ModelAttribute("data") QnaVO qvo, Model model) {
		log.info("detail 호출 성공");
		QnaVO detail = qnaService.qnaDetail(qvo);
		model.addAttribute("detail", detail);
		
		return "admin/qna/qnaDetail";
		}
	//수정폼(화면)
	@RequestMapping(value="/qnaUpdateForm")
	public String qnaUpdateForm(@ModelAttribute("data") QnaVO qvo, Model model) {
		
		QnaVO updateData = qnaService.qnaupdateForm(qvo);
		
		model.addAttribute("updateData", updateData);
		
		return "admin/qna/qnaUpdateForm";
	}
		
	//글수정
	@RequestMapping(value="/qnaUpdate", method = RequestMethod.POST)
	public String qnaUpdate(@ModelAttribute QnaVO qvo, RedirectAttributes ras) {
		
		int result = 0;
		String url = "";
		
		result = qnaService.qnaUpdate(qvo);
		ras.addFlashAttribute("data", qvo);
		
		if(result == 1) {
			url = "/admin/qna/qnaDetail";
		}else {
			url = "/admin/qna/qnaUpdateForm";
		}
		return "redirect:" + url;
	}
	
	//패스워드 확인
	@ResponseBody
	@RequestMapping(value="/pwdConfirm", method=RequestMethod.POST, produces= "text/plain; charset=UTF-8" )
	public String pwdConfirm(QnaVO qvo) {
		log.info("pwdConfirm 호출성공");
		String value = "";
		
		int result = qnaService.pwdConfirm(qvo);
		if(result==1) {
			value = "성공";
		}else {
			value = "실패";
		}
		log.info("result = " + result);
	
		return value;
	
	}
	
	//삭제
	@RequestMapping(value="/qnaDelete")
	public String qnaDelete(@ModelAttribute QnaVO qvo) {
		log.info("qnaDelete 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = qnaService.qnaDelete(qvo.getQa_num());
		
		if(result == 1) {
			url = "/admin/qna/qnaList";
		}else {
			url = "/admin/qna/qnaDetail?qa_num=" + qvo.getQa_num();
		}
		
		return "redirect:" + url;
	}

	//글 삭제전 댓글 개수 구현
	@ResponseBody
	@RequestMapping(value="/replyCnt")
	public String replyCnt(@RequestParam("qa_num") int qa_num) {
		log.info("replyCnt 호출 성공");
		
		int result = 0;
		result = qnaService.replyCnt(qa_num);
		return String.valueOf(result);
	}
}
