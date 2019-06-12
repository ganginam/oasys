package com.oasys.admin.booking.controller;



import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oasys.admin.booking.service.BookingService;
import com.oasys.common.booking.vo.BookingVO;
import com.oasys.common.vo.PageDTO;

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
		int total = bookingService.bookingListCnt(bvo);
		model.addAttribute("pageMaker", new PageDTO(bvo, total));
		
	
		
		return "admin/booking/bookingList";
	}
	//예약 상세페이지
	@RequestMapping(value="/bookingDetail", method = RequestMethod.GET)
	public String bookingDetail(@ModelAttribute("data") BookingVO bvo, Model model) {
		
		BookingVO detail = bookingService.bookingDetail(bvo);
		model.addAttribute("detail", detail);
		
		return "admin/booking/bookingDetail";
		
	}
	
	//예약 삭제
	@RequestMapping(value="/bookingDelete")
	public String bookingDelete(@ModelAttribute BookingVO bvo) {
		int result = 0;
		String url ="";
		
		result = bookingService.bookingDelete(bvo.getB_num());
		
		if(result == 1) {
			url = "/admin/booking/bookingList";	
		}else {
			url ="/admin/booking/bookingDetail?b_num=" + bvo.getB_num();
		}
		return "redirect:"+url;
	}
	
	//수정 폼
	@RequestMapping(value="/bookingUpdateForm")
	public String bookingUpdateForm(@ModelAttribute("data") BookingVO bvo, Model model) {
		
		BookingVO bookingUpdateData = bookingService.bookingUpdateForm(bvo);

		model.addAttribute("bookingUpdateData", bookingUpdateData);
		
		return "admin/booking/bookingUpdateForm";
	}
	
	@RequestMapping(value="/bookingUpdate", method = RequestMethod.POST)
	public String bookingUpdate(@ModelAttribute BookingVO bvo, RedirectAttributes ras) {
		int result = 0;
		String url = "";
		
		result = bookingService.bookingUpdate(bvo);
		ras.addFlashAttribute("data", bvo);
		
		if(result ==1 ) {
			url = "/admin/booking/bookingDetail";
		}else {
			url = "/admin/booking/bookingUpdateForm";
		}
		return "redirect:" + url;
	}

}