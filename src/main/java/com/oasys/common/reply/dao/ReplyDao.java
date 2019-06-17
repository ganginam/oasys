package com.oasys.common.reply.dao;

import java.util.List;

import com.oasys.common.reply.vo.ReplyVO;

public interface ReplyDao {

	public List<ReplyVO> replyList(Integer qa_num);

	
	public int replyInsert(ReplyVO rvo);

	public int pwdConfirm(ReplyVO rvo);

	public int replyDelete(int r_num);

	public ReplyVO replySelect(int r_num);

	public int replyCnt(int qa_num);

	public int replyUpdate(ReplyVO rvo);


}
