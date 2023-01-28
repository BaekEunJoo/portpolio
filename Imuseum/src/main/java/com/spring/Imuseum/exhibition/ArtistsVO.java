package com.spring.Imuseum.exhibition;

public class ArtistsVO {

	private int artistNum,exhNum;
	private String artist, artistInfo,	artistImage;
	private String exhName;
	
	public int getArtistNum() {
		return artistNum;
	}
	public void setArtistNum(int artistNum) {
		this.artistNum = artistNum;
	}
	public String getExhName() {
		return exhName;
	}
	public void setExhName(String exhName) {
		this.exhName = exhName;
	}
	public int getExhNum() {
		return exhNum;
	}
	public void setExhNum(int exhNum) {
		this.exhNum = exhNum;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getArtistInfo() {
		return artistInfo;
	}
	public void setArtistInfo(String artistInfo) {
		this.artistInfo = artistInfo;
	}
	public String getArtistImage() {
		return artistImage;
	}
	public void setArtistImage(String artistImage) {
		this.artistImage = artistImage;
	}
	
	@Override
	public String toString() {
		return "ArtistsVO [artistNum=" + artistNum + ", exhNum=" + exhNum + ", artist=" + artist + ", artistInfo="
				+ artistInfo + ", artistImage=" + artistImage + ", exhName=" + exhName + "]";
	}
	
}
