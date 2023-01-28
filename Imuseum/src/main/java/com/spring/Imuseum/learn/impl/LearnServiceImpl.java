package com.spring.Imuseum.learn.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.Imuseum.learn.GroupReservationVO;
import com.spring.Imuseum.learn.LearnLikeVO;
import com.spring.Imuseum.learn.LearnService;
import com.spring.Imuseum.learn.LearnVO;
import com.spring.Imuseum.learn.dao.LearnDAO;

@Service("learnService")
public class LearnServiceImpl implements LearnService{
	@Autowired
	private LearnDAO learnDao;
	
	public LearnServiceImpl() {
		
	}

	@Override
	public void insertLearn(LearnVO vo) {
		learnDao.insertLearn(vo);
	}
	@Override
	public void updateLearn(LearnVO vo) {
		learnDao.updateLearn(vo);	
	}
	@Override
	public void deleteLearn(LearnVO vo) {
		learnDao.deleteLearn(vo);	
	}
	@Override
	public LearnVO getLearn(LearnVO vo) {
		return learnDao.getLearn(vo);
	}
	@Override
	public List<LearnVO> getLearnList2(LearnVO vo) {
		return learnDao.getLearnList2(vo);
	}
	@Override
	public int countLearn() {
		return learnDao.countLearn();
	}
	@Override
	public int countLearn2() {
		return learnDao.countLearn2();
	}
//	@Override
//	public List<LearnVO> getLearnList() {
//		return null;
//	}
	@Override
	public List<LearnVO> yearLearn(LearnVO vo) {
		System.out.println("impl yearLearn 실행");
		return learnDao.yearLearn(vo);
	}
	@Override
	public List<LearnVO> categoryLearn(LearnVO vo) {
		System.out.println("impl 현재 categoryLearn 실행");
		return learnDao.categoryLearn(vo);
	}
//	@Override
//	public List<GroupReservationVO> groupReservation(GroupReservationVO vo) {
//		System.out.println("impl groupReservation 실행");
//		return learnDao.groupReservation(vo);
//	}
	@Override
	public void InsertGroupReservation(GroupReservationVO vo) {
		learnDao.InsertGroupReservation(vo);
	}
	@Override
	public List<GroupReservationVO> regdateSearch(GroupReservationVO vo) {
		System.out.println("impl regdateSearch 시작");
		return learnDao.regdateSearch(vo);
	}
	@Override
	public int viewsLearn(LearnVO vo) {
		return learnDao.viewsLearn(vo);
	}
	@Override
	public List<LearnVO> getLearnList2() {
		return null;
	}
	@Override
	public List<LearnVO> selectViews(LearnVO vo) {
		return learnDao.selectViews(vo);
	}
	@Override
	public List<LearnVO> selectNew(LearnVO vo) {
		return learnDao.selectNew(vo);
	}
	@Override
	public List<LearnVO> selectOld(LearnVO vo) {
		return learnDao.selectOld(vo);
	}
	@Override
	public void groupReservationDelete(GroupReservationVO vo) {
		learnDao.groupReservationDelete(vo);
	}
	@Override
	public List<LearnVO> categoryLearn2(LearnVO vo) {
		System.out.println("impl 지난 categoryLearn2 실행");
		return learnDao.categoryLearn2(vo);
	}
	@Override
	public List<GroupReservationVO> todayGroupReservation(GroupReservationVO vo) {
		return learnDao.todayGroupReservation(vo);
	}
	@Override
	public List<GroupReservationVO> weekGroupReservation(GroupReservationVO vo) {
		return learnDao.weekGroupReservation(vo);
	}
	@Override
	public List<GroupReservationVO> monthGroupReservation(GroupReservationVO vo) {
		return learnDao.monthGroupReservation(vo);
	}
	@Override
	public void learnDelete2(LearnVO vo) {
		learnDao.learnDelete2(vo);	
	}
	@Override
	public int updateLike(LearnVO vo) {
		return learnDao.updateLike(vo);
	}
	@Override
	public int updateLikeCancel(LearnVO vo) {
		return learnDao.updateLikeCancel(vo);
	}
	@Override
	public void insertLike(LearnLikeVO vo) {
		learnDao.insertLike(vo);
	}

	@Override
	public int updateLikeCheck(LearnLikeVO vo) {
		return learnDao.updateLikeCheck(vo);
	}

	@Override
	public List<LearnLikeVO> selectLearnLike(LearnLikeVO vo) {
		return learnDao.selectLearnLike(vo);
	}

	@Override
	public int updateLearnLikeCheck(LearnVO vo) {
		return learnDao.updateLearnLikeCheck(vo);
	}
	@Override
	public void insertLike2(LearnLikeVO vo) {
		learnDao.insertLike2(vo);
		
	}

	@Override
	public int countHeart(Map<String, String> map) {
		return learnDao.countHeart(map);
	}

	@Override
	public void deleteLike(LearnLikeVO vo) {
		learnDao.deleteLike(vo);
		
	}

	
	
	
	
	
	
	
	@Override
	public List<LearnVO> getLearnList(int begin, int end) {
		return learnDao.getLearnList(begin, end);
	}
	@Override
	public int getLearnTotalCount() {
		return learnDao.getLearnTotalCount();
	}

	@Override
	public int getGroupReservationTotalCount() {
		return learnDao.getGroupReservationTotalCount();
	}

	@Override
	public List<GroupReservationVO> groupReservation(int begin, int end) {
		return learnDao.groupReservation(begin, end);
	}

	@Override
	public List<LearnVO> getLearnList3(LearnVO vo) {
		return learnDao.getLearnList3(vo);
	}

	
	
	
	@Override
	public int getLearnTotalCount4() {
		return learnDao.getLearnTotalCount4();
	}

	@Override
	public List<LearnVO> getLearnList4(int begin, int end) {
		return learnDao.getLearnList4(begin, end);
	}

	@Override
	public void deleteLearn2(LearnVO vo) {
		learnDao.deleteLearn2(vo);
		
	}

	@Override
	public List<GroupReservationVO> groupReservationMypage(GroupReservationVO vo) {
		return learnDao.groupReservationMypage(vo);
	}








	




	


	
	
	
	
	
}
