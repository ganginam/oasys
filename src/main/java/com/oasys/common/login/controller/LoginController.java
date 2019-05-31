package com.oasys.common.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

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
}
