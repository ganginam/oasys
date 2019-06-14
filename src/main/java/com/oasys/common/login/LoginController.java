package com.oasys.common.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.oasys.admin.member.service.MemberService;
import com.oasys.client.member.service.MemberClientService;
import com.oasys.common.member.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value="/common/*")
@SessionAttributes("member")
@AllArgsConstructor
public class LoginController {
	private MemberClientService memberClientService;
	
	@ModelAttribute("member")
	public MemberVO member() {
		return new MemberVO();
	}
	
	//로그인 화면
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm() {
		log.info("login get 호출 성공");
		
		return "common/login";
	}
	
	//로그인 처리
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView loginCheck(@ModelAttribute MemberVO mvo, ModelAndView mav){
		log.info("login post 호출 성공");
		
		String m_id = mvo.getM_id();
		String m_pwd = mvo.getM_pwd();
		//String m_type = mvo.getM_type();
		
		MemberVO loginCheckResult = memberClientService.loginCheck(m_id, m_pwd);
		
		//MemberVO adminCheckResult = memberClientService.adminCheck(m_type);
		log.info(loginCheckResult);
		
		if(loginCheckResult == null) {
			mav.addObject("codeNumber", 1);
			mav.setViewName("common/login");
			return mav;
		}else{
			if(loginCheckResult.getM_type().equals("관리자")) {
				mav.addObject("member", loginCheckResult);
				log.info(loginCheckResult);
			}else {
				MemberVO mmvo = memberClientService.memberDetail(loginCheckResult.getM_no());
				mav.addObject("member", mmvo);
				log.info(mmvo);
			}
			
			
			
			//mav.addObject("mData", mmvo);
			mav.setViewName("common/login");
			return mav;
		}
	}

	
	//로그아웃
	@RequestMapping(value="/logout")
	public String logout(SessionStatus sessionStatus) {
		log.info("logout 호출 성공");
		
		sessionStatus.setComplete();
		return "redirect:/";
	}
}
