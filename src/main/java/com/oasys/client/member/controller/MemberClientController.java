package com.oasys.client.member.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import org.springframework.web.servlet.ModelAndView;


import com.oasys.client.member.service.MemberClientService;
import com.oasys.common.member.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value="/common/*")
@AllArgsConstructor
public class MemberClientController {
	private MemberClientService memberClientService;
	
	
	//약관 동의
	@RequestMapping(value="/check")
	public String check() {
		log.info("check 호출 성공");
		
		return "common/check";
	}
	
	//info 창
	@RequestMapping(value="/info")
	public String info() {
		log.info("info 호출 성공");
		
		return "common/info";
	}

	
	//회원가입 폼
	@RequestMapping(value="/join")
	public String join() {
		log.info("join 호출 성공");
		
		return "common/join";
	}
	
	//회원가입 처리
	@RequestMapping(value="/memberInsert", method=RequestMethod.POST)
	public ModelAndView memberInsert(@ModelAttribute MemberVO mvo) {
		log.info("join post 방식 호출 성공");
		
		ModelAndView mav = new ModelAndView();

		
		int m_no = memberClientService.memberNo();
		mvo.setM_no(m_no);
		

		int result = 0;
		result = memberClientService.memberInsert(mvo);
		//result = memberClientService.memberGradeInsert(mvo);
		
		switch(result) {
			case 1:
				mav.addObject("codeNumber", 1);
				mav.setViewName("common/join");
				break;
			case 3:
				mav.addObject("codeNumber", 3);
				mav.setViewName("common/joinSuccess");	//페이지이동
				memberClientService.memberGradeInsert(mvo);
				break;
			default:
				mav.addObject("codeNumber", 2);		//실패
				mav.setViewName("common/join");
				break;
		}
		return mav;
	}
	
	//아이디 중복체크
	@ResponseBody
	@RequestMapping(value="idCheck", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	public String idCheck(MemberVO mvo) {
		int result = 0;
		result = memberClientService.idCheck(mvo);
		
		return String.valueOf(result);
	}
	
	//회원 수정 폼
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public ModelAndView memberUpdateForm(@SessionAttribute("member") MemberVO member) {
		log.info("update get 방식 호출 성공");
		
		ModelAndView mav = new ModelAndView();
		
		if(member == null) {
			mav.setViewName("common/login");
			return mav;
		}
		
		MemberVO vo = memberClientService.memberSelect(member.getM_id());
		mav.addObject("member", vo);
		mav.setViewName("common/update");
		
		return mav;
	}
	
	//회원 수정 처리
	@RequestMapping(value="/memberUpdate", method=RequestMethod.POST)
	public ModelAndView memberUpdate(@SessionAttribute("member") MemberVO mvo, MemberVO memvo, ModelAndView mav) {
		log.info("update post 방식 호출 성공");
		log.info("memvo" + memvo);
		
		if(mvo == null) {
			mav.setViewName("common/login");
			return mav;
		}
		memvo.setM_id(mvo.getM_id());
		MemberVO vo = memberClientService.memberSelect(mvo.getM_id());
		
		if(memberClientService.loginCheck(mvo.getM_id(), memvo.getM_oldpwd()) == null) {
			mav.addObject("codeNumber", 1);
			mav.addObject("member", vo);
			mav.setViewName("common/update");
			return mav;
		}
		
		memberClientService.memberUpdate(memvo);
		mav.setViewName("redirect:/common/logout");
		return mav;
	}
	
//	//회원 수정 처리
//	@RequestMapping(value="/memberUpdate", method=RequestMethod.POST)
//	public String memberUpdate(@ModelAttribute MemberVO mvo, RedirectAttributes ras) {
//		log.info("memberUpdate 호출 성공");
//		
//		int result = 0;
//		String url = "";
//		
//		result = memberClientService.memberUpdate(mvo);
//		ras.addFlashAttribute("MemberVO", mvo);
//		
//		if(result == 1) {
//			url = "/common/login";
//		}else {
//			url = "/common/memberUpdateForm";
//		}
//		return "redirect:"+url;
//	}
	
	//회원 탈퇴 처리
	@RequestMapping("/delete")
	public ModelAndView memberDelete(@SessionAttribute("member") MemberVO login) {
		log.info("delete 호출 성공");
		log.info("아이디 " + login.getM_id());
		ModelAndView mav = new ModelAndView();

		int errCode = memberClientService.memberDelete(login.getM_id());
		log.info(errCode);
		switch(errCode) {
		case 2:
			mav.setViewName("redirect:/common/logout");
			break;
		case 3:
			mav.addObject("codeNumber", 3);
			mav.setViewName("common/login");
			break;
		}
		return mav;
	}
	
	//아이디 패스워드 찾기 폼
	@RequestMapping(value="/idpwdSearch")
	public String idpwdCheck(@SessionAttribute("member") MemberVO login) {
		log.info("idpwdCheck 호출 성공");
		
		return "common/idpwdSearch";
	}
	
	//아이디 찾기
//	@ResponseBody
//	@RequestMapping(value="memberIdSearch", method=RequestMethod.POST)
//	public String memberIdSearch(MemberVO mvo, ModelAndView mav) {
//		log.info("memberIdSearch 호출 성공");
//		
//		String m_name = mvo.getM_name();
//		String m_email = mvo.getM_email();
//		
//		MemberVO idSearchResult = memberClientService.idSearch(m_name, m_email);
//		
//		if(idSearchResult==null) {
//			mav.addObject("codeNumber", 1);
//			mav.setViewName("common/idpwdSearch");
//			return "common/idpwdSearch";
//		}else {
//			mav.addObject("idSearch", idSearchResult);
//			//mav.setViewName("");
//			return "mail/mailIdSearch";
//		}
//	}
//	
	
	//아이디 찾기
	@RequestMapping(value="memberIdSearch", method=RequestMethod.POST)
	public ModelAndView memberIdSearch(@ModelAttribute MemberVO mvo, ModelAndView mav) {
		log.info("memberIdSearch 호출 성공");
		
		String m_name = mvo.getM_name();
		String m_email = mvo.getM_email();
		
		MemberVO idSearchResult = memberClientService.idSearch(m_name, m_email);
		
		if(idSearchResult == null) {
			mav.addObject("codeNumber", 1);
			mav.setViewName("common/idpwdSearch");
			return mav;
		}else {
			mav.addObject("member", idSearchResult);
			mav.setViewName("common/searchSuccess");
			return mav;
		}
	}
	
	//비밀번호찾기
	@RequestMapping(value="memberPwSearch", method=RequestMethod.POST)
	public ModelAndView memberPwSearch(@ModelAttribute MemberVO mvo, ModelAndView mav) {
		log.info("memberPwSearch 호출 성공");
		
		String m_name = mvo.getM_name();
		String m_email = mvo.getM_email();
		String m_id = mvo.getM_id();
		
		MemberVO pwSearchResult = memberClientService.pwSearch(m_name, m_email, m_id);
		
		if(pwSearchResult == null) {
			mav.addObject("codeNumber", 1);
			mav.setViewName("common/idpwdSearch");
			return mav;
		}else {
			mav.addObject("member", pwSearchResult);
			mav.setViewName("common/searchSuccess");
			return mav;
		}
	}
	
	
}
