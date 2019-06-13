package com.oasys.admin.room.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oasys.admin.room.service.RoomService;
import com.oasys.admin.room.vo.RoomVO;
import com.oasys.admin.roomgrade.service.RoomGradeService;
import com.oasys.admin.roomgrade.vo.RoomGradeVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/room/*")
@Log4j
@AllArgsConstructor
public class RoomController {
	
	private RoomService roomService;
	private RoomGradeService roomGradeService;
	
	@RequestMapping(value="/roomList",method=RequestMethod.GET)
	public String roomList(@ModelAttribute RoomVO rvo,RoomGradeVO gvo,Model model) {
		log.info("roomList 호출 성공");
		List<RoomVO> roomList = roomService.roomList(rvo);
		List<RoomGradeVO> roomGradeList = roomGradeService.roomGradeList(gvo);
		RoomVO detail = roomService.roomDetail(rvo);
		model.addAttribute("roomList",roomList);
		model.addAttribute("roomGradeList",roomGradeList);
		model.addAttribute("detail",detail);
		log.info("roomvo"+rvo);
		log.info("roomListmodel"+roomList);
		return "admin/room/roomList";
	}
	@ResponseBody
	@RequestMapping(value="/roomInsert",method=RequestMethod.POST,produces="text/plain; charset=UTF-8")
	public String roomInsert(@ModelAttribute("data") RoomVO rvo,Model model) {
		log.info("roomInsert 호출");
		log.info("roomInsert : "+rvo);
		String value="";
		int result = 0;
		
		result=roomService.roomInsert(rvo);
		
		if(result==1) {
			value="성공";
		}else {
			value="실패";
		}
		return value;
	}
	@RequestMapping(value="/roomDetail",method=RequestMethod.GET)
	public String roomDetail(@ModelAttribute RoomVO rvo,Model model) {
		log.info("roomDetail 호출 성공");
		RoomVO detail = roomService.roomDetail(rvo);
		model.addAttribute("detail",detail);
		return "admin/room/roomDetail";
	}
	@ResponseBody
	@RequestMapping(value="/roomDelete",method=RequestMethod.POST,produces="text/plain; charset=UTF-8")
	public String roomDelete(@ModelAttribute("data") RoomVO rvo) {
		String value = "";
		int result = 0;
		result = roomService.roomDelete(rvo);
		if(result==1) {
			value="성공";
		}else {
			value="실패";
		}
		return value;
	}
	
	@ResponseBody
	@RequestMapping(value="/roomUpdate",method=RequestMethod.GET,produces="text/plain;charset=UTF-8")
	public String roomUpdate(@ModelAttribute("data") RoomVO rvo) {
		log.info("roomUpdate 호출");
		String value = "";
		int result = 0;
		log.info(rvo);
		result = roomService.roomUpdate(rvo);
		log.info(result);
		if(result==1) {
			value="성공";
		}else {
			value="실패";
		}
		return value;
	}
	
}