package com.java.book.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.IlgumAspect;
import com.java.book.dao.BookDao;
import com.java.book.dto.BestSellerDto;
import com.java.book.dto.BookDto;
import com.java.book.dto.UserBookStar;
import com.java.member.dto.MemberDto;

@Component
public class BookServiceImp implements BookService {
	@Autowired
	private BookDao bookDao;

	@Override
	public void bookDetail(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String book_isbn = request.getParameter("book_isbn");
		IlgumAspect.logger.info(IlgumAspect.logMsg + book_isbn);
		
		BookDto bookDto = bookDao.bookDetail(book_isbn);
		IlgumAspect.logger.info(IlgumAspect.logMsg + bookDto.toString());
		
		memberWrite(mav);
		
		
		mav.addObject("bookDto", bookDto);
		mav.setViewName("/book/bookDetail.tiles");
	}
	
	@Override
	public void bookPay(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = (HttpSession) map.get("session");
		MemberDto memberDto = (MemberDto) map.get("memberDto");
		
		String member_id = (String) session.getAttribute("member_id");
		String book_isbn = request.getParameter("book_isbn");
		List<BookDto> payList = bookDao.payList(book_isbn);
		
		if (member_id != null) {
			memberDto = bookDao.payMember(member_id);
			int bookPrice = payList.get(0).getBook_price();
			double bookPoint = (int) bookPrice*0.05;
			String bookPointInt = format(bookPoint);
			
			mav.addObject("book_point", bookPointInt);
			mav.addObject("payList", payList);
			mav.addObject("memberDto", memberDto);
			mav.setViewName("book/bookPay.tiles");
		} else {
			mav.addObject("book_isbn", book_isbn);
			mav.setViewName("order/orderLogin.tiles");
		}
		
	}

	@Override
	public void bookList(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String book_name = request.getParameter("book_name");
		String pageNumber = request.getParameter("pageNumber");
		if (pageNumber == null)
			pageNumber = "1";

		int boardSize = 10;
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;

		int count = bookDao.bookCount(book_name);
		
		List<BookDto> bookList = null;
		if (count > 0)
			bookList = bookDao.bookList(book_name, startRow, endRow);
		
		mav.addObject("book_name", book_name);
		mav.addObject("text",book_name);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("count", count);
		mav.addObject("bookList", bookList);

		mav.setViewName("/book/search_list.tiles");
	}
	
	@Override
	public void bestSeller(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		
		List <BestSellerDto> bookDto = bookDao.bestSeller();
		
		List<BookDto> bookFirstList = bookDao.bookFirstList();
		
		int count = bookFirstList.size();
		
		List<BookDto> bookLastList = bookDao.bookLastList();
		
		int count2 = bookLastList.size();
		
		IlgumAspect.logger.info(IlgumAspect.logMsg + bookDto.size());
		
		String str = "[";
		str += "['달','내 몸에 이로운 식사를 하고 있습니까?','유럽 문화 기행1','설민석의 한국사 대모험 11'],";
		int num = 0;
		for(int i=0; i<bookDto.size(); i++) {
			
			str += "['";
			str += bookDto.get(i).getMonth();
			str += "',";
			str += bookDto.get(i).getBook1();
			str += ",";
			str += bookDto.get(i).getBook2();
			str += ",";
			str += bookDto.get(i).getBook3();
			str += "]";
			
			num++;
			if(num<bookDto.size()) {
				str += ",";
			}
		}
		str += "]";
		mav.addObject("str",str);
		
		mav.addObject("count", count);
		mav.addObject("bookFirstList",bookFirstList);
		mav.addObject("count2", count2);
		mav.addObject("bookLastList",bookLastList);
		mav.addObject("bookDto",bookDto);
		mav.setViewName("book/bestseller.tiles");
	}

	@Override
	public void monthBook(ModelAndView mav) {
		
		Map<String, Object>map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		List<BookDto> bookDto = bookDao.monthBook();
		
		IlgumAspect.logger.info(IlgumAspect.logMsg + bookDto.size());
		
		
		mav.addObject("monthBook", bookDto);
		mav.addObject("count", bookDto.size());
		mav.setViewName("book/monthBook.tiles");
	}

	@Override
	public void newBook(ModelAndView mav) {
		
		Map<String, Object>map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		List<BookDto> bookDto = bookDao.newBook();
		IlgumAspect.logger.info(IlgumAspect.logMsg + bookDto.size());
		
		
		mav.addObject("newBook", bookDto);
		mav.addObject("count", bookDto.size());
		mav.setViewName("book/newBook.tiles");
		
	}
	
	public String format(double number) {
		DecimalFormat df = new DecimalFormat();
		
		return df.format(number);
	}

	@Override
	public void category1(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String book_category = request.getParameter("book_category");
		String pageNumber = request.getParameter("pageNumber");
		
		IlgumAspect.logger.info(IlgumAspect.logMsg + book_category);
		
		if (pageNumber == null)
			pageNumber = "1";

		int boardSize = 10;
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;

		int count = bookDao.bookCountCategory(book_category);
		
		IlgumAspect.logger.info(IlgumAspect.logMsg + count);
		
		List<BookDto> bookList = null;
		
		if (count > 0)
			bookList = bookDao.bookcategory(book_category, startRow, endRow);
		
		IlgumAspect.logger.info(IlgumAspect.logMsg + bookList);
		
		mav.addObject("book_name", book_category);
		mav.addObject("text",book_category);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("count", count);
		mav.addObject("bookList", bookList);

		mav.setViewName("/book/category_list.tiles");
		
	}

	@Override
	public void memberWrite(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		UserBookStar userBookStar = (UserBookStar) map.get("userBookStar");
		
		String pageNumber = request.getParameter("pageNumber");
		
		IlgumAspect.logger.info(IlgumAspect.logMsg + "pageNumber: " +pageNumber);
		
		String book_num = request.getParameter("book_isbn");
		if(pageNumber == null) pageNumber = "1";
		
		IlgumAspect.logger.info(IlgumAspect.logMsg + "pageNumber: " +pageNumber);
		
		int currentPage = Integer.parseInt(pageNumber);
		
		IlgumAspect.logger.info(IlgumAspect.logMsg + currentPage);
		IlgumAspect.logger.info(IlgumAspect.logMsg + book_num);
		
		int boardSize = 3;
		int startRow = (currentPage-1)*boardSize+1;
		int endRow = currentPage*boardSize;
		
		IlgumAspect.logger.info(IlgumAspect.logMsg + "startRow:"+ startRow + "endRow" +endRow);
		
		int count = bookDao.reviewCount(book_num);
		IlgumAspect.logger.info(IlgumAspect.logMsg + count);
		
		List<UserBookStar> reviewList = null;
		
		if(count > 0) {
			HashMap<String, Object> hMap = new HashMap<String, Object>();
			hMap.put("startRow", startRow);
			hMap.put("endRow", endRow);
			hMap.put("book_num", book_num);
			
			reviewList = bookDao.reviewList(hMap);
			IlgumAspect.logger.info(IlgumAspect.logMsg + reviewList);
		}
		
		mav.addObject("reviewList",reviewList);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		
	}

	@Override
	public void memberWriteOk(ModelAndView mav) {
		
		Map<String, Object>map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		if(request.getParameter("userbookstar_star")==null) {
			int check = 0;
			mav.addObject("check",check);
			mav.addObject("book_isbn",request.getParameter("book_num"));
			mav.setViewName("book/writeOk.empty");
		}
		
		UserBookStar userBookStar = new UserBookStar();
		userBookStar.setMember_id(request.getParameter("member_id"));
		userBookStar.setBook_num(request.getParameter("book_num"));
		userBookStar.setBook_review(request.getParameter("book_review"));
		int star = Integer.parseInt(request.getParameter("userbookstar_star"));
		userBookStar.setUserbookstar_star(star);
		
		IlgumAspect.logger.info(IlgumAspect.logMsg + star);
		IlgumAspect.logger.info(IlgumAspect.logMsg + userBookStar.toString());
		
		if(userBookStar.getBook_review().equals("")){
			int check = 0;
			mav.addObject("check",check);
			mav.addObject("book_isbn",request.getParameter("book_num"));
			mav.setViewName("book/writeOk.empty");
		}else {
		
		int check = bookDao.memberWriteOk(userBookStar);
		
		
		IlgumAspect.logger.info(IlgumAspect.logMsg + check);
		
		mav.addObject("check",check);
		mav.addObject("book_isbn",request.getParameter("book_num"));
		
		mav.setViewName("book/writeOk.empty");
		}
	}

	@Override
	public void memberDelete(ModelAndView mav) {
		
		Map<String, Object>map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = (HttpSession) map.get("session");
		
		IlgumAspect.logger.info(IlgumAspect.logMsg + request.getParameter("book_isbn"));
		
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		
		if(session.getAttribute("member_id")==null) {
			int check = 0;
			mav.addObject("check",check);
			mav.addObject("book_isbn",request.getParameter("book_isbn"));
			mav.addObject("pageNumber",pageNumber);
			
			mav.setViewName("book/delete.empty");
			
		}else if(!request.getParameter("member_id").equals(session.getAttribute("member_id"))) {
			int check = 0;
			mav.addObject("check",check);
			mav.addObject("book_isbn",request.getParameter("book_isbn"));
			mav.addObject("pageNumber",pageNumber);
			
			mav.setViewName("book/delete.empty");
		}else {
		
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("order_bunho", request.getParameter("order_bunho"));
		hMap.put("book_num", request.getParameter("book_isbn"));
		
		String id = bookDao.deleteCheck(hMap);
		
		if(id.equals(request.getParameter("member_id"))) {
			hMap.put("member_id", id);
			
			int check = bookDao.deleteReview(hMap);
			
			IlgumAspect.logger.info(IlgumAspect.logMsg + check);
			
			mav.addObject("check",check);
			mav.addObject("book_isbn",request.getParameter("book_isbn"));
			mav.addObject("pageNumber",pageNumber);
			
			mav.setViewName("book/delete.empty");
		}
		}
	}
	
	@Override
	public void memberUpdate(ModelAndView mav) {
		
		Map<String, Object>map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		if(request.getParameter("userbookstar_star")==null) {
			int check = 0;
			mav.addObject("check",check);
			mav.addObject("book_isbn",request.getParameter("book_num"));
			mav.setViewName("book/updateOk.empty");
		}
		
		UserBookStar userBookStar = new UserBookStar();
		userBookStar.setOrder_bunho(Integer.parseInt(request.getParameter("order_bunho")));
		userBookStar.setMember_id(request.getParameter("member_id"));
		userBookStar.setBook_num(request.getParameter("book_num"));
		userBookStar.setBook_review(request.getParameter("book_review"));
		int star = Integer.parseInt(request.getParameter("userbookstar_star"));
		userBookStar.setUserbookstar_star(star);
		
		IlgumAspect.logger.info(IlgumAspect.logMsg + star);
		IlgumAspect.logger.info(IlgumAspect.logMsg + userBookStar.toString());
		
		if(userBookStar.getBook_review().equals("")){
			int check = 0;
			mav.addObject("check",check);
			mav.addObject("book_isbn",request.getParameter("book_num"));
			mav.setViewName("book/updateOk.empty");
		}else {
		
		int check = bookDao.memberUpdateOk(userBookStar);
		
		
		IlgumAspect.logger.info(IlgumAspect.logMsg + check);
		
		mav.addObject("check",check);
		mav.addObject("book_isbn",request.getParameter("book_num"));
		
		mav.setViewName("book/updateOk.empty");
		}
	}
	
	@Override
	public List<String> autocomplete(String book_name) {
		IlgumAspect.logger.info(IlgumAspect.logMsg + book_name);
		IlgumAspect.logger.info(IlgumAspect.logMsg + bookDao.nameList(book_name));
		return bookDao.nameList(book_name);
	}
}
