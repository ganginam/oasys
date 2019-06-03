package com.oasys.admin.booking.controller;



import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oasys.admin.booking.service.BookingService;
import com.oasys.common.booking.vo.BookingVO;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping(value="/admin/booking/*")
@AllArgsConstructor
public class BookingController {

	private BookingService bookingService;
	
	
	/******************************************
	 * 예약목록 실현하기(페이징 처리 목록)
	 ******************************************/
	
	@RequestMapping(value="/bookingList", method = RequestMethod.GET)
	public String bookingList(@ModelAttribute("data") BookingVO bvo, Model model) {
		
		List<BookingVO> bookingList = bookingService.bookingList(bvo);
		model.addAttribute("bookingList", bookingList);
		
		
		//전체 레코드수 구현
		//int total = bookingService.bookingListCnt(bvo);
		//model.addAttribute("pageMaker", new PageDTO(bvo, toal));
		
	
		
		return "admin/booking/bookingList";
	}
	
	
}
