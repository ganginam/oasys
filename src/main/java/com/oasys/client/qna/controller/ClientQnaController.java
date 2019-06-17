package com.oasys.client.qna.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oasys.client.qna.service.ClientQnaService;
import com.oasys.common.qna.vo.QnaVO;
import com.oasys.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/qna/*")
@AllArgsConstructor
public class ClientQnaController {
	
	private ClientQnaService clientQnaService;
	
	//글목록 구현하기
		@RequestMapping(value="qnaList", method = RequestMethod.GET)
		public String qnaList(@ModelAttribute("data") QnaVO qvo, Model model) {
			log.info("qnaList 호출성공");
			log.info("keyword: " + qvo.getKeyword());
			log.info("search :" + qvo.getSearch());
			
			List<QnaVO> qnaList = clientQnaService.qnaList(qvo);
			model.addAttribute("qnaList", qnaList);
			
			//전체 레코드수 구현
			int total = clientQnaService.qnaListCnt(qvo);
			model.addAttribute("pageMaker", new PageDTO(qvo, total));
			
			return "/client/qna/qnaList";
		}
		
	//글쓰기 폼 출력하기
		@RequestMapping(value="/qnaWrite")
		public String qnaWrite(@ModelAttribute("data") QnaVO qvo, Model model) {
			
			return "/client/qna/qnaWrite";
		
		}
	//글쓰기 구현
	@RequestMapping(value="/qnaInsert", method = RequestMethod.POST)
	public String qnaInsert(@ModelAttribute QnaVO qvo, Model model) {
		
		int result = 0;
		String url = "";
		
		qvo.setQa_anstatus("답변확인");
		result = clientQnaService.qnaInsert(qvo);
		if(result == 1) {
			url = "client/qna/qnaList";
		}
		List<QnaVO> qnaList = clientQnaService.qnaList(qvo);
		model.addAttribute("qnaList", qnaList);
		
		return "redirect:" + url;
	}
	
	//글 상세보기 구현
	@RequestMapping(value="/qnaDetail", method = RequestMethod.GET)
	public String qnaDetail(@ModelAttribute("data") QnaVO qvo, Model model) {
		log.info("클라이언트  detail 호출");
		QnaVO detail = clientQnaService.qnaDetail(qvo);
		model.addAttribute("detail", detail);
		
		return "/client/qna/qnaDetail";
		}

	//패스워드 확인
	@ResponseBody
	@RequestMapping(value="/pwdConfirm", method=RequestMethod.POST, produces= "text/plain; charset=UTF-8")
	public String pwdConfirm(QnaVO qvo) {
		log.info("pwdConfirm 호출성공");
		String value = "";
		
		int result = clientQnaService.pwdConfirm(qvo);
		if(result==1) {
			value = "성공";
		}else {
			value = "실패";
		}
		log.info("result = " + result);
		
		return value;
	}
	
	//수정폼
	@RequestMapping(value="/updateForm")
	public String updateForm(@ModelAttribute("data") QnaVO qvo, Model model) {
		
		QnaVO updateData = clientQnaService.updateForm(qvo);
		
		model.addAttribute("updateData", updateData);
		
		return "client/qna/qnaUpdate";
	}
	//글 수정 구현
	@RequestMapping(value="/qnaUpdate", method = RequestMethod.POST)
	public String qnaUpdate(@ModelAttribute QnaVO qvo, RedirectAttributes ras) {
		log.info("qnaUpdate 호출성공");
		
		int result = 0;
		String url = "";
		
		qvo.setQa_anstatus("답변확인");
		
		result = clientQnaService.qnaUpdate(qvo);
		ras.addFlashAttribute("data", qvo);
		
		if(result == 1) {
			url="client/qna/qnaDetail";
		}else {
			url="client/qna/qnaUpdate";
		}
	
		return "redirect:" + url;
	}
	
	//삭제
	@RequestMapping(value="/qnaDelete")
	public String qnaDelete(@ModelAttribute QnaVO qvo) {
		log.info("qnaDelete 호출성공");
		int result = 0;
		String url = "";
		
		result = clientQnaService.qnaDelete(qvo.getQa_num());
		
		if(result == 1) {
			url = "client/qna/qnaList";
		}/*else {
			url="/qna/qnaDetail?qa_num=" + qvo.getQa_num();
		}*/

		return "redirect:" + url;
	}
	
	//글삭제전 댓글개수 구현
	@ResponseBody
	@RequestMapping(value="/replyCnt")
	public String replyCnt(@RequestParam("qa_num") int qa_num) {
		
		int result = 0;
		result = clientQnaService.replyCnt(qa_num);
		return String.valueOf(result);
	}
}

