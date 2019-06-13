package com.oasys.admin.booking.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oasys.common.booking.dao.BookingDao;
import com.oasys.common.booking.vo.BookingVO;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class BookingServiceImpl implements BookingService{
	
	@Setter(onMethod_=@Autowired)
	private BookingDao bookingDao;
	
	//조회 목록 구현
	@Override
	public List<BookingVO> bookingList(BookingVO bvo) {
		
		List<BookingVO> myList = null;
		myList = bookingDao.bookingList(bvo);
		
		return myList;		
	}

	@Override
	public int bookingListCnt(BookingVO bvo) {
		return bookingDao.bookingListCnt(bvo);
	}

	@Override
	public BookingVO bookingDetail(BookingVO bvo) {
		BookingVO detail = null;
		detail = bookingDao.bookingDetail(bvo);
		
		return detail;
	}

	@Override
	public int bookingDelete(int b_num) {
		int result = 0;
		result = bookingDao.bookingDelete(b_num);
		return result;
	}

	@Override
	public BookingVO bookingUpdateForm(BookingVO bvo) {
		BookingVO detail = null;
		detail = bookingDao.bookingDetail(bvo);
		return detail;
	}


	@Override
	public int bookingUpdate(BookingVO bvo) {
		int result = 0;
		result = bookingDao.bookingUpdate(bvo);
		return result;

	}
	@Override
	public List<BookingVO> memberBookingList(int m_no) {
		List<BookingVO> bList = bookingDao.memberBookingList(m_no);
		return bList;

	}
}
