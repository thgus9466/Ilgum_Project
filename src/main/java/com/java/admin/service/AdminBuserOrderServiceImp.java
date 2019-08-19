package com.java.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.admin.dao.AdminBuserOrderDao;
import com.java.admin.dto.AdminBookDto;
import com.java.aop.IlgumAspect;
import com.java.order.dto.BuserOrderDto;

/**
 * @author 최선권
 * @date 2019.08.19
 * @description 관리자 비회원주문관리 시스템 서비스
 */ 

@Component
public class AdminBuserOrderServiceImp implements AdminBuserOrderService {
	@Autowired
	private AdminBuserOrderDao buserOrderDao;

	//회원관리시스템 초기화면  &  목록보기 & 검색 & 페이징
	@Override
	public void UserOrderList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");	
		String pageNumber=request.getParameter("pageNumber");
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		if(pageNumber==null) pageNumber="1";
		
		int boardSize=10;
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;			
		int endRow=currentPage*boardSize;
	
		int count = 0;
		List<BuserOrderDto> buserOrderList=null;

		
		//검색기능 구현으로인한 조회목록 뿌리기 구문 정리
		if(keyword != null) {//키워드값이 있을경우 셀렉트항목의  주제를 선택하여 키워드값 목록 조희
			count=buserOrderDao.OrderSearchCount(searchType, keyword);
			if(count > 0){//해당목록이 1개라도 있을경우
				buserOrderList=buserOrderDao.OrderSearchList(searchType, keyword, startRow, endRow);
				IlgumAspect.logger.info(IlgumAspect.logMsg +  "buserOrderList.size: " + buserOrderList.size());
			}
		}else {//키워드값이 없을경우 전체목록 조회하기
			count=buserOrderDao.OrderCount();
			System.out.println(count);
			if(count > 0){//해당목록이 1개라도 있을경우
				buserOrderList=buserOrderDao.OrderList(startRow, endRow);
				IlgumAspect.logger.info(IlgumAspect.logMsg +  "buserOrderList.size: " + buserOrderList.size());
			}
			
		}
		IlgumAspect.logger.info(IlgumAspect.logMsg +  "count: " + count);


		mav.addObject("buserOrderList", buserOrderList);
		mav.addObject("count", count);	// count값이 0일경우 조회목록이 없을경우는 jsp페이지에서 처리
		mav.addObject("searchType", searchType);
		mav.addObject("keyword", keyword);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("admin/AdminBuserOrderList.empty");	
	}

	
	//상담글상세보기 	  
	@Override 
	public void UserOrderRead(ModelAndView mav) {
		Map<String, Object> map= mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		 
		int order_bunho = Integer.parseInt(request.getParameter("order_bunho"));
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		
		BuserOrderDto buserOrderDto = buserOrderDao.userOrderRead(order_bunho);
		String book_isbn = buserOrderDto.getBook_isbn();
		
		AdminBookDto bookDto = buserOrderDao.bookInfo(book_isbn);

		IlgumAspect.logger.info(IlgumAspect.logMsg + buserOrderDto.toString());


		mav.addObject("buserOrderDto", buserOrderDto); 
		mav.addObject("bookDto", bookDto); 
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("admin/AdminBuserOrderRead.empty");	
	}

	@Override
	public void UserOrderUpdateOk(ModelAndView mav) {
		Map<String,Object> map = mav.getModel();
		BuserOrderDto buserOrderDto =  (BuserOrderDto)map.get("buserOrderDto");
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		System.out.println(buserOrderDto.toString());
		int check = buserOrderDao.userOrderUpdateOk(buserOrderDto);
		IlgumAspect.logger.info(IlgumAspect.logMsg + check);
		
		mav.addObject("check", check);
		mav.setViewName("admin/AdminBuserOrderUpdateOk.empty");	
	}

	public void  UserOrderDeleteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int order_bunho = Integer.parseInt(request.getParameter("order_bunho"));
		
		int check = buserOrderDao.userOrderDelete(order_bunho);
		IlgumAspect.logger.info(IlgumAspect.logMsg + check);
		
		mav.addObject("check",check);
		
		mav.setViewName("admin/AdminBuserOrderDeleteOk.empty");	
	}
}
