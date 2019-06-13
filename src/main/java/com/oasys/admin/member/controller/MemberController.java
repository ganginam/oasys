package com.oasys.admin.member.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oasys.admin.member.service.MemberService;
import com.oasys.common.member.vo.MemberVO;
import com.oasys.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value="/admin/member/*")
@AllArgsConstructor
public class MemberController {
	private MemberService memberService;
	
	@RequestMapping(value="/memberList")
	public String memberList(@ModelAttribute("data") MemberVO mvo, Model model) {
		log.info("memberList 호출...");
		log.info("search : " + mvo.getSearch());
		log.info("keyword : " + mvo.getKeyword());
		
		List<MemberVO> memberList = memberService.memberList(mvo);
		List<MemberVO> adminList = memberService.adminList(mvo);
		model.addAttribute("memberList", memberList);
		model.addAttribute("adminList", adminList);
		
		int total = memberService.memberListCnt(mvo);
		log.info("membercnt : " + total);
		model.addAttribute("pageMaker", new PageDTO(mvo, total));
		
		return "admin/member/memberList";
	}
	
	
	@RequestMapping(value="/mgrade")
	public String memberGrade() {
		return "admin/member/adminExample";
	}
	
//	@RequestMapping(value="login", method=RequestMethod.POST)
//	public ModelAndView adminCheck(@ModelAttribute MemberVO mvo, ModelAndView mav) {
//		log.info("adminCheck 호출 성공");
//		
//		String m_type = mvo.getM_type();
//		
//		MemberVO adminCheckResult = memberService.adminCheck(m_type);
//		
//		if(adminCheckResult == null) {
//			mav.addObject("codeNumber", 1);
//			mav.setViewName("common/login");
//			return mav;
//		}else {
//			mav.addObject("admin", adminCheckResult);
//			mav.setViewName("admin");
//			return mav;
//		}
//	}
}
