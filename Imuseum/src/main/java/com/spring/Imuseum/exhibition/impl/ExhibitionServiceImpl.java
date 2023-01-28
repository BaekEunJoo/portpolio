package com.spring.Imuseum.exhibition.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.Imuseum.exhibition.ArtistsVO;
import com.spring.Imuseum.exhibition.ExhibitionService;
import com.spring.Imuseum.exhibition.ExhibitionVO;
import com.spring.Imuseum.exhibition.dao.ExhibitionDAO;
import com.spring.Imuseum.learn.LearnVO;


@Service("exhibitionService")
public class ExhibitionServiceImpl implements ExhibitionService{

	@Autowired
	private ExhibitionDAO exhibitionDAO;

	@Override
	public void insertExhibition(ExhibitionVO vo) {
		exhibitionDAO.insertExhibition(vo);
	}

	@Override
	public void updateExhibition(ExhibitionVO vo) {
		exhibitionDAO.updateExhibition(vo);
	}

	@Override
	public void deleteExhibition(ExhibitionVO vo) {
		exhibitionDAO.deleteExhibition(vo);
	}

	@Override
	public List<ExhibitionVO> getExhibitionNow() {
		return exhibitionDAO.getExhibitionNow();
	}

	@Override
	public List<ExhibitionVO> getExhibitionPast() {
		return exhibitionDAO.getExhibitionPast();
	}

	@Override
	public ExhibitionVO getExhibitionOne(int exhNum) {
		return exhibitionDAO.getExhibitionOne(exhNum);
	}


	@Override
	public void insertArtist(ArtistsVO vo) {
		exhibitionDAO.insertArtist(vo);
	}

	@Override
	public void updateArtist(ArtistsVO vo) {
		exhibitionDAO.updateArtist(vo);
		
	}

	@Override
	public void deleteArtist(ArtistsVO vo) {
		exhibitionDAO.deleteArtist(vo);
		
	}

	@Override
	public List<ArtistsVO> getAritsts() {
		return exhibitionDAO.getAritsts();
	}

	@Override
	public List<ArtistsVO> getExAritsts(int exhNum) {
		return exhibitionDAO.getExAritsts(exhNum);
	}

	@Override
	public ArtistsVO getArtistOne(int artistNum) {
		return exhibitionDAO.getArtistOne(artistNum);
	}

	@Override
	public List<ExhibitionVO> exhibitionPastYear(String year) {
		return exhibitionDAO.exhibitionPastYear(year);
	}

	@Override
	public List<ExhibitionVO> getExhibitionOld() {
		return exhibitionDAO.getExhibitionOld();
	}

	@Override
	public List<ExhibitionVO> exhibitionSearch(String searchKeyword) {
		return exhibitionDAO.exhibitionSearch(searchKeyword);
	}

	@Override
	public List<LearnVO> learnSearch(String searchKeyword) {
		return exhibitionDAO.learnSearch(searchKeyword);
	}

	@Override
	public int ExhibitiontotalCount() {
		return exhibitionDAO.ExhibitiontotalCount();
	}

	@Override
	public List<ExhibitionVO> getExhibition(int begin, int end) {
		return exhibitionDAO.getExhibition(begin, end);
	}

	@Override
	public List<ExhibitionVO> getExhibitionCal(String calDay) {
		return exhibitionDAO.getExhibitionCal(calDay);
	}

	@Override
	public List<LearnVO> getLearnCal(String calDay) {
		return exhibitionDAO.getLearnCal(calDay);
	}
	@Override
	public List<LearnVO> getLearnCalAjax(String calDay) {
		return exhibitionDAO.getLearnCalAjax(calDay);
	}

	
	
	
}
