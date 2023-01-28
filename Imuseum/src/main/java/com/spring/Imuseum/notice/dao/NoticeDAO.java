package com.spring.Imuseum.notice.dao;

import java.util.List;

import com.spring.Imuseum.notice.NoticeVO;

public interface NoticeDAO {
	List<NoticeVO> allNotice(NoticeVO vo);
	List<NoticeVO> deNotice(NoticeVO vo);
	List<NoticeVO> muNotice(NoticeVO vo);
	List<NoticeVO> daeNotice(NoticeVO vo);
	List<NoticeVO> guNotice(NoticeVO vo);
}

