package com.spring.Imuseum.view.learn;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.Imuseum.learn.GroupReservationVO;
import com.spring.Imuseum.learn.LearnService;

@RestController
public class LearnAjaxController {
	@Autowired
	private LearnService learnService;
	
	@RequestMapping("/todayGroupReservation.do")
	//@ResponseBody //response 응답객체의 몸체(body)에 데이터 전달
	public List<GroupReservationVO> todayGroupReservation(GroupReservationVO vo) {
		List<GroupReservationVO> todayList = learnService.todayGroupReservation(vo);
		System.out.println("todayList : " + todayList);
		
		return todayList;
	}
	@RequestMapping("/weekGroupReservation.do")
	//@ResponseBody //response 응답객체의 몸체(body)에 데이터 전달
	public List<GroupReservationVO> weekGroupReservation(GroupReservationVO vo) {
		List<GroupReservationVO> weekList = learnService.weekGroupReservation(vo);
		System.out.println("weekList : " + weekList);
		
		return weekList;
	}
	@RequestMapping("/monthGroupReservation.do")
	//@ResponseBody //response 응답객체의 몸체(body)에 데이터 전달
	public List<GroupReservationVO> monthGroupReservation(GroupReservationVO vo) {
		List<GroupReservationVO> monthList = learnService.monthGroupReservation(vo);
		System.out.println("monthList : " + monthList);
		
		return monthList;
	}
	
}
