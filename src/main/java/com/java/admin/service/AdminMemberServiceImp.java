package com.java.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.admin.dao.AdminMemberDao;
import com.java.admin.dto.AdminMemberDto;
import com.java.aop.IlgumAspect;

/**
 * @author 최선권
 * @date 2019.08.09
 * @description 관리자 회원관리 시스템 서비스
 */ 

@Component
public class AdminMemberServiceImp implements AdminMemberService {
	@Autowired
	private AdminMemberDao memberDao;

	//회원관리시스템 초기화면  &  목록보기 & 검색 & 페이징
	@Override
	public void MemberList(ModelAndView mav) {
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
		List<AdminMemberDto> MemberList=null;
		if(keyword != null) {
			count=memberDao.MemberSearchCount(searchType, keyword);
			if(count > 0){
				MemberList=memberDao.MemberSearchList(searchType, keyword, startRow, endRow);
				IlgumAspect.logger.info(IlgumAspect.logMsg +  "MemberList.size: " + MemberList.size());
			}
		}else {
			count=memberDao.MemberCount();
			if(count > 0){
				MemberList=memberDao.MemberList(startRow, endRow);
				IlgumAspect.logger.info(IlgumAspect.logMsg +  "MemberList.size: " + MemberList.size());
			}

		}
		IlgumAspect.logger.info(IlgumAspect.logMsg +  "count: " + count +","+ keyword +","+ searchType);
		
		
		mav.addObject("MemberList", MemberList);
		mav.addObject("count", count);
		mav.addObject("searchType", searchType);
		mav.addObject("keyword", keyword);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		
		mav.setViewName("admin/AdminMemberList.empty");	
	}

	
	//회원 상세보기 	  
	@Override public void MemberRead(ModelAndView mav) {
		Map<String, Object> map= mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		  
		String member_id = request.getParameter("member_id");
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		System.out.println("member_id : "+member_id);
		AdminMemberDto memberDto = memberDao.MemberRead(member_id);
		IlgumAspect.logger.info(IlgumAspect.logMsg + memberDto.toString());
		  
		mav.addObject("memberDto",memberDto); 
		mav.addObject("pageNumber",pageNumber);
		
		mav.setViewName("admin/AdminMemberRead.empty");	
	}
	 
}
