package com.spring.Imuseum.order.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.Imuseum.order.OrderPagePVO;
import com.spring.Imuseum.order.OrderVO;
import com.spring.Imuseum.order.ProductShipVO;

@Repository
public class OrderDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public OrderDAO() {
		System.out.println("OrderDAO() 객체 생성");
	}
	
	public OrderPagePVO getPInfo(OrderPagePVO vo) {
		return mybatis.selectOne("orderDAO.getProductInfo", vo.getProductNum());
	}
	
	public void insertOrders(OrderVO vo) {
		mybatis.insert("orderDAO.insertOrders", vo);
	}
	public void insertOrderProduct(OrderPagePVO pvo) {
		mybatis.insert("orderDAO.insertOrderProduct", pvo);
	}
	public String getOrderNum() {
		return mybatis.selectOne("orderDAO.getOrderNum");
	}
	
	public OrderVO getOrder(String orderNum) {
		return mybatis.selectOne("orderDAO.getOrder", orderNum);
	}
	
	public OrderVO getShip(OrderVO vo) {
		return mybatis.selectOne("orderDAO.getShip", vo);
	}
	
	
	public List<OrderVO> getOrderList(OrderVO vo) {
		return mybatis.selectList("orderDAO.getOrderList", vo);
	}
	
	public List<OrderVO> getSaleList(OrderVO vo) {
		return mybatis.selectList("orderDAO.getSaleList", vo);
	}
	
	public List<OrderVO> getdaySaleList(OrderVO vo) {
		return mybatis.selectList("orderDAO.getdaySaleList", vo);
	}
	public List<OrderVO> getday2SaleList(OrderVO vo) {
		return mybatis.selectList("orderDAO.getday2SaleList", vo);
	}
	public List<OrderVO> getday3SaleList(OrderVO vo) {
		return mybatis.selectList("orderDAO.getday3SaleList", vo);
	}
	public List<OrderVO> getday4SaleList(OrderVO vo) {
		return mybatis.selectList("orderDAO.getday4SaleList", vo);
	}
	public List<OrderVO> getday5SaleList(OrderVO vo) {
		return mybatis.selectList("orderDAO.getday5SaleList", vo);
	}
	
	public void updateShip(ProductShipVO vo) {
		mybatis.insert("orderDAO.updateShip", vo);
	}
	
	public void updateOrderCnt(OrderPagePVO pvo) {
		mybatis.update("orderDAO.updateOrderCnt", pvo);
	}
	
	public void updateDate() {
		mybatis.update("orderDAO.updateDate");
	}

	public void updateOrder(OrderVO vo) {
		mybatis.update("orderDAO.updateOrder", vo);
	}
	
	public void updateStatus(OrderVO vo) {
		mybatis.update("orderDAO.updateStatus", vo);
	}

	public void deleteOrder(OrderVO vo) {
		mybatis.delete("orderDAO.deleteOrder", vo);
	}
	
	public List<OrderPagePVO> getOrderProduct(String orderNum) {
		return mybatis.selectList("orderDAO.getOrderProduct", orderNum);
	}
	
	public void insertShip(String orderNum) {
		 mybatis.insert("orderDAO.insertShip", orderNum);
	}
	
}
