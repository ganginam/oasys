package com.oasys.common.review.dao;

import java.util.List;

import com.oasys.common.review.vo.ReviewVO;

public interface ReviewDao {

	public List<ReviewVO> reviewList(ReviewVO rvo);

	public ReviewVO reviewDetail(ReviewVO rvo);

}
