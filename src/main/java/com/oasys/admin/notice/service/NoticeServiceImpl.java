package com.oasys.admin.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oasys.common.notice.dao.NoticeDao;
import com.oasys.common.notice.vo.NoticeVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class NoticeServiceImpl implements NoticeService{

	@Setter(onMethod_ = @Autowired) 
	private NoticeDao noticeDao;
	
	//글목록
	@Override
	public List<NoticeVO> noticeList(NoticeVO nvo) {
		
		log.info("NoticeList............");
		
		List<NoticeVO> myList = null;
		myList = noticeDao.noticeList(nvo);
		
		return myList;
	}
	
	
	@Override
	public int noticeListCnt(NoticeVO nvo) {
		
		return  noticeDao. noticeListCnt(nvo);
		}

	//글입력
	@Override
	public int noticeInsert(NoticeVO nvo) {
		
		log.info("NoticeInsert...............");
		
		int result = 0;
		
		result = noticeDao.noticeInsert(nvo);
		
		return result;
	}

	//글 상세 구현
	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		
		NoticeVO detail = null;
		detail = noticeDao.noticeDetail(nvo);
		if(detail!=null) {
			detail.setN_content(detail.getN_content().toString().replaceAll("\n", "<br>"));
			
		}
		return detail;
	}
		
	
	//글 수정 폼
	@Override
	public NoticeVO updateForm(NoticeVO nvo) {
		
		NoticeVO detail = null;
		detail = noticeDao.noticeDetail(nvo);
		return detail;
	}

	//글수정 작업
	@Override
	public int noticeUpdate(NoticeVO nvo) {
		
		int result = 0;
		result = noticeDao.noticeUpdate(nvo);
		return result;
	}

	
	//글 삭제
	@Override
	public int noticeDelete(int n_num) {
	
		int result = 0;
		result = noticeDao.noticeDelete(n_num);
		
		return result;
	}

}
