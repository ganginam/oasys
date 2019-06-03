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
}
