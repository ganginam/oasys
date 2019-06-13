package com.oasys.client.review.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oasys.client.review.service.ReviewService;
import com.oasys.common.review.vo.ReviewVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/review/*")
@AllArgsConstructor
public class ReviewController {
	private ReviewService reviewService;
	
	//리뷰 리스트
	@RequestMapping(value="/reviewList", method=RequestMethod.GET)
	public String reviewList(@ModelAttribute("data") ReviewVO rvo, Model model) {
		log.info("reviewList 호출 성공");
		
		List<ReviewVO> reviewList = reviewService.reviewList(rvo);
		model.addAttribute("reviewList", reviewList);
		//model.addAllAttributes("pageMaker", new )
		
		return "review/reviewList";
	}
	
	//상세보기
	@RequestMapping(value="/reviewDetail", method=RequestMethod.GET)
	public String reviewDetail(ReviewVO rvo, Model model) {
		log.info("reviewDetail 호출 성공");
		
		ReviewVO detail = reviewService.reviewDetail(rvo);
		model.addAttribute("detail", detail);
		
		return "review/reviewDetail";
	}
}
