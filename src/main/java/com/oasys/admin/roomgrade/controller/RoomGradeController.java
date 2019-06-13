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
		log.info("roomGradeInsert È£ï¿½ï¿½");
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
		return "admin/room/roomGradeForm";
	}
	@RequestMapping(value="/roomGradeList",method=RequestMethod.GET)
	public String roomGradeList(@ModelAttribute("data") RoomGradeVO gvo, Model model) {
		log.info("roomGradedList È£ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½");
		
		List<RoomGradeVO> roomGradeList = roomGradeService.roomGradeList(gvo);
		model.addAttribute("roomGradeList", roomGradeList);
		
		return "admin/room/roomGradeList";
	}
	@RequestMapping(value="/roomGradeDetail",method=RequestMethod.GET)
	public String roomGradeDetail(@ModelAttribute("data") RoomGradeVO gvo,Model model) {
		log.info("roomGradeDetail È£ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½");
		
		RoomGradeVO detail = roomGradeService.roomGradeDetail(gvo);
		model.addAttribute("detail",detail);
		log.info(gvo);
		log.info(detail);
		return "admin/room/roomGradeDetail";
	}
	@ResponseBody
	@RequestMapping(value="/roomGradeDelete",method=RequestMethod.POST,produces="text/plain; charset=UTF-8")
	public String roomGradeDelete(@ModelAttribute RoomGradeVO gvo) {
		int result=0;
		String value = "";
		result=roomGradeService.roomGradeDelete(gvo);
		if(result==1) {
			value="ì„±ê³µ";
		}else {
			value="ì‹¤íŒ¨";
		}
		return value;
	}
	/*@RequestMapping(value="/roomGradeUpdateForm",method=RequestMethod.POST)
	public String roomGradeUpdateForm(@ModelAttribute RoomGradeVO gvo,Model model) {
		log.info("roomGradeUpdateForm È£ï¿½ï¿½");
		
		RoomGradeVO detail = roomGradeService.roomGradeUpdateForm(gvo);
		model.addAttribute("detail",detail);
		return "room/roomGradeUpdateForm";
	}*/
	@RequestMapping(value="/roomGradeUpdateForm",method=RequestMethod.GET)
	public String roomGradeUpdateForm(@ModelAttribute("data") RoomGradeVO gvo,Model model) {
		log.info("roomGradeUpdateForm È£ï¿½ï¿½");
		
		RoomGradeVO detail = roomGradeService.roomGradeUpdateForm(gvo);
		model.addAttribute("detail",detail);
		log.info(gvo);
		log.info(detail);
		return "admin/room/roomGradeUpdateForm";
	}
	
	@RequestMapping(value="/roomGradeUpdate",method=RequestMethod.POST)
	public String roomGradeUpdat(@ModelAttribute RoomGradeVO gvo) {
		log.info("roomGradeupdateÈ£ï¿½ï¿½");
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
	
	
	
	
	
	/*--------------------SHOW ROOM CONTROLL---------------------*/
	@RequestMapping(value="/showDeluxe",method=RequestMethod.GET)
	public String showDeluxe(@ModelAttribute("data") RoomGradeVO gvo,Model model) {
		log.info("roomGradeDetail È£Ãâ ¼º°ø");
		gvo.setRg_num(2);
		RoomGradeVO detail = roomGradeService.roomGradeDetail(gvo);
		model.addAttribute("detail",detail);
		detail.getRg_num();
		log.info(gvo);
		log.info(detail);
		return "client/room/showDeluxe";
	}
	@RequestMapping(value="/showDeluxeDubble",method=RequestMethod.GET)
	public String showDeluxeDubble(@ModelAttribute("data") RoomGradeVO gvo,Model model) {
		log.info("roomGradeDetail È£Ãâ ¼º°ø");
		gvo.setRg_num(4);
		RoomGradeVO detail = roomGradeService.roomGradeDetail(gvo);
		model.addAttribute("detail",detail);
		detail.getRg_num();
		log.info(gvo);
		log.info(detail);
		return "client/room/showDeluxeDubble";
	}
	@RequestMapping(value="/showSuite",method=RequestMethod.GET)
	public String showSuite(@ModelAttribute("data") RoomGradeVO gvo,Model model) {
		log.info("roomGradeDetail È£Ãâ ¼º°ø");
		gvo.setRg_num(5);
		RoomGradeVO detail = roomGradeService.roomGradeDetail(gvo);
		model.addAttribute("detail",detail);
		detail.getRg_num();
		log.info(gvo);
		log.info(detail);
		return "client/room/showSuite";
	}
	@RequestMapping(value="/showSuiteFamilly",method=RequestMethod.GET)
	public String showSuiteFamilly(@ModelAttribute("data") RoomGradeVO gvo,Model model) {
		log.info("roomGradeDetail È£Ãâ ¼º°ø");
		gvo.setRg_num(6);
		RoomGradeVO detail = roomGradeService.roomGradeDetail(gvo);
		model.addAttribute("detail",detail);
		detail.getRg_num();
		log.info(gvo);
		log.info(detail);
		return "client/room/showSuiteFamilly";
	}
	
}
