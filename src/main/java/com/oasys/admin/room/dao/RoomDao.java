package com.oasys.admin.room.dao;

import java.util.List;

import com.oasys.admin.room.vo.RoomVO;

public interface RoomDao {

	public List<RoomVO> roomList(RoomVO rvo);

	public int roomInsert(RoomVO rvo);

	public RoomVO roomDetail(RoomVO rvo);

	public int roomDelete(RoomVO rvo);

}
