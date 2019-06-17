package com.oasys.admin.review.service;

import java.util.List;

import com.oasys.common.review.vo.ReviewVO;

public interface ReviewAdminService {
	public List<ReviewVO> reviewList(ReviewVO rvo);

	public ReviewVO reviewDetail(ReviewVO rvo);

	public int reviewInsert(ReviewVO rvo);

	public int reviewDelete(ReviewVO rvo);

	public int reviewListCnt(ReviewVO rvo);
}
