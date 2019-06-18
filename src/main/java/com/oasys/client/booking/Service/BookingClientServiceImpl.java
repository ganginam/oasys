package com.oasys.client.booking.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oasys.common.booking.dao.BookingDao;
import com.oasys.common.booking.vo.BookingVO;

import lombok.AllArgsConstructor;
import lombok.Setter;


@Service
@AllArgsConstructor
public class BookingClientServiceImpl implements BookingClientService{
	
	@Setter(onMethod_=@Autowired)
	private BookingDao bookingDao;
	
	@Override
	public List<BookingVO> roomList(BookingVO bvo) {
		List<BookingVO> roomList = null;
		roomList = bookingDao.roomList(bvo);
		
		return roomList;
	}

	@Override
	public BookingVO bookingClientDetail(BookingVO bvo) {
		
		BookingVO detail = null;
		
		detail = bookingDao.bookingClientDetail(bvo);
		
		return detail;
	}

	@Override
	public BookingVO bookingClientSearch(BookingVO bvo) {
		BookingVO detail = null;
		detail = bookingDao.bookingClientSearch(bvo);
		
		return detail;
	}

	@Override
	public int bookingClientCancel(BookingVO bvo) {
		int result = 0;
		result = bookingDao.bookingClientCancel(bvo);
		return result;
	}

}
