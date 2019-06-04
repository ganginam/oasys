package com.oasys.client.faq.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.oasys.common.faq.vo.FaqVO;

public interface FaqService {
	public List<FaqVO> faqList(FaqVO bvo);
	
	public int faqInsert(FaqVO bvo);

	public FaqVO faqDetail(FaqVO bvo);
	
	

	public FaqVO updateForm(FaqVO fvo);
	
	public int faqUpdate(FaqVO fvo);
	
	public int faqDelete(int fa_num);

	public void increaseViewcnt(int fa_num, HttpSession session);

	public Object read(int fa_num);

	public List<FaqVO> listAll();

	public void create(FaqVO vo);

	public void update(FaqVO vo);

	public void delete(String string);
	
	
}
