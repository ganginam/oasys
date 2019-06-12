package com.oasys.admin.booking.service;

import java.util.List;

import com.oasys.common.booking.vo.BookingVO;

public interface BookingService {
	
	public List<BookingVO> bookingList(BookingVO bvo);
	public int bookingListCnt(BookingVO bvo);
	public BookingVO bookingDetail(BookingVO bvo);
	public int bookingDelete(int b_num);
	public BookingVO bookingUpdateForm(BookingVO bvo); 
	public int bookingUpdate(BookingVO bvo);
}
