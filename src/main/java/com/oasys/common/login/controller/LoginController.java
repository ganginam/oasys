package com.oasys.common.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.oasys.common.login.service.LoginService;
import com.oasys.common.login.vo.LoginVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@SessionAttributes("login")
@RequestMapping(value="/common/*")

public class LoginController {
	private LoginService loginService;
	
	@ModelAttribute("login")
	public LoginVO login() {
		return new LoginVO();
	}
	
	//로그인 화면
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm() {
		log.info("login get 호출 성공");
		
		return "common/login";
	}
	
	//로그인 처리
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView loginCheck(@ModelAttribute LoginVO lvo, ModelAndView mav) {
		log.info("login post 호출 성공");
		
		String m_id = lvo.getM_id();
		String m_pwd = lvo.getM_pwd();
		
		LoginVO loginCheckResult = loginService.loginCheck(m_id, m_pwd);
		
		if(loginCheckResult == null) {
			mav.addObject("codeNumber", 1);
			mav.setViewName("common/login");
			return mav;
		}else {
			mav.addObject("login", loginCheckResult);
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
