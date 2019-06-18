package com.oasys.client.booking.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


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

	
	/*�삁�빟 �럹�씠吏� �씠�룞*/
	@RequestMapping(value="/booking", method = RequestMethod.GET)
	public String booking(){
		
		
		return "client/booking/booking";
	}
	
	/*예약 선택*/
	@RequestMapping(value="/selectRoom", method = RequestMethod.GET)
	public String selectRoom(@ModelAttribute("data") BookingVO bvo, Model model) {
		log.info("bvo : " + bvo);
		List<BookingVO> roomList = bookingClientService.roomList(bvo);
		model.addAttribute("roomList", roomList);
		
		return "client/booking/selectRoom";
	}
	
	/*예약 상세*/
	@RequestMapping(value="/bookingClientDetail", method = RequestMethod.GET)
	public String bookingDetail(@ModelAttribute("data") BookingVO bvo, Model model) {
	
		BookingVO detail = bookingClientService.bookingClientDetail(bvo);
		model.addAttribute("detail", detail);
		
		return "client/booking/bookingClientDetail";
					
	}
	
	@ResponseBody
	@RequestMapping(value="/bookingInsert", method = RequestMethod.POST)
	public String bookingInsert(@ModelAttribute("data") BookingVO bvo) {
		log.info("bvo : " + bvo);
		String value = "";
		
		List<Integer> roomcnt = null;

		int b_num = bookingClientService.bookingNum();
		bvo.setB_num(b_num);
		
		roomcnt = bookingClientService.randomcnt(bvo);
		
		for(Integer b_room : roomcnt) {
			bvo.setR_number(b_room);
			bookingClientService.bookingInsert(bvo);
		}
		
		bookingClientService.bookingPayment(bvo);
		
		value= "1," + b_num;
		
		
		return value;
	}
	

	@RequestMapping(value="/complete", method = RequestMethod.POST)
	public String complete(@ModelAttribute("data") BookingVO bvo) {
		
		return "client/booking/complete";
	}

	@RequestMapping(value="/goSearchForm",method=RequestMethod.GET)
	public String goSearchForm() {
		return "client/booking/bookingSearchForm";
	}
	
	@RequestMapping(value="/bookingSearch",method=RequestMethod.POST)
	public String bookingSearch(@ModelAttribute BookingVO bvo,Model model) {
		
		BookingVO detail = bookingClientService.bookingClientSearch(bvo);
		model.addAttribute("detail", detail);
		
		return "client/booking/bookingSearchDetail";
				
	}
	@ResponseBody
	@RequestMapping(value="/bookingCancel",method=RequestMethod.POST)
	public String bookingCancel(@ModelAttribute BookingVO bvo) {
		String value="";
		int result=0;
		
		result = bookingClientService.bookingClientCancel(bvo);
		
		if(result==1) {
			value="Y";
		}else {
			value="N";
		}
		
		return value;
	}
	
}
