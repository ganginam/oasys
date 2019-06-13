package com.oasys.client.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oasys.common.review.dao.ReviewDao;
import com.oasys.common.review.vo.ReviewVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReviewServiceImpl implements ReviewService{
	@Setter(onMethod_ = @Autowired)
	private ReviewDao reviewDao;
	
	@Override
	public List<ReviewVO> reviewList(ReviewVO rvo) {
		log.info("reviewList 호출 성공");
		
		List<ReviewVO> myReview = null;
		myReview = reviewDao.reviewList(rvo);
		
		return myReview;
	}

	@Override
	public ReviewVO reviewDetail(ReviewVO rvo) {
		ReviewVO detail = null;
		detail = reviewDao.reviewDetail(rvo);
		if(detail != null) {
			detail.setRe_content(detail.getRe_content().toString().replaceAll("\n", "<br/>"));
		}
		return detail;
	}

}
