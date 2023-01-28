package com.spring.Imuseum.notice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.Imuseum.notice.NoticeService;
import com.spring.Imuseum.notice.NoticeVO;
import com.spring.Imuseum.notice.dao.NoticeDAO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Override
	public List<NoticeVO> allNotice(NoticeVO vo) {
		return noticeDAO.allNotice(vo);
	}

	@Override
	public List<NoticeVO> deNotice(NoticeVO vo) {
		return noticeDAO.deNotice(vo);
	}

	@Override
	public List<NoticeVO> muNotice(NoticeVO vo) {
		return noticeDAO.muNotice(vo);
	}

	@Override
	public List<NoticeVO> daeNotice(NoticeVO vo) {
		return noticeDAO.daeNotice(vo);
	}

	@Override
	public List<NoticeVO> guNotice(NoticeVO vo) {
		return noticeDAO.guNotice(vo);
	}


}
