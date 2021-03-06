package com.java.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.admin.dao.AdminUserOrderDao;
import com.java.admin.dto.AdminBookDto;
import com.java.admin.dto.AdminMemberDto;
import com.java.aop.IlgumAspect;
import com.java.order.dto.OrderDto;

/**
 * @author 최선권
 * @date 2019.08.12
 * @description 관리자 회원관리 시스템 서비스
 */ 

@Component
public class AdminUserOrderServiceImp implements AdminUserOrderService {
	@Autowired
	private AdminUserOrderDao userOrderDao;

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
		List<OrderDto> userOrderList=null;

		
		//검색기능 구현으로인한 조회목록 뿌리기 구문 정리
		if(keyword != null) {//키워드값이 있을경우 셀렉트항목의  주제를 선택하여 키워드값 목록 조희
			count=userOrderDao.OrderSearchCount(searchType, keyword);
			if(count > 0){//해당목록이 1개라도 있을경우
				userOrderList=userOrderDao.OrderSearchList(searchType, keyword, startRow, endRow);
				IlgumAspect.logger.info(IlgumAspect.logMsg +  "userOrderList.size: " + userOrderList.size());
			}
		}else {//키워드값이 없을경우 전체목록 조회하기
			count=userOrderDao.OrderCount();
			System.out.println(count);
			if(count > 0){//해당목록이 1개라도 있을경우
				userOrderList=userOrderDao.OrderList(startRow, endRow);
				IlgumAspect.logger.info(IlgumAspect.logMsg +  "userOrderList.size: " + userOrderList.size());
			}
			
		}
		IlgumAspect.logger.info(IlgumAspect.logMsg +  "count: " + count);


		mav.addObject("userOrderList", userOrderList);
		mav.addObject("count", count);	// count값이 0일경우 조회목록이 없을경우는 jsp페이지에서 처리
		mav.addObject("searchType", searchType);
		mav.addObject("keyword", keyword);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("admin/AdminUserOrderList.empty");	
	}

	
	//상담글상세보기 	  
	@Override 
	public void UserOrderRead(ModelAndView mav) {
		Map<String, Object> map= mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		 
		int order_bunho = Integer.parseInt(request.getParameter("order_bunho"));
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		String member_id = request.getParameter("member_id");
		
		OrderDto userOrderDto = userOrderDao.userOrderRead(order_bunho);
		AdminMemberDto memberDto = userOrderDao.userInfo(member_id);

		String book_isbn = userOrderDto.getBook_isbn();
		
		AdminBookDto bookDto = userOrderDao.bookInfo(book_isbn);

		IlgumAspect.logger.info(IlgumAspect.logMsg + userOrderDto.toString());
		IlgumAspect.logger.info(IlgumAspect.logMsg + memberDto.toString());


		mav.addObject("userOrderDto", userOrderDto); 
		mav.addObject("bookDto", bookDto); 
		mav.addObject("memberDto", memberDto); 
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("admin/AdminUserOrderRead.empty");	
	}
	
//	//관리자글상세보기
//	@Override 
//	public void QuestionReadReply(ModelAndView mav) {
//				Map<String, Object> map= mav.getModelMap();
//		AdminQuestionDto questionDto =  (AdminQuestionDto)map.get("questionDto");
//		HttpServletRequest request = (HttpServletRequest) map.get("request");
//		 
//		int q_number = Integer.parseInt(request.getParameter("q_number"));
//		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
//	
//		questionDto = questionDao.QuestionRead(q_number);
//		IlgumAspect.logger.info(IlgumAspect.logMsg + questionDto.toString());
//		questionDto.setA_title(questionDto.getA_title().replace("<br/>","\r\n"));
//		
//		mav.addObject("questionDto",questionDto);
//		mav.addObject("pageNumber",pageNumber);
//		mav.setViewName("admin/AdminQuestionReadReply.empty");
//	}
//	
//
//
//	@Override
//	public void QuestionWrite(ModelAndView mav) {
//		
//		Map<String,Object> map = mav.getModelMap();
//		AdminQuestionDto questionDto =  (AdminQuestionDto)map.get("questionDto");
//		HttpServletRequest request = (HttpServletRequest) map.get("request");
//
//		String member_id = request.getParameter("member_id").trim();
//		int pageNumber = Integer.parseInt(request.getParameter("pageNumber").trim());
//		int q_number = Integer.parseInt(request.getParameter("q_number").trim());
//
//		questionDto = questionDao.QuestionSelect(q_number, member_id);
////		questionDto.setA_title(questionDto.getA_title().replace("\r\n", "<br/>"));
//
//		IlgumAspect.logger.info(IlgumAspect.logMsg + questionDto.toString());
//		
//		mav.addObject("questionDto",questionDto);
//		mav.addObject("member_id", member_id);
//		mav.addObject("pageNumber", pageNumber);
//		mav.addObject("q_number", q_number);
//		mav.setViewName("admin/AdminQuestionWrite.empty");
//
//	}
//
//
	@Override
	public void UserOrderUpdateOk(ModelAndView mav) {
		Map<String,Object> map = mav.getModel();
		OrderDto userOrderDto =  (OrderDto)map.get("userOrderDto");
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		System.out.println(userOrderDto.toString());
		int check = userOrderDao.userOrderUpdateOk(userOrderDto);
		IlgumAspect.logger.info(IlgumAspect.logMsg + check);
		
		mav.addObject("check", check);
		mav.setViewName("admin/AdminUserOrderUpdateOk.empty");	
	}
//
//
//	@Override
//	public void QuestionUpdate(ModelAndView mav) {
//		Map<String, Object> map = mav.getModelMap();
//		HttpServletRequest request = (HttpServletRequest) map.get("request");
//		
//		int q_number = Integer.parseInt(request.getParameter("q_number").trim());
//		int pageNumber = Integer.parseInt(request.getParameter("pageNumber").trim());
//		
//		AdminQuestionDto questionDto = questionDao.QuestionRead(q_number);
//		IlgumAspect.logger.info(IlgumAspect.logMsg + questionDto.toString());
//		
//		mav.addObject("questionDto",questionDto);
//		mav.addObject("q_Number",q_number);
//		mav.addObject("pageNumber",pageNumber);
//		
//		mav.setViewName("admin/AdminQuestionWriteReply.empty");
//	}
//
	public void  UserOrderDeleteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int order_bunho = Integer.parseInt(request.getParameter("order_bunho"));
		
		int check = userOrderDao.userOrderDelete(order_bunho);
		IlgumAspect.logger.info(IlgumAspect.logMsg + check);
		
		mav.addObject("check",check);
		
		mav.setViewName("admin/AdminUserOrderDeleteOk.empty");	
	}
}
