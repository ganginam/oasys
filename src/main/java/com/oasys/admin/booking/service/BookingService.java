package com.oasys.admin.booking.service;

import java.util.List;

import com.oasys.common.booking.vo.BookingVO;

public interface BookingService {
	
	public List<BookingVO> bookingList(BookingVO bvo);
}
