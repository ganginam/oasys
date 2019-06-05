package com.oasys.common.booking.dao;

import java.util.List;

import com.oasys.common.booking.vo.BookingVO;

public interface BookingDao {
	public List<BookingVO> bookingList(BookingVO bvo);

	public int bookingListCnt(BookingVO bvo);
	
	public BookingVO bookingDetail(BookingVO bvo);
	
	public int bookingDelete(int b_num);
}
