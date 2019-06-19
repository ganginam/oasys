package com.oasys.admin.roomgrade.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.oasys.admin.roomgrade.dao.RoomGradeDao;
import com.oasys.admin.roomgrade.vo.RoomGradeVO;
import com.oasys.common.file.FileUploadUtil;


import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class RoomGradeServiceImpl implements RoomGradeService{
	@Setter(onMethod_=@Autowired)
	private RoomGradeDao roomGradeDao;

	@Override
	public int roomGradeInsert(RoomGradeVO gvo) {
		log.info("RoomGradeInsertServiceImpl");
		int result = 0;
		try {
			if(gvo.getFile()!=null) {
				ArrayList<String> fileName = FileUploadUtil.fileUploads(gvo.getFile(),"roomGrade");
				gvo.setImage1(fileName.get(0));
				log.info(gvo.getImage1()+":"+fileName.get(0));
				gvo.setImage2(fileName.get(1));
				log.info(gvo.getImage2()+":"+fileName.get(1));
				gvo.setImage3(fileName.get(2));
				log.info(gvo.getImage3()+":"+fileName.get(2));
				gvo.setImage4(fileName.get(3));
				log.info(gvo.getImage4()+":"+fileName.get(3));
				gvo.setImage5(fileName.get(4));
				log.info(gvo.getImage5()+":"+fileName.get(4));
			}
			result=roomGradeDao.roomGradeInsert(gvo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
		
	}

	@Override
	public List<RoomGradeVO> roomGradeList(RoomGradeVO gvo) {
		List<RoomGradeVO> list = null;
		list = roomGradeDao.roomGradeList(gvo);
		return list;
	}

	@Override
	public RoomGradeVO roomGradeDetail(RoomGradeVO gvo) {
		RoomGradeVO detail = roomGradeDao.roomGradeDetail(gvo);
		return detail;
	}

	@Override
	public int roomGradeDelete(RoomGradeVO gvo) {
		int result = 0;
		try {
			RoomGradeVO vo = roomGradeDao.roomGradeDetail(gvo);
			FileUploadUtil.fileDelete(vo.getImage1());
			FileUploadUtil.fileDelete(vo.getImage2());
			FileUploadUtil.fileDelete(vo.getImage3());
			FileUploadUtil.fileDelete(vo.getImage4());
			FileUploadUtil.fileDelete(vo.getImage5());
			result=roomGradeDao.roomGradeDelete(gvo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public RoomGradeVO roomGradeUpdateForm(RoomGradeVO gvo) {
		RoomGradeVO detail = roomGradeDao.roomGradeDetail(gvo);
		return detail;
	}

	@Override
	public int roomGradeUpdate(RoomGradeVO gvo) {
		int result=0;
		try {
			if(gvo.getFile() != null) {
				ArrayList<String> fileName = FileUploadUtil.fileUploads(gvo.getFile(),"roomGrade");
				if(gvo.getFile().get(0).getSize()>0) {
					FileUploadUtil.fileDelete(gvo.getImage1());
					gvo.setImage1(fileName.get(0));
				}
				if(gvo.getFile().get(0).getSize()==0) {
					FileUploadUtil.fileDelete(fileName.get(0));
				}
				if(gvo.getFile().get(1).getSize()>0) {
					FileUploadUtil.fileDelete(gvo.getImage2());
					gvo.setImage2(fileName.get(1));
				}
				if(gvo.getFile().get(1).getSize()==0) {
					FileUploadUtil.fileDelete(fileName.get(1));
				}
				if(gvo.getFile().get(2).getSize()>0) {
					FileUploadUtil.fileDelete(gvo.getImage3());
					gvo.setImage3(fileName.get(2));
				}
				if(gvo.getFile().get(2).getSize()==0) {
					FileUploadUtil.fileDelete(fileName.get(2));
				}
				if(gvo.getFile().get(3).getSize()>0) {
					FileUploadUtil.fileDelete(gvo.getImage4());
					gvo.setImage4(fileName.get(3));
				}
				if(gvo.getFile().get(3).getSize()==0) {
					FileUploadUtil.fileDelete(fileName.get(3));
				}
				if(gvo.getFile().get(4).getSize()>0) {
					FileUploadUtil.fileDelete(gvo.getImage5());
					gvo.setImage5(fileName.get(4));
				}
				if(gvo.getFile().get(4).getSize()==0) {
					FileUploadUtil.fileDelete(fileName.get(4));
				}
			}else {
				gvo.setImage1("");
				gvo.setImage2("");
				gvo.setImage3("");
				gvo.setImage4("");
				gvo.setImage5("");
			}
			result = roomGradeDao.roomGradeUpdate(gvo);
		}catch(Exception e) {
			e.printStackTrace();
			result=0;
		}
		return result;
	}
}
/*if(!gvo.getFile().get(0).isEmpty()) {
	FileUploadUtil.fileDelete(gvo.getImage1());
}
gvo.setImage1(fileName.get(0));

if(!gvo.getFile().get(1).isEmpty()) {
	FileUploadUtil.fileDelete(gvo.getImage2());
}
gvo.setImage2(fileName.get(1));

if(!gvo.getFile().get(2).isEmpty()) {
	FileUploadUtil.fileDelete(gvo.getImage3());
}
gvo.setImage3(fileName.get(2));

if(!gvo.getFile().get(3).isEmpty()) {
	FileUploadUtil.fileDelete(gvo.getImage4());
}
gvo.setImage4(fileName.get(3));

if(!gvo.getFile().get(4).isEmpty()) {
	FileUploadUtil.fileDelete(gvo.getImage5());
}
gvo.setImage5(fileName.get(4));*/
