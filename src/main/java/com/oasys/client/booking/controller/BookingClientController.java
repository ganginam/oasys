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
	
	/*�삁�빟 �럹�씠吏� �씠�룞*/
	@RequestMapping(value="/booking", method = RequestMethod.GET)
	public String booking(){
		
		
		return "client/booking/booking";
	}
	
	/*�궇吏� �꽑�깮 �썑 諛� 議고쉶*/
	@RequestMapping(value="/selectRoom", method = RequestMethod.GET)
	public String selectRoom(@ModelAttribute("data") BookingVO bvo, Model model) {
		log.info("bvo : " + bvo);
		List<BookingVO> roomList = bookingClientService.roomList(bvo);
		model.addAttribute("roomList", roomList);
		
		return "client/booking/selectRoom";
	}
	
	/*�삁�빟 �긽�꽭�럹�씠吏�*/
	@RequestMapping(value="/bookingClientDetail", method = RequestMethod.GET)
	public String bookingDetail(@ModelAttribute("data") BookingVO bvo, Model model) {
	
		BookingVO detail = bookingClientService.bookingClientDetail(bvo);
		model.addAttribute("detail", detail);
		
		return "client/booking/bookingClientDetail";
	}
	
	@RequestMapping(value="/goPaymentForm",method=RequestMethod.POST)
	public String goPaymentForm(@ModelAttribute("data") BookingVO bvo,Model model) {
		
		/*BookingVO detail = bookingClientService.bookingClientDetail(bvo);
		model.addAttribute("detail",detail);*/
		return "client/booking/paymentForm";
	}
}
