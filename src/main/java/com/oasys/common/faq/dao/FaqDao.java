package com.oasys.common.faq.dao;
import java.util.List;

import com.oasys.common.faq.vo.FaqVO;


public interface FaqDao {
	
		public List<FaqVO> faqList(FaqVO fvo);
		public int faqDelete(int fa_num);

		public int faqUpdate(FaqVO fvo);

		public FaqVO faqDetail(FaqVO fvo);

		public int faqInsert(FaqVO fvo);
	
		public FaqVO updateForm(FaqVO fvo);
		
		
	

	
	

}