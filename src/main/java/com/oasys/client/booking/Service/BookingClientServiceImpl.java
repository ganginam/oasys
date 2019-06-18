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
	public List<Integer> randomcnt(BookingVO bvo) {
		List<Integer> result = null;
		
		result = bookingDao.randomcnt(bvo);
		
		return result;
	}

	@Override
	public int bookingInsert(BookingVO bvo) {
		int result = 0;
		
		result = bookingDao.bookingInsert(bvo);
		
		return  result;
		
	}

	@Override
	public int bookingNum() {
		int b_num=0;
		
		b_num = bookingDao.bookingNum();
		
		return b_num;
	}

	@Override
	public int bookingPayment(BookingVO bvo) {
		int result = 0;
		result = bookingDao.bookingPayment(bvo);
		return result;
	}

}
