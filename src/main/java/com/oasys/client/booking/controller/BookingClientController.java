package com.oasys.client.booking.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.oasys.client.booking.Service.BookingClientService;
import com.oasys.common.booking.vo.BookingVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Controller
@RequestMapping(value="/booking/*")
@AllArgsConstructor
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
		log.info("bvo : " + bvo);
		List<BookingVO> roomList = bookingClientService.roomList(bvo);
		model.addAttribute("roomList", roomList);
		
		return "client/booking/selectRoom";
	}
	
	/*예약 상세페이지*/
	@RequestMapping(value="/bookingClientDetail", method = RequestMethod.GET)
	public String bookingDetail(@ModelAttribute("data") BookingVO bvo, Model model) {
	
		BookingVO detail = bookingClientService.bookingClientDetail(bvo);
		model.addAttribute("detail", detail);
		
		return "client/booking/bookingClientDetail";
						
	}
	
	@RequestMapping(value="/bookingInsert", method = RequestMethod.POST)
	public String bookingInsert(@ModelAttribute("data") BookingVO bvo, Model model) {
		log.info("bvo : " + bvo);
		List<Integer> roomcnt = null;
		
		int b_num = bookingClientService.bookingNum();
		bvo.setB_num(b_num);
		
		roomcnt = bookingClientService.randomcnt(bvo);
		
		for(Integer b_room : roomcnt) {
			bvo.setR_number(b_room);
			bookingClientService.bookingInsert(bvo);
		}
		
		model.addAttribute("r_number", roomcnt);
		
		return "client/booking/complete";
	}
}
