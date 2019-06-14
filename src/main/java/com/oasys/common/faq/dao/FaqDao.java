package com.oasys.common.faq.dao;
import java.util.List;

import com.oasys.common.faq.vo.FaqVO;


public interface FaqDao {

	List<FaqVO> faqList(FaqVO fvo);

	int faqInsert(FaqVO fvo);

	FaqVO faqDetail(FaqVO fvo);

	int faqUpdate(FaqVO fvo);

	int faqDelete(int fa_num);

	int faqListCnt(FaqVO fvo);
	
	
	
	

}