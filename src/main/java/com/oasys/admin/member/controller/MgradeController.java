package com.oasys.admin.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oasys.admin.member.service.MemberService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping(value="/admin/member/*")
@AllArgsConstructor
public class MgradeController {
	//private MgradeService mgradeService;
	
	@RequestMapping(value="/memberList")
	public String memberList() {
		return "admin/member/memberList";
	}
	
	
	@RequestMapping(value="/mgrade")
	public String memberGrade() {
		return "admin/member/mgrade";
	}
}
