package com.spring.Imuseum.notice;

import java.util.List;


public interface NoticeService {
	
	List<NoticeVO> allNotice(NoticeVO vo);
	List<NoticeVO> deNotice(NoticeVO vo);
	List<NoticeVO> muNotice(NoticeVO vo);
	List<NoticeVO> daeNotice(NoticeVO vo);
	List<NoticeVO> guNotice(NoticeVO vo);
	
	
}
