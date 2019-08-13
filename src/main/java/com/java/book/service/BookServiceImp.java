package com.java.book.service;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.IlgumAspect;
import com.java.book.dao.BookDao;
import com.java.book.dto.BestSellerDto;
import com.java.book.dto.BookDto;
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
		
		mav.addObject("bookDto", bookDto);
		mav.setViewName("/book/bookDetail.tiles");
	}
	
	@Override
	public void bookPay(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = (HttpSession) map.get("session");
		MemberDto memberDto = (MemberDto) map.get("memberDto");
		
		String member_id = (String) session.getAttribute("login");
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
		str += "['달','반일 민족 주의','유럽 문화 기행1','설민석의 한국사 대모험 11'],";
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

}
