package com.oasys.client.hotelInfo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/hotelInfo/*")
public class hotelInfoController {
	//Header
	//호텔소개
	@RequestMapping(value="/aboutUs")
	public String aboutUs() {
		return "hotelInfo/aboutUs";
	}
	
	//오시는길
	@RequestMapping(value="/location")
	public String location() {
		return "hotelInfo/location";
	}
	
	//여행가이드
	@RequestMapping(value="/trevelGuide")
	public String trevelGuide() {
		return "hotelInfo/trevelGuide";
	}
	
	//피트니스클럽
	@RequestMapping(value="/fitnessClub")
	public String fitnessClub() {
		return "hotelInfo/fitnessClub";
	}
	
	//스파
	@RequestMapping(value="/spaClub")
	public String spaClub() {
		return "hotelInfo/spaClub";
	}
	
	//수영장
	@RequestMapping(value="/swimmingPool")
	public String swimmingPool() {
		return "hotelInfo/swimmingPool";
	}
	
	//층별안내
	@RequestMapping(value="/floorGuide")
	public String floorGuide() {
		return "hotelInfo/floorGuide";
	}
	
	
	
	//Footer
	//사이트맵
	@RequestMapping(value="/siteMap")
	public String siteMap() {
		return "hotelInfo/siteMap";
	}
	
	//이용약관
	@RequestMapping(value="/termsOfUse")
	public String termsOfUse() {
		return "hotelInfo/termsOfUse";
	}

	//개인정보처리방침
	@RequestMapping(value="/privacyPolicy")
	public String privacyPolicy() {
		return "hotelInfo/privacyPolicy";
	}
	
	//이메일무단수집금지
	@RequestMapping(value="/emailPolicy")
	public String emailPolicy() {
		return "hotelInfo/emailPolicy";
	}
}
