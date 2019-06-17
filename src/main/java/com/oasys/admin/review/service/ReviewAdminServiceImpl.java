package com.oasys.admin.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oasys.common.review.dao.ReviewDao;
import com.oasys.common.review.vo.ReviewVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReviewAdminServiceImpl implements ReviewAdminService {
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

	@Override
	public int reviewInsert(ReviewVO rvo) {
		int result = 0;
		
		//rvo.setRe_num(0);
//		if(rvo.getRe_num() == 0) {
//			throw new IllegalArgumentException("0번 글은 등록할 수 없습니다.");
//		}
		
		result = reviewDao.reviewInsert(rvo);
		return result;
	}

	@Override
	public int reviewDelete(ReviewVO rvo) {
		int result = 0;
		result = reviewDao.reviewDelete(rvo);
		return result;
	}

	@Override
	public int reviewListCnt(ReviewVO rvo) {
		// TODO Auto-generated method stub
		return reviewDao.reviewListCnt(rvo);
	}
}
