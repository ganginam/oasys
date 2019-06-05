package com.oasys.admin.roomgrade.controller;

import java.util.List;

import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oasys.admin.roomgrade.service.RoomGradeService;
import com.oasys.admin.roomgrade.vo.RoomGradeVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/roomGrade/*")
@Log4j
@AllArgsConstructor
public class RoomGradeController {

	
	private RoomGradeService roomGradeService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(MultipartFile.class,"file",new StringTrimmerEditor(true));
			
	}
	@RequestMapping(value="/roomGradeInsert",method=RequestMethod.POST)
	public String roomGradeInsert(@ModelAttribute RoomGradeVO gvo) {
		log.info("roomGradeInsert 호출");
		log.info(gvo);

		int result = 0 ;
		String url = "";
		
		result = roomGradeService.roomGradeInsert(gvo);
		if(result == 1) {
			url = "/roomGrade/roomGradeList";
			log.info(url);
		}else{
			url = "/";
			log.info(url);
		}
		return "redirect:"+url;
	}
	@RequestMapping(value="/roomGradeFormGo",method=RequestMethod.GET)
	public String roomGradeFormGo() {
		return "room/roomGradeForm";
	}
	@RequestMapping(value="/roomGradeList",method=RequestMethod.GET)
	public String roomGradeList(@ModelAttribute("data") RoomGradeVO gvo, Model model) {
		log.info("roomGradedList 호출 성공");
		
		List<RoomGradeVO> roomGradeList = roomGradeService.roomGradeList(gvo);
		model.addAttribute("roomGradeList", roomGradeList);
		
		return "room/roomGradeList";
	}
	@RequestMapping(value="/roomGradeDetail",method=RequestMethod.GET)
	public String roomGradeDetail(@ModelAttribute("data") RoomGradeVO gvo,Model model) {
		log.info("roomGradeDetail 호출 성공");
		
		RoomGradeVO detail = roomGradeService.roomGradeDetail(gvo);
		model.addAttribute("detail",detail);
		log.info(gvo);
		log.info(detail);
		return "room/roomGradeDetail";
	}
	@ResponseBody
	@RequestMapping(value="/roomGradeDelete",method=RequestMethod.POST,produces="text/plain; charset=UTF-8")
	public String roomGradeDelete(@ModelAttribute RoomGradeVO gvo) {
		int result=0;
		String value = "";
		result=roomGradeService.roomGradeDelete(gvo);
		if(result==1) {
			value="성공";
		}else {
			value="실패";
		}
		return value;
	}
	/*@RequestMapping(value="/roomGradeUpdateForm",method=RequestMethod.POST)
	public String roomGradeUpdateForm(@ModelAttribute RoomGradeVO gvo,Model model) {
		log.info("roomGradeUpdateForm 호출");
		
		RoomGradeVO detail = roomGradeService.roomGradeUpdateForm(gvo);
		model.addAttribute("detail",detail);
		return "room/roomGradeUpdateForm";
	}*/
	@RequestMapping(value="/roomGradeUpdateForm",method=RequestMethod.GET)
	public String roomGradeUpdateForm(@ModelAttribute("data") RoomGradeVO gvo,Model model) {
		log.info("roomGradeUpdateForm 호출");
		
		RoomGradeVO detail = roomGradeService.roomGradeUpdateForm(gvo);
		model.addAttribute("detail",detail);
		log.info(gvo);
		log.info(detail);
		return "room/roomGradeUpdateForm";
	}
	
	@RequestMapping(value="/roomGradeUpdate",method=RequestMethod.POST)
	public String roomGradeUpdat(@ModelAttribute RoomGradeVO gvo) {
		log.info("roomGradeupdate호출");
		String value = "";
		int result = 0;
		result = roomGradeService.roomGradeUpdate(gvo);
		log.info("roomGradeupdate : "+gvo);
		if(result==1) {
			value="/roomGrade/roomGradeList";
		}else {
			value="/";
		}
		return "redirect:"+value;
	}
}
