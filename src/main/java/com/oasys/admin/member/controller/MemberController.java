package com.oasys.admin.member.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSessionException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oasys.admin.booking.service.BookingService;
import com.oasys.admin.member.service.MemberService;
import com.oasys.common.booking.vo.BookingVO;
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
	private BookingService bookingService;
	
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
	
	@RequestMapping(value="/memberDetail")
	public String memberDetail(String m_no, Model model) {
		log.info("memberDetail 호출...");
		log.info("m_no : " + m_no);
		
		MemberVO mvo = memberService.memberDetail(Integer.parseInt(m_no));
		model.addAttribute("mData", mvo);
		
		List<BookingVO> bvo = bookingService.memberBookingList(Integer.parseInt(m_no));
		model.addAttribute("bookingList", bvo);
		
		return "admin/member/memberDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="/adminDelete")
	public String adminDelete(String m_no) {
		log.info("adminDelete 호출");
		log.info(m_no);
		
		String result = "";
		
		int value = memberService.adminDelete(Integer.parseInt(m_no));
		
		if(value==1) {
			result = "성공";
		}else {
			result = "실패";
		}
		
		return result;
	}
	
	
	@RequestMapping(value="/mgrade")
	public String memberGrade(@ModelAttribute("data") MemberVO mvo, Model model) {
		log.info("memberGrade 호출...");
		
		List<MemberVO> mbGradeList = memberService.memberGradeList(mvo);
		model.addAttribute("mbGradeList", mbGradeList);
		
		int total = memberService.memberListCnt(mvo);
		log.info("membercnt : " + total);
		model.addAttribute("pageMaker", new PageDTO(mvo, total));
	
		return "admin/member/mgrade";
	}
	
	@RequestMapping(value="/gradeDataUpdate")
	public String gradedataUpdate() {
		log.info("gradedataUpdate 호출..");
		
		String result = "";
		
		try {
			memberService.gradeDataUpgradeToGold();
			memberService.gradeDataUpgradeToVIP();
			memberService.gradeDataUpgradeToVVIP();
			
			result = "성공";
		}catch (SqlSessionException e) {
			log.info("변경등급업데이트 오류..");
		}
		
		log.info("result = " + result);
		
		return "redirect:/admin/member/mgrade";
	}
	
	@RequestMapping(value="/upateMembergrade")
	public String updateMembergrade() {
		log.info("updateMembergrade 호출..");
		
		String result = "";
		
		try {
			memberService.updateGrade();
			
			result = "성공";
		}catch (SqlSessionException e) {
			log.info("등급조정 오류..");
		}
		
		log.info("result = " + result);
		
		return "redirect:/admin/member/mgrade";
	}
}
