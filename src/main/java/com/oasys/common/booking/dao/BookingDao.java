package com.oasys.common.booking.dao;

import java.util.List;

import com.oasys.common.booking.vo.BookingVO;

public interface BookingDao {
	public List<BookingVO> bookingList(BookingVO bvo);
}
