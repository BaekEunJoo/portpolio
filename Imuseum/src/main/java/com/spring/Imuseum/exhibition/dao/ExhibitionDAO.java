package com.spring.Imuseum.exhibition.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.Imuseum.exhibition.ArtistsVO;
import com.spring.Imuseum.exhibition.ExhibitionVO;
import com.spring.Imuseum.learn.LearnVO;

public interface ExhibitionDAO {

	//전시 입력
	public void insertExhibition(ExhibitionVO vo);
	//전시 수정
	public void updateExhibition(ExhibitionVO vo);
	//전시 삭제
	public void deleteExhibition(ExhibitionVO vo);
	
	//진행중 전시조회
	public List<ExhibitionVO> getExhibitionNow();
	public List<ExhibitionVO> getExhibitionOld();
	
	//지난 전시조회
	public List<ExhibitionVO> getExhibitionPast();
	public List<ExhibitionVO> exhibitionPastYear(String year);
	
	//전시 상세보기
	public ExhibitionVO getExhibitionOne(int exhNum);
	
	
	//전시 검색
	public List<ExhibitionVO> exhibitionSearch(String searchKeyword);
	public List<LearnVO> learnSearch(String searchKeyword);
	
	//모든 전시조회(ADMIN)
	public int ExhibitiontotalCount();
	public List<ExhibitionVO> getExhibition(@Param("begin")int begin, @Param("end") int end);
	public List<ExhibitionVO> getExhibitionCal(String calDay);
	public List<LearnVO> getLearnCal(String calDay);
	public List<LearnVO> getLearnCalAjax(String calDay);
	
	//작가 입력
	public void insertArtist(ArtistsVO vo);
	//작가 수정
	public void updateArtist(ArtistsVO vo);
	//작가 삭제
	public void deleteArtist(ArtistsVO vo);
	//모든 작가 조회(ADMIN)
	public List<ArtistsVO> getAritsts();
	//전시 작가 조회(detail)
	public List<ArtistsVO> getExAritsts(int exhNum);
	//작가 상세보기
	public ArtistsVO getArtistOne(int artistNum);
	
}
