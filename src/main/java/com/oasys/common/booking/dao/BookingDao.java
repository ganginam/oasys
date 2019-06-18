package com.oasys.common.booking.dao;

import java.util.List;

import com.oasys.common.booking.vo.BookingVO;

public interface BookingDao {
	public List<BookingVO> bookingList(BookingVO bvo);

	public int bookingListCnt(BookingVO bvo);
	
	public BookingVO bookingDetail(BookingVO bvo);
	
	public List<BookingVO> memberBookingList(int m_no);
	
	public int bookingDelete(int b_num);
	
	public int bookingUpdate(BookingVO bvo);
	
	public List<BookingVO> roomList(BookingVO bvo);
	
	public BookingVO bookingClientDetail(BookingVO bvo);

	
	public List<Integer> randomcnt(BookingVO bvo);
	
	public int bookingNum();
	
	public int bookingInsert(BookingVO bvo);
	
	public int bookingPayment(BookingVO bvo);


	public BookingVO bookingClientSearch(BookingVO bvo);

	public int bookingClientCancel(BookingVO bvo);

}
