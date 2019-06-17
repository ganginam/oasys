package com.oasys.client.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oasys.common.qna.dao.QnaDao;
import com.oasys.common.qna.vo.QnaVO;
import com.oasys.common.reply.dao.ReplyDao;
import com.oasys.common.reply.vo.ReplyVO;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService{

	@Setter(onMethod_=@Autowired)
	private ReplyDao replyDao;
	
	@Setter(onMethod_=@Autowired)
	private QnaDao qnaDao;
	
	@Override
	public List<ReplyVO> replyList(Integer qa_num) {
		List<ReplyVO> list = null;
		list = replyDao.replyList(qa_num);
		return list;
	}
	
	@Override
	public int replyInsert(ReplyVO rvo) {
		int result = 0;
		result = replyDao.replyInsert(rvo);
		QnaVO qvo = new QnaVO();
		qvo.setQa_num(rvo.getQa_num());
		qvo.setQa_anstatus("답변완료");
		
		qnaDao.qnaStatus(qvo);
		return result;
	}
	
	@Override
	public int pwdConfirm(ReplyVO rvo) {
		int result = 0;
		result = replyDao.pwdConfirm(rvo);
		return result;
	}

	@Override
	public int replyDelete(int r_num, int qa_num) {
		int result = 0;
		result = replyDao.replyDelete(r_num);
		QnaVO qvo = new QnaVO();
		qvo.setQa_num(qa_num);
		qvo.setQa_anstatus("답변확인");
		qnaDao.qnaStatus(qvo);
		return result;
	}
	
	@Override
	public ReplyVO replySelect(int r_num) {
		ReplyVO rvo = null;
		rvo = replyDao.replySelect(r_num);
		return rvo;
	}
	
	@Override
	public int replyUpdate(ReplyVO rvo) {
		int result = 0;
		result = replyDao.replyUpdate(rvo);
		return result;
	}
	
	@Override
	public int replyCnt(int qa_num) {
		int result = 0;
		result = replyDao.replyCnt(qa_num);
		return result;
	}
	
	
	
}

