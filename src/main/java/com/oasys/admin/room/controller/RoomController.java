package com.oasys.admin.room.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oasys.admin.room.service.RoomService;
import com.oasys.admin.room.vo.RoomVO;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/room/*")
@Log4j
@AllArgsConstructor
public class RoomController {
	
	private RoomService roomService;
	
	
	@RequestMapping(value="/roomList",method=RequestMethod.GET)
	public String roomList(@ModelAttribute RoomVO rvo,Model model) {
		log.info("roomList 호출 성공");
		List<RoomVO> roomList = roomService.roomList(rvo);
		
		model.addAttribute("roomList",roomList);
		log.info("roomvo"+rvo);
		log.info("roomListmodel"+roomList);
		return "room/roomList";
	}
}
