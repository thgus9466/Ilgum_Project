package com.java.mypage.dao;

import java.util.HashMap;
import java.util.List;

import com.java.book.dto.BookDto;
import com.java.member.dto.MemberDto;
import com.java.order.dto.OrderDto;
import com.java.mypage.dto.BuserDto;
import com.java.mypage.dto.CartDto;
import com.java.mypage.dto.QuestionDto;


public interface MypageDao {

	public MemberDto readMypage(String id);
	
	public int update(MemberDto memberDto);

	public List<OrderDto> DeliverList(String member_id,int startRow, int endRow);
	
	public List<OrderDto> DeliverList_week(String member_id, int startRow, int endRow);
	
	public int boardGroupNumberMax();

	public int boardWrite(QuestionDto questionDto);

	public int qCount(String member_id);

	public List<QuestionDto> qList(String member_id, int startRow, int endRow);

	public QuestionDto qRead(int q_number);

	public String getName(String member_id);

	public int qDelete(int q_number);
	
	public int delivercount(String member_id);

	public int updateLevel(String member_id);
	
	public int alreadyCount(String member_id, String book_isbn);
	
	public int cartInsert(CartDto cartDto);
	
	public int cartUpdate(CartDto cartDto);
	
	public int cartCount(String member_id);
	
	public List<CartDto> cartList(String member_id);
	
	public int cartDel(String book_isbn);
	
	public BuserDto bcartList(String book_isbn);

	public int updateInterest(HashMap<String, String> hmap);
	
	public int firstcount(String firstInterest);
	public int secondcount(String secondInterest);
	public int thirdcount(String thirdInterest);
	
	public List<BookDto> firstRecommand(String firstInterest);
	public List<BookDto> secondRecommand(String secondInterest);
	public List<BookDto> thirdRecommand(String thirdInterest);
	
}
