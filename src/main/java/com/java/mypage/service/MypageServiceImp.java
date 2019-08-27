package com.java.mypage.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.IlgumAspect;
import com.java.book.dto.BookDto;
import com.java.member.dto.MemberDto;

import com.java.mypage.dao.MypageDao;
import com.java.order.dto.OrderDto;
import com.java.mypage.dto.BuserDto;
import com.java.mypage.dto.CartDto;
import com.java.mypage.dto.QuestionDto;

@Component
public class MypageServiceImp implements MypageService {
	@Autowired
	private MypageDao mypageDao;

	@Override
	public void readMypage(ModelAndView mav) {

		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String member_id = (String)request.getSession().getAttribute("member_id");
		MemberDto memberDto = mypageDao.readMypage(member_id);
		
		String pageNumber = request.getParameter("pageNumber");
		
		
		if(pageNumber==null || pageNumber.trim().length() == 0 ) pageNumber = "1";
		
		int boardSize = 5;
		int currentPage = Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize + 1;
		int endRow = currentPage*boardSize;
		int count = mypageDao.delivercount(member_id);
		count = 5;
		
		IlgumAspect.logger.info(IlgumAspect.logMsg + "count : " + count);

		List<OrderDto> userOrderDtoList = null;
		
		if(count > 0)userOrderDtoList = mypageDao.DeliverList_week(member_id,startRow,endRow);
		
		String[] interest = null;
		IlgumAspect.logger.info(IlgumAspect.logMsg +memberDto.toString());
		if(memberDto.getMember_interest() != null)interest = memberDto.getMember_interest().split(",");
		
		mav.addObject("userOrderDtoList",userOrderDtoList);		
		mav.addObject("memberDto", memberDto);
		mav.addObject("interest",interest);
		
		mav.setViewName("mypage/main.tiles");	

	}

	@Override
	public void readUpdate(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String id = (String) request.getSession().getAttribute("member_id");

		MemberDto memberDto = mypageDao.readMypage(id);

		Date date;
		try {

			date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(memberDto.getMember_birth());
			String birthday = new SimpleDateFormat("yyyy년 MM월 dd일").format(date);
			IlgumAspect.logger.info(IlgumAspect.logMsg + birthday);

			mav.addObject("birthday", birthday);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String email = memberDto.getMember_email().substring(0, memberDto.getMember_email().indexOf("@"));
		String domain = memberDto.getMember_email().substring(memberDto.getMember_email().indexOf("@") + 1);

		String phone1_1 = memberDto.getMember_phone1().substring(0, 3);
		String phone1_2 = memberDto.getMember_phone1().substring(3, 7);
		String phone1_3 = memberDto.getMember_phone1().substring(7, 11);

		String member_phone2 = memberDto.getMember_phone2();
		String phone2_1, phone2_2, phone2_3;

		IlgumAspect.logger.info(IlgumAspect.logMsg + member_phone2);

		if (member_phone2 != null) {
			if (member_phone2.substring(0, 2).equals("02")) {
				phone2_1 = "02";
				phone2_2 = member_phone2.substring(2, 6);
				phone2_3 = member_phone2.substring(6, 10);
			} else {
				phone2_1 = member_phone2.substring(0, 3);
				phone2_2 = member_phone2.substring(3, 6);
				phone2_3 = member_phone2.substring(6, 10);
			}

			mav.addObject("phone2_1", phone2_1);
			mav.addObject("phone2_2", phone2_2);
			mav.addObject("phone2_3", phone2_3);

		}

		mav.addObject("memberDto", memberDto);

		mav.addObject("email", email);
		mav.addObject("domain", domain);

		mav.addObject("phone1_1", phone1_1);
		mav.addObject("phone1_2", phone1_2);
		mav.addObject("phone1_3", phone1_3);

		mav.setViewName("mypage/update.tiles");
	}

	@Override
	public void update(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String id = (String) request.getSession().getAttribute("member_id");
		MemberDto memberDto = (MemberDto) map.get("memberDto");

		memberDto.setMember_id(id);
		memberDto.setMember_email(request.getParameter("member_email1") + "@" + request.getParameter("member_email2"));
		memberDto.setMember_phone1(
				request.getParameter("phone1_1") + request.getParameter("phone1_2") + request.getParameter("phone1_3"));
		memberDto.setMember_phone2(
				request.getParameter("phone2_1") + request.getParameter("phone2_2") + request.getParameter("phone2_3"));

		IlgumAspect.logger.info(IlgumAspect.logMsg + memberDto.toString());
		int check = mypageDao.update(memberDto);
		IlgumAspect.logger.info(IlgumAspect.logMsg + check);

		mav.addObject("check", check);
		mav.setViewName("mypage/updateOk.tiles");
	}

	@Override
	public void DeliverList(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String pageNumber = request.getParameter("pageNumber");
		String member_id = (String) request.getSession().getAttribute("member_id");
		MemberDto memberDto = mypageDao.readMypage(member_id);

		if (pageNumber == null || pageNumber.trim().length() == 0)
			pageNumber = "1";

		int boardSize = 5;
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;
		int count = mypageDao.delivercount(member_id);
		count = 5;
		
		IlgumAspect.logger.info(IlgumAspect.logMsg + "count : " + count);

		List<OrderDto> userOrderDtoList = null;

		if (count > 0)
			userOrderDtoList = mypageDao.DeliverList(member_id, startRow, endRow);
//		IlgumAspect.logger.info(IlgumAspect.logMsg + userOrderDtoList.toString());

		mav.addObject("userOrderDtoList", userOrderDtoList);
		mav.addObject("memberDto", memberDto);

		mav.addObject("boardSize", boardSize);
		mav.addObject("count", count);
		mav.addObject("currentPage", currentPage);

		mav.setViewName("mypage/deliver.tiles");
	}

	// 상담문의 글 서비스
	public void boardWrite(ModelAndView mav) {

		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));

		String member_id = (String) request.getSession().getAttribute("member_id");
		String member_name = mypageDao.getName(member_id);
		MemberDto memberDto = mypageDao.readMypage(member_id);

		mav.addObject("member_name", member_name);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("memberDto", memberDto);

		mav.setViewName("mypage/write.tiles");
	}

	@Override
	public void boardWriteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();
		QuestionDto questionDto = (QuestionDto) map.get("questionDto");

		questionDto.setQ_date(new Date());
		questionDto.setQ_state("답변대기");

		int check = mypageDao.boardWrite(questionDto);
		IlgumAspect.logger.info(IlgumAspect.logMsg + check);

		mav.addObject("check", check);
		mav.setViewName("mypage/writeOk.empty");
	}

	@Override
	public void qList(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String member_id = (String) request.getSession().getAttribute("member_id");
		String pageNumber = request.getParameter("pageNumber");

		if (pageNumber == null)
			pageNumber = "1";

		int boardSize = 10;
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;

		int count = mypageDao.qCount(member_id);

		List<QuestionDto> qList = null;
		String member_name = null;
		if (count > 0) {
			qList = mypageDao.qList(member_id, startRow, endRow);
			member_name = mypageDao.getName(member_id);
		}

		MemberDto memberDto = mypageDao.readMypage(member_id);
		mav.addObject("memberDto", memberDto);
		mav.addObject("member_name", member_name);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("count", count);
		mav.addObject("qList", qList);

		mav.setViewName("/mypage/question.tiles");
	}

	@Override
	public void qRead(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String member_id = (String) request.getSession().getAttribute("member_id");
		int q_number = Integer.parseInt(request.getParameter("q_number"));
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));

		String member_name = mypageDao.getName(member_id);
		QuestionDto questionDto = mypageDao.qRead(q_number);
		IlgumAspect.logger.info(IlgumAspect.logMsg + questionDto.toString());

		MemberDto memberDto = mypageDao.readMypage(member_id);
		mav.addObject("memberDto", memberDto);
		mav.addObject("member_name", member_name);
		mav.addObject("questionDto", questionDto);
		mav.addObject("pageNumber", pageNumber);

		mav.setViewName("mypage/read.tiles");
	}

	@Override
	public void qDelete(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int q_number = Integer.parseInt(request.getParameter("q_number"));
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));

		int check = mypageDao.qDelete(q_number);
		IlgumAspect.logger.info(IlgumAspect.logMsg + "check: " + check);

		mav.addObject("check", check);
		mav.addObject("pageNumber", pageNumber);

		mav.setViewName("mypage/deleteOk.empty");
	}

	@Override
	public void qReadReply(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int q_number = Integer.parseInt(request.getParameter("q_number"));
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));

		QuestionDto questionDto = mypageDao.qRead(q_number);
		IlgumAspect.logger.info(IlgumAspect.logMsg + questionDto.toString());
		questionDto.setA_content(questionDto.getA_content().replace("<br/>", "\r\n"));
		mav.addObject("questionDto", questionDto);
		mav.addObject("pageNumber", pageNumber);

		mav.setViewName("mypage/readReply.tiles");

	}

	@Override
	public void interest(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String member_id = (String)request.getSession().getAttribute("member_id");
		MemberDto memberDto = mypageDao.readMypage(member_id);
			
		mav.addObject("memberDto", memberDto);
		
		mav.setViewName("mypage/interest.tiles");
	}
	
	@Override
	public void interestUpdate(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String id = (String) request.getSession().getAttribute("member_id");
		
		IlgumAspect.logger.info(IlgumAspect.logMsg + "interest: " + request.getParameter("interest")+ "job: " + request.getParameter("member_job"));
		HashMap<String,String> hmap = new HashMap<String, String>();
		
		hmap.put("member_id", id);
		hmap.put("member_interest", request.getParameter("interests"));
		hmap.put("member_job", request.getParameter("member_job"));
		
		int check = mypageDao.updateInterest(hmap);
		
		mav.addObject("check", check);
		mav.setViewName("mypage/updateInterestOk.tiles");
	}

	@Override
	public void withdrawal(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String member_id = (String) request.getSession().getAttribute("member_id");

		int check = mypageDao.updateLevel(member_id);
		IlgumAspect.logger.info(IlgumAspect.logMsg + "check: " + check);

		if (member_id != null) {
			request.getSession().removeAttribute("member_id");
		}

		mav.setViewName("redirect:/index.empty");
	}

	@Override
	public void cartList(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		MemberDto memberDto = (MemberDto)request.getSession().getAttribute("memberDto");
		

		String member_id = (String) request.getSession().getAttribute("member_id");

		if (member_id != null) {
			int count = mypageDao.cartCount(member_id);

			List<CartDto> cartList = null;
			if (count > 0)
				cartList = mypageDao.cartList(member_id);

			mav.addObject("count", count);
			mav.addObject("cartList", cartList);

			mav.setViewName("mypage/cart.tiles");

		} else {
			Cookie[] cookies = request.getCookies();
			List<BuserDto> bcartList = new ArrayList<BuserDto>();
			BuserDto buserDto = new BuserDto();

			if (cookies != null) {

				for (int i = 0; i < cookies.length; i++) {

					if (cookies[i].getName().startsWith("id")) {
						buserDto = mypageDao.bcartList(cookies[i].getValue());

						for (int j = 0; j < cookies.length; j++)

							if (cookies[j].getName().equals("quantity" + cookies[i].getValue())) {
								buserDto.setCart_quantity(Integer.parseInt(cookies[j].getValue()));
								break;
							}
						bcartList.add(buserDto);
					}
				}
			}
			
			mav.addObject("memberDto",memberDto);
			mav.addObject("count", cookies.length);
			mav.addObject("cartList", bcartList);

			mav.setViewName("buser/cart.tiles");
		}
	}

	@Override
	public void cartInsert(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		CartDto cartDto = (CartDto) map.get("cartDto");

		String member_id = (String) request.getSession().getAttribute("member_id");
		String book_isbn = request.getParameter("book_isbn");

		if (member_id != null) {
			int cart_quantity = Integer.parseInt(request.getParameter("cart_quantity"));
			System.out.println("member_id: " + member_id + "\t isbn: " + book_isbn + "\t quantity: " + cart_quantity);
			cartDto.setMember_id(member_id);
			cartDto.setBook_isbn(book_isbn);
			cartDto.setCart_quantity(cart_quantity);

			// 장바구니에 기존 상품이 있는지 검사
			int count = mypageDao.alreadyCount(member_id, book_isbn);
			int check;
			if (count == 0)
				check = mypageDao.cartInsert(cartDto);
			else
				check = mypageDao.cartUpdate(cartDto);

			mav.addObject("check", check);

			mav.setViewName("mypage/cartInsertOk.empty");

		} else {
			String cart_quantity = request.getParameter("cart_quantity");

			int i = 1;
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {

				for (i = 1; i < cookies.length; i++) {
					if (cookies[i].getName().equals("quantity" + book_isbn)) {
						int count = Integer.parseInt(cookies[i].getValue()) + Integer.parseInt(cart_quantity);
						Cookie c2 = new Cookie("quantity" + book_isbn, Integer.toString(count));
						c2.setMaxAge(60 * 60 * 12);
						c2.setPath("/");
						response.addCookie(c2);
						break;
					}
				}
			}
			if (i == cookies.length) {
				Cookie c1 = new Cookie("id" + book_isbn, book_isbn);
				c1.setMaxAge(60 * 60 * 12);
				c1.setPath("/");
				response.addCookie(c1);

				System.out.println("setCookie_Age: " + c1.getMaxAge());
				Cookie c2 = new Cookie("quantity" + book_isbn, cart_quantity);
				c2.setMaxAge(60 * 60 * 12);
				c2.setPath("/");
				response.addCookie(c2);
			}

			mav.addObject("check", 1);
			mav.setViewName("mypage/cartInsertOk.empty");
		}
	}

	@Override
	public void cartDel(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");

		int check = 0;
		String delList[] = request.getParameter("delList").split(",");

		if (request.getSession().getAttribute("member_id") != null) {
			for (int i = 0; i < delList.length; i++)
				check = mypageDao.cartDel(delList[i]);

		} else {
			for (int i = 0; i < delList.length; i++) {

				Cookie c1 = new Cookie("id" + delList[i], null);
				c1.setMaxAge(0);
				c1.setPath("/");
				response.addCookie(c1);

				Cookie c2 = new Cookie("quantity" + delList[i], null);
				c2.setMaxAge(0);
				c2.setPath("/");
				response.addCookie(c2);

			}
			check = 1;
		}

		mav.addObject("check", check);

		mav.setViewName("mypage/cartDelOk.empty");
	}

	
	//추천도서
	@Override
	public void recommand(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String member_id = (String) request.getSession().getAttribute("member_id");//세션에서 넘어온 회원 아이디를 저장한다.
		
		MemberDto memberDto = new MemberDto();
		memberDto = mypageDao.readMypage(member_id);//셀렉트문으로 회원정보를 가져온다.

		String interests = memberDto.getMember_interest();//select문으로 가져온 회원정보의 interest를 변수에 담는다.
		String firstInterest = interests.split(",")[0];
		String secondInterest = interests.split(",")[1];
		String thirdInterest = interests.split(",")[2];

		//,으로 값을 나누어 저장한다.
		
		int firstcount=0;		
		int secondcount=0;		
		int thirdcount=0;
		//데이터값 유효확인을 위한 카운트값 변수
		
		if(firstInterest !="") {//값이 있다면
			firstcount = mypageDao.firstcount(firstInterest);//갯수 구하기
			System.out.println(firstcount);
			if(firstcount>0) {
				List<BookDto> firstBookList= mypageDao.firstRecommand(firstInterest);//List로 인기순위 20개 가져오기	
				mav.addObject("firstBookList", firstBookList);
			}
		}

		if(secondInterest !="") {
			secondcount = mypageDao.secondcount(secondInterest);
			if(secondcount>0) {
				List<BookDto> secondBookList= mypageDao.secondRecommand(secondInterest);
				mav.addObject("secondBookList", secondBookList);
			}
			
		}
		if(secondInterest !="") {
			thirdcount = mypageDao.thirdcount(secondInterest);
			if(thirdcount>0) {
				List<BookDto> thirdBookList= mypageDao.thirdRecommand(thirdInterest);
				mav.addObject("thirdBookList", thirdBookList);
			}			
		}
		
		mav.addObject("firstcount", firstcount);
		mav.addObject("secondcount", secondcount);
		mav.addObject("thirdcount", thirdcount);
		mav.setViewName("mypage/recommand.empty");
		
	}
}
