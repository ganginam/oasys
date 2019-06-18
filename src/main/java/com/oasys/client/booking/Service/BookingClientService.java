package com.oasys.client.booking.Service;

import java.util.List;

import com.oasys.common.booking.vo.BookingVO;

public interface BookingClientService {

	public List<BookingVO> roomList(BookingVO bvo);	
	
	public BookingVO bookingClientDetail(BookingVO bvo);

	public BookingVO bookingClientSearch(BookingVO bvo);

	public int bookingClientCancel(BookingVO bvo);

								
}
