package com.oasys.admin.faq.service;

import java.util.List;

import com.oasys.common.faq.vo.FaqVO;


public interface FaqService {
	
	public List<FaqVO> faqList(FaqVO fvo);
	
	public int faqInsert(FaqVO fvo);

	public FaqVO faqDetail(FaqVO fvo);
	
	
	public FaqVO updateForm(FaqVO fvo);
	
	public FaqVO faqUpdate(FaqVO fvo);
	
	public int faqDelete(int fa_num);
	
	}

	