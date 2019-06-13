package com.oasys.client.review.service;

import java.util.List;

import com.oasys.common.review.vo.ReviewVO;

public interface ReviewService {

	public List<ReviewVO> reviewList(ReviewVO rvo);

	public ReviewVO reviewDetail(ReviewVO rvo);

}
