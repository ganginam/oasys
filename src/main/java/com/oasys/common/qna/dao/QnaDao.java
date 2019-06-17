package com.oasys.common.qna.dao;


import java.util.List;
import com.oasys.common.qna.vo.QnaVO;

public interface QnaDao {

	List<QnaVO> qnaList(QnaVO qvo);

	int qnaInsert(QnaVO qvo);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
	QnaVO qnaDetail(QnaVO qvo);

	int pwdConfirm(QnaVO qvo);

	int qnaUpdate(QnaVO qvo);

	int qnaDelete(int qa_num);

	int qnaListCnt(QnaVO qvo);

	int qnaStatus(QnaVO qvo);

	
	
	
	

	
}

