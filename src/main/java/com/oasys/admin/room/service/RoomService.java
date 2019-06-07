package com.oasys.admin.room.service;

import java.util.List;

import com.oasys.admin.room.vo.RoomVO;

public interface RoomService {

	public List<RoomVO> roomList(RoomVO rvo);

	public int roomInsert(RoomVO rvo);

	public RoomVO roomDetail(RoomVO rvo);

	public int roomDelete(RoomVO rvo);

}
