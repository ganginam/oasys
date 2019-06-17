package com.oasys.common.notice.dao;

import java.util.List;

import com.oasys.common.notice.vo.NoticeVO;

public interface NoticeDao {

	public List<NoticeVO> noticeList(NoticeVO nvo);

	public int noticeListCnt(NoticeVO nvo);

	public int noticeInsert(NoticeVO nvo);

	public NoticeVO noticeDetail(NoticeVO nvo);

	public int noticeUpdate(NoticeVO nvo);

	public int noticeDelete(int n_num);

	

	

}
