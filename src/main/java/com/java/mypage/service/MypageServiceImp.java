package com.java.mypage.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.IlgumAspect;
import com.java.member.dto.MemberDto;

import com.java.mypage.dao.MypageDao;
import com.java.order.dto.OrderDto;
import com.java.order.dto.UserOrderDto;
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
		
		String id = (String) request.getSession().getAttribute("login");
		IlgumAspect.logger.info(IlgumAspect.logMsg + id);
		
		MemberDto memberDto = mypageDao.readMypage(id);
		IlgumAspect.logger.info(IlgumAspect.logMsg +memberDto.toString());
		
		mav.addObject("memberDto", memberDto);
		mav.setViewName("mypage/main.tiles");	
	}

	@Override
	public void readUpdate(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String id = (String) request.getSession().getAttribute("login");
		
		MemberDto memberDto = mypageDao.readMypage(id);
		
		Date date;
		try {
			
			date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(memberDto.getMember_birth());
			String birthday = new SimpleDateFormat("yyyy년 MM월 dd일").format(date);
			IlgumAspect.logger.info(IlgumAspect.logMsg + birthday);
			
			mav.addObject("birthday",birthday);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		
		
		String email = memberDto.getMember_email().substring(0, memberDto.getMember_email().indexOf("@"));
		String domain = memberDto.getMember_email().substring( memberDto.getMember_email().indexOf("@")+1);
		
		String phone1_1 = memberDto.getMember_phone1().substring(0, 3);
		String phone1_2 = memberDto.getMember_phone1().substring(3, 7);
		String phone1_3 = memberDto.getMember_phone1().substring(7, 11);
		
		String member_phone2 = memberDto.getMember_phone2();
		String phone2_1,phone2_2,phone2_3;
		
		IlgumAspect.logger.info(IlgumAspect.logMsg + member_phone2);
		
		if(member_phone2 != null) {	
			if(member_phone2.substring(0,2).equals("02")) {
				phone2_1 = "02";
				phone2_2 = member_phone2.substring(2,6);
				phone2_3 = member_phone2.substring(6,10);
			}else {
				phone2_1 = member_phone2.substring(0,3);
				phone2_2 = member_phone2.substring(3,6);
				phone2_3 = member_phone2.substring(6,10);
			}
			
			mav.addObject("phone2_1",phone2_1);
			mav.addObject("phone2_2",phone2_2);
			mav.addObject("phone2_3",phone2_3);
			
		}
		
		mav.addObject("memberDto", memberDto);

		mav.addObject("email",email);
		mav.addObject("domain",domain);
		
		mav.addObject("phone1_1",phone1_1);
		mav.addObject("phone1_2",phone1_2);
		mav.addObject("phone1_3",phone1_3);	
		
		mav.setViewName("mypage/update.tiles");		
	}

	@Override
	public void update(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String id = (String) request.getSession().getAttribute("login");
		MemberDto memberDto = (MemberDto)map.get("memberDto");
		
		memberDto.setMember_id(id);
		memberDto.setMember_email(request.getParameter("member_email1")+"@"+request.getParameter("member_email2"));
		memberDto.setMember_phone1(request.getParameter("phone1_1")+request.getParameter("phone1_2")+request.getParameter("phone1_3"));
		memberDto.setMember_phone2(request.getParameter("phone2_1")+request.getParameter("phone2_2")+request.getParameter("phone2_3"));		
				
		IlgumAspect.logger.info(IlgumAspect.logMsg +memberDto.toString());
		int check = mypageDao.update(memberDto);
		IlgumAspect.logger.info(IlgumAspect.logMsg + check);
		
		mav.addObject("check",check);
		mav.setViewName("mypage/updateOk.tiles");		
	}

	@Override
	public void DeliverList(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String pageNumber = request.getParameter("pageNumber");
		String member_id = (String) request.getSession().getAttribute("login");
		MemberDto memberDto = mypageDao.readMypage(member_id);
		
		if(pageNumber==null || pageNumber.trim().length() == 0 ) pageNumber = "1";
		
		int boardSize = 5;
		int currentPage = Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize + 1;
		int endRow = currentPage*boardSize;
		int count = mypageDao.delivercount(member_id);
		IlgumAspect.logger.info(IlgumAspect.logMsg + count);

		List<UserOrderDto> userOrderDtoList = null;
		
		if(count > 0)userOrderDtoList = mypageDao.DeliverList(member_id,startRow,endRow);			
//		IlgumAspect.logger.info(IlgumAspect.logMsg + userOrderDtoList.toString());
		
		mav.addObject("userOrderDtoList",userOrderDtoList);
		mav.addObject("memberDto",memberDto);
		
		mav.addObject("boardSize",boardSize);
		mav.addObject("count", count);
		mav.addObject("currentPage", currentPage);
		
		mav.setViewName("mypage/deliver.tiles");
	}
	
	//상담문의 글 서비스
	public void boardWrite(ModelAndView mav) {

		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
<<<<<<< HEAD
		String member_id = (String) request.getSession().getAttribute("login");
		String member_name = mypageDao.getName(member_id);

		
		mav.addObject("member_name", member_name);
		mav.addObject("pageNumber", pageNumber);
=======
		
		
		String member_id = (String) request.getSession().getAttribute("login");
		String member_name = mypageDao.getName(member_id);
		MemberDto memberDto = mypageDao.readMypage(member_id);
		
		mav.addObject("member_name", member_name);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("memberDto",memberDto);
		
>>>>>>> 06c43d09dc232a10447020f494d9813896976667
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

		String member_id = (String) request.getSession().getAttribute("login");
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
		mav.addObject("memberDto",memberDto);
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

		String member_id = (String) request.getSession().getAttribute("login");
		int q_number = Integer.parseInt(request.getParameter("q_number"));
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));

		String member_name = mypageDao.getName(member_id);
		QuestionDto questionDto = mypageDao.qRead(q_number);
		IlgumAspect.logger.info(IlgumAspect.logMsg + questionDto.toString());

		MemberDto memberDto = mypageDao.readMypage(member_id);
		mav.addObject("memberDto",memberDto);
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
		IlgumAspect.logger.info(IlgumAspect.logMsg + "check: "+ check);
		
		mav.addObject("check",check);
		mav.addObject("pageNumber",pageNumber);
		
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
		questionDto.setA_content(questionDto.getA_content().replace("<br/>","\r\n"));
		mav.addObject("questionDto", questionDto);
		mav.addObject("pageNumber", pageNumber);
		
		mav.setViewName("mypage/readReply.tiles");
		
	}
	
	@Override
	public void interest(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String member_id = (String) request.getSession().getAttribute("login");
		
		MemberDto memberDto = mypageDao.readMypage(member_id);
		IlgumAspect.logger.info(IlgumAspect.logMsg + "check: "+ memberDto.toString());
		
		mav.addObject("memberDto", memberDto);
		mav.setViewName("mypage/interest.tiles");	
	}

	@Override
	public void withdrawal(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String member_id = (String) request.getSession().getAttribute("login");
		
		int check = mypageDao.updateLevel(member_id);
		IlgumAspect.logger.info(IlgumAspect.logMsg + "check: "+ check);
		
		if(member_id != null) {
			request.getSession().removeAttribute("login");
		}
		
		mav.setViewName("redirect:/index.empty");
	}
	
	@Override
	public void cartList(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String member_id = (String) request.getSession().getAttribute("login");

		int count = mypageDao.cartCount(member_id);

		List<CartDto> cartList = null;
		if (count > 0)
			cartList = mypageDao.cartList(member_id);

		mav.addObject("count", count);
		mav.addObject("cartList", cartList);

		mav.setViewName("mypage/cart.tiles");
	}

	@Override
	public void cartInsert(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		CartDto cartDto = (CartDto) map.get("cartDto");

		String member_id = (String) request.getSession().getAttribute("login");
		String book_isbn = request.getParameter("book_isbn");
		int cart_quantity = Integer.parseInt(request.getParameter("cart_quantity"));
		System.out.println("id: " + member_id + "\t isbn: " + book_isbn + "\t quantity: " + cart_quantity);

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
	}

	@Override
	public void cartDel(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String delList[] = request.getParameter("delList").split(",");

		int check = 0;
		for (int i = 0; i < delList.length; i++)
			check = mypageDao.cartDel(delList[i]);

		mav.addObject("check", check);

		mav.setViewName("mypage/cartDelOk.empty");
	}
}
