/*
 * package com.oasys.client.service;
 * 
 * import java.util.List;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Service;
 * 
 * import com.oasys.admin.notice.dao.NoticeDao; import
 * com.oasys.admin.notice.vo.NoticeVO;
 * 
 * import lombok.Setter; import lombok.extern.log4j.Log4j;
 * 
 * @Log4j
 * 
 * @Service public class NoticeServiceImpl implements NoticeService{
 * 
 * @Setter(onMethod_ = @Autowired) private NoticeDao noticeDao;
 * 
 * @Override public List<NoticeVO> noticeList(NoticeVO nvo) {
 * 
 * log.info("noticeList............");
 * 
 * List<NoticeVO> myList = null; myList = noticeDao.noticeList(nvo);
 * 
 * return myList; }
 * 
 * @Override public int noticeListCnt(NoticeVO nvo) {
 * 
 * return noticeDao.noticeListCnt(nvo); }
 * 
 * 
 * 
 * 
 * }
 */