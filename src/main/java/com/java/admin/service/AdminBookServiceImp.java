package com.java.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.admin.dao.AdminBookDao;
import com.java.admin.dto.AdminBookDto;
import com.java.aop.IlgumAspect;

/**
 * @author 최선권
 * @date 2019.08.08
 * @description 관리자 도서관리 시스템 서비스
 */ 

@Component
public class AdminBookServiceImp implements AdminBookService {
	@Autowired
	private AdminBookDao bookDao;

	//도서관리시스템 초기화면  &  목록보기 & 검색 & 페이징
	@Override
	public void bookList(ModelAndView mav) {
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
		List<AdminBookDto> bookList=null;
		if(keyword != null) {
			count=bookDao.bookSearchCount(searchType, keyword);
			if(count > 0){
				bookList=bookDao.bookSearchList(searchType, keyword, startRow, endRow);
				IlgumAspect.logger.info(IlgumAspect.logMsg +  "bookList.size: " + bookList.size());
			}
		}else {
			count=bookDao.adminBookCount();
			if(count > 0){
				bookList=bookDao.bookList(startRow, endRow);
				IlgumAspect.logger.info(IlgumAspect.logMsg +  "bookList.size: " + bookList.size());
			}

		}
		IlgumAspect.logger.info(IlgumAspect.logMsg +  "count: " + count);
		
		
		mav.addObject("bookList", bookList);
		mav.addObject("count", count);
		mav.addObject("searchType", searchType);
		mav.addObject("keyword", keyword);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		
		mav.setViewName("admin/AdminBook.empty");	
	}

	//도서추가완료
	@Override
	public void bookWriteOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		
		AdminBookDto bookDto = (AdminBookDto) map.get("bookDto");
		int check = bookDao.select(bookDto.getBook_isbn());
		int dup = 0;
		if(check > 0) {
			dup ++;
			mav.addObject("check", 0);
			mav.addObject("dup", dup);
			mav.setViewName("admin/writeOk.empty");
		}else {
			
			int check2=bookDao.insert(bookDto);
			IlgumAspect.logger.info(IlgumAspect.logMsg + "check: "+ check2 + "bookDto: " + bookDto.toString());

			mav.addObject("check", check2);

			mav.setViewName("admin/writeOk.empty");
		}
		
			
	}


	//도서 상세보기
	@Override
	public void bookRead(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String book_isbn = request.getParameter("book_isbn");
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		
		AdminBookDto bookDto = bookDao.bookRead(book_isbn);
		IlgumAspect.logger.info(IlgumAspect.logMsg + bookDto.toString());
		
		//일반size 이미지
		if(bookDto.getBook_img_url() != null) {
			int index = bookDto.getBook_img_url().indexOf("_")+1;
			bookDto.setBook_img_url(bookDto.getBook_img_url().substring(index));
		}
		//xlsize 이미지
		if(bookDto.getBook_imgxl_url() != null) {
			int index = bookDto.getBook_imgxl_url().indexOf("_")+1;
			bookDto.setBook_imgxl_url(bookDto.getBook_imgxl_url().substring(index));
		}
		mav.addObject("bookDto",bookDto);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName("admin/AdminBookRead.empty");
		
	}

	//도서 추가시 ISBN 실시간 중복확인
	@Override
	public void isbnCheck(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String book_isbn = request.getParameter("book_isbn");
		int checkisbn = bookDao.select(book_isbn);
		
		int check = 0;
		if(checkisbn != 0) check = 1;

		IlgumAspect.logger.info(IlgumAspect.logMsg + check);
		
		mav.addObject("check", check);
	}

	//도서정보 수정
	@Override
	public void bookUpdate(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String book_isbn = request.getParameter("book_isbn").trim();
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber").trim());
		
		AdminBookDto bookDto = bookDao.bookRead(book_isbn);
		IlgumAspect.logger.info(IlgumAspect.logMsg + bookDto.toString());
		

		mav.addObject("bookDto",bookDto);
		mav.addObject("pageNumber",pageNumber);

		mav.setViewName("admin/AdminBookUpdate.empty");
	}

	//도서정보 수정 완료
	@Override
	public void bookUpdateOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
	
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber").trim());
		AdminBookDto bookDto = (AdminBookDto)map.get("bookDto");
		
		int check = bookDao.bookUpdate(bookDto);
		IlgumAspect.logger.info(IlgumAspect.logMsg + "check : " + check);
		
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("check",check);
		mav.setViewName("admin/AdminBookUpdateOk.empty");
	}
	
}
