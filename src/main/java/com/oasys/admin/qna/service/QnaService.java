package com.oasys.admin.qna.service;

import java.util.List;

import com.oasys.common.qna.vo.QnaVO;



public interface QnaService {

	int qnaInsert(QnaVO qvo);

	List<QnaVO> qnaList(QnaVO qvo);

	QnaVO qnaDetail(QnaVO qvo);

	int qnaUpdate(QnaVO qvo);

	int pwdConfirm(QnaVO qvo);

	int qnaListCnt(QnaVO qvo);

	QnaVO qnaupdateForm(QnaVO qvo);

	int qnaDelete(int qa_num);

	int replyCnt(int qa_num);

	QnaVO updateForm(QnaVO qvo);


	
}
