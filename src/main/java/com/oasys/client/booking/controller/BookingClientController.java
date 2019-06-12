package com.oasys.client.booking.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.oasys.client.booking.Service.BookingClientService;
import com.oasys.common.booking.vo.BookingVO;



@Controller
@RequestMapping(value="/client/booking/*")
//@AllArgsConstructor
public class BookingClientController {
	
	private BookingClientService bookingClientService;
	
	/*예약 페이지 이동*/
	@RequestMapping(value="/booking", method = RequestMethod.GET)
	public String booking(){
		
		
		return "client/booking/booking";
	}
	
	/*날짜 선택 후 방 조회*/
	@RequestMapping(value="/selectRoom", method = RequestMethod.GET)
	public String selectRoom(@ModelAttribute("data") BookingVO bvo, Model model) {
		
		List<BookingVO> roomList = bookingClientService.roomList(bvo);
		model.addAttribute("roomList", roomList);
		
		return "client/booking/selectRoom";
	}
}
