package com.spring.Imuseum.exhibition;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.Imuseum.learn.LearnVO;

public interface ExhibitionService {
	
	void insertExhibition(ExhibitionVO vo);
	void updateExhibition(ExhibitionVO vo);
	void deleteExhibition(ExhibitionVO vo);
	
	List<ExhibitionVO> getExhibitionNow();
	List<ExhibitionVO> getExhibitionOld();
	
	List<ExhibitionVO> getExhibitionPast();
	List<ExhibitionVO> exhibitionPastYear(String year);
	
	ExhibitionVO getExhibitionOne(int exhNum);
	int ExhibitiontotalCount();
	List<ExhibitionVO> getExhibition(@Param("begin")int begin, @Param("end") int end);
	List<ExhibitionVO> getExhibitionCal(String calDay);
	List<LearnVO> getLearnCal(String calDay);
	List<LearnVO> getLearnCalAjax(String calDay);
	
	List<ExhibitionVO> exhibitionSearch(String searchKeyword);
	List<LearnVO> learnSearch(String searchKeyword);
	
	void insertArtist(ArtistsVO vo);
	void updateArtist(ArtistsVO vo);
	void deleteArtist(ArtistsVO vo);
	List<ArtistsVO> getAritsts();
	
	List<ArtistsVO> getExAritsts(int exhNum);
	ArtistsVO getArtistOne(int artistNum);
}
