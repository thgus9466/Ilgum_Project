package com.java.order.dao;

import java.util.List;

import com.java.book.dto.BookDto;
import com.java.member.dto.MemberDto;
import com.java.order.dto.BuserOrderDto;
import com.java.order.dto.NonUserOrderDto;

public interface OrderDao {
	public NonUserOrderDto nonMemberOrder(String book_isbn);
	public List<BookDto> oneBookOrder(String book_isbn);
	public int orderLogin(String member_id, String member_password);
	public List<BookDto> memberBook(String book_isbn);
	public MemberDto selectMember(String member_id);
}
