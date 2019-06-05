package com.oasys.admin.room.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oasys.admin.room.dao.RoomDao;
import com.oasys.admin.room.vo.RoomVO;


import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class RoomServiceImpl implements RoomService{
	@Setter(onMethod_=@Autowired)
	private RoomDao roomDao;
	
	@Override
	public List<RoomVO> roomList(RoomVO rvo) {
		List<RoomVO> list = null;
		list = roomDao.roomList(rvo);
		log.info("");
		return list;
	}

}
