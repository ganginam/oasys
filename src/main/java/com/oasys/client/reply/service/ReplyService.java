package com.oasys.client.reply.service;



import java.util.List;

import com.oasys.common.reply.vo.ReplyVO;

//import com.oasys.client.reply.vo.ReplyVO;

public interface ReplyService {

	int replyInsert(ReplyVO rvo);
	
	

	int replyUpdate(ReplyVO rvo);



	int pwdConfirm(ReplyVO rvo);

	public List<ReplyVO> replyList(Integer qa_num);

	int replyDelete(int r_num, int qa_num);



	ReplyVO replySelect(int r_num);



	int replyCnt(int qa_num);

	

	
}
