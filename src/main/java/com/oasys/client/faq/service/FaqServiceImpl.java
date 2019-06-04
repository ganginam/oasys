package com.oasys.client.faq.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oasys.common.faq.dao.FaqDao;
import com.oasys.common.faq.vo.FaqVO;


import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class FaqServiceImpl implements FaqService{
	
	@Setter(onMethod_=@Autowired)
	private FaqDao faqDao;
	
	//�۸��
	@Override
	public List<FaqVO> faqList(FaqVO fvo) {
		log.info("faqList...........");
		
		List<FaqVO> faqList = null;
		faqList = faqDao.faqList(fvo);
		
		return faqList;
	}

	//���Է�
	@Override
	public int faqInsert(FaqVO fvo) {
		log.info("faqInsert...........");
		
		int result = 0;
		result = faqDao.faqInsert(fvo);
		
		return result;
	}
	
	//게시판 세부사항
	@Override
	public FaqVO faqDetail(FaqVO fvo) {
		FaqVO detail = null;
		detail = faqDao.faqDetail(fvo);
		if(detail!=null) {
			detail.setFa_content(detail.getFa_content().toString().replaceAll("\n", "<br>"));
		}
		return detail;
	}
	
	//�� ������
	@Override
	public FaqVO updateForm(FaqVO fvo) {
		FaqVO detail = null;
		detail = faqDao.faqDetail(fvo);
		return detail;
	}

	//�� ���� �۾�
	@Override
	public int boardUpdate(FaqVO fvo) {
		int result = 0;
		result = faqDao.faqUpdate(fvo);
		return result;
	}
	
	//�� ����
	@Override
	public int faqDelete(int fa_num) {
		int result = 0;
		result = faqDao.faqDelete(fa_num);
		return result;
	}
	

	
	

	@Override
	public int faqInsert(FaqVO fvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public FaqVO faqDetail(FaqVO bvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FaqVO updateForm(FaqVO fvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int faqUpdate(FaqVO fvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int faqDelete(int fa_num) {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public Object read(int fa_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FaqVO> listAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void create(FaqVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(FaqVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String string) {
		// TODO Auto-generated method stub
		
	}
	
}
