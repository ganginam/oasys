package com.oasys.client.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oasys.common.qna.dao.QnaDao;
import com.oasys.common.qna.vo.QnaVO;
import com.oasys.common.reply.dao.ReplyDao;
import com.oasys.common.reply.vo.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ClientQnaServiceImpl implements ClientQnaService{

	@Setter(onMethod_=@Autowired)
	private QnaDao qnaDao;
	
	@Setter(onMethod_=@Autowired)
	private ReplyDao replyDao;
	
	//리스트
	@Override
	public List<QnaVO> qnaList(QnaVO qvo){
		log.info("qnaList............");
		
		List<QnaVO> myList = null;
		myList = qnaDao.qnaList(qvo);
		
		return myList;
	}
	
	//등록
	@Override
	public int qnaInsert(QnaVO qvo) {
		log.info("qnaInsert.........");
		
		
		int result = 0;
		result = qnaDao.qnaInsert(qvo);
			
		return result;
	}
	
	//세부사항
	@Override
	public QnaVO qnaDetail(QnaVO qvo) {
		QnaVO detail = null;
		detail = qnaDao.qnaDetail(qvo);
		if(detail!=null) {
			detail.setQa_content(detail.getQa_content().toString().replaceAll("\n", "<br>"));
		}
			return detail;
		}
	
	
	
	//수정폼
	@Override
	public QnaVO updateForm(QnaVO qvo) {
		QnaVO detail = null;
		detail = qnaDao.qnaDetail(qvo);
		return detail;
	
	}
	
	//수정
	@Override
	public int qnaUpdate(QnaVO qvo) {
		int result = 0;
		result = qnaDao.qnaUpdate(qvo);
		return result;
	}

	//삭제
	@Override
	public int qnaDelete(int qa_num) {
		int result = 0;
		result = qnaDao.qnaDelete(qa_num);
		return result;
	}
	
	//
	@Override
	public int replyCnt(int qa_num) {
		int result = 0;
		List<ReplyVO> list = replyDao.replyList(qa_num);
		if(!list.isEmpty()) {
			result = list.size();
		}else {
			result = 0;
			
		}
		return result;
	}
	
	//전체 레코드 수 구현
	@Override
	public int qnaListCnt(QnaVO qvo) {
		return qnaDao.qnaListCnt(qvo);
	}
	
	//수정폼
	@Override
	public QnaVO qnaupdateForm(QnaVO qvo) {
		QnaVO detail = null;
		detail = qnaDao.qnaDetail(qvo);
		return detail;
	}

	//비밀번호확인
	public int pwdConfirm(QnaVO qvo) {
		int result = 0;
		result = qnaDao.pwdConfirm(qvo);
		return result;
	}


}