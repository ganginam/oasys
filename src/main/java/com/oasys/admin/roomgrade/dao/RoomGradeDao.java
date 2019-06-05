package com.oasys.admin.roomgrade.dao;

import java.util.List;

import com.oasys.admin.roomgrade.vo.RoomGradeVO;

public interface RoomGradeDao {

	public int roomGradeInsert(RoomGradeVO gvo);

	public List<RoomGradeVO> roomGradeList(RoomGradeVO gvo);

	public RoomGradeVO roomGradeDetail(RoomGradeVO gvo);

	public int roomGradeDelete(RoomGradeVO gvo);

	public int roomGradeUpdate(RoomGradeVO gvo);

}
