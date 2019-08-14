package com.java.mypage.dao;



import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.member.dto.MemberDto;
import com.java.order.dto.OrderDto;
import com.java.order.dto.UserOrderDto;
import com.java.mypage.dto.CartDto;
import com.java.mypage.dto.QuestionDto;

@Component
public class MyPageDaoImp implements MypageDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public MemberDto readMypage(String id) {
		return sqlSessionTemplate.selectOne("dao.MypageMapper.readMypage", id);
	}

	@Override
	public int boardGroupNumberMax() {
		return sqlSessionTemplate.selectOne("dao.MypageMapper.boardGroupNumberMax");
	}

	@Override
	public int boardWrite(QuestionDto questionDto) {
		return sqlSessionTemplate.insert("dao.MypageMapper.boardInsert", questionDto);
	}

	@Override
	public int qCount(String member_id) {
		return sqlSessionTemplate.selectOne("dao.MypageMapper.qCount", member_id);
	}

	@Override
	public int update(MemberDto memberDto) {
		return sqlSessionTemplate.update("dao.MypageMapper.update",memberDto);
	}

	@Override
	public List<UserOrderDto> DeliverList(String member_id,int startRow, int endRow) {
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		hMap.put("member_id", member_id);
		
		return sqlSessionTemplate.selectList("dao.MypageMapper.deliverList",hMap);
	}
	
	public List<QuestionDto> qList(String member_id, int startRow, int endRow) {
		HashMap<String, Object> hMap = new HashMap<String, Object>();

		hMap.put("member_id", member_id);
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);

		return sqlSessionTemplate.selectList("dao.MypageMapper.qList", hMap);
	}

	@Override
	public QuestionDto qRead(int q_number) {
		return sqlSessionTemplate.selectOne("dao.MypageMapper.qRead", q_number);
	}

	@Override
	public String getName(String member_id) {
		return sqlSessionTemplate.selectOne("dao.MypageMapper.getName", member_id);
	}

	@Override
	public int qDelete(int q_number) {
		return sqlSessionTemplate.delete("dao.MypageMapper.qDelete", q_number);
	}
	
	@Override
	public int delivercount(String member_id) {
		return sqlSessionTemplate.selectOne("dao.MypageMapper.delivercount",member_id);
	}

	@Override
	public int updateLevel(String member_id) {
		return sqlSessionTemplate.update("dao.MypageMapper.updateLevel",member_id);
	}
	
	@Override
	public int alreadyCount(String member_id, String book_isbn) {
		HashMap<String, String> hMap = new HashMap<String, String>();

		hMap.put("member_id", member_id);
		hMap.put("book_isbn", book_isbn);

		return sqlSessionTemplate.selectOne("dao.MypageMapper.alreadyCount", hMap);
	}

	@Override
	public int cartInsert(CartDto cartDto) {
		return sqlSessionTemplate.insert("dao.MypageMapper.cartInsert", cartDto);
	}

	@Override
	public int cartUpdate(CartDto cartDto) {
		return sqlSessionTemplate.insert("dao.MypageMapper.cartUpdate", cartDto);
	}

	@Override
	public int cartCount(String member_id) {
		return sqlSessionTemplate.selectOne("dao.MypageMapper.cartCount", member_id);
	}

	@Override
	public List<CartDto> cartList(String member_id) {
		return sqlSessionTemplate.selectList("dao.MypageMapper.cartList", member_id);
	}

	@Override
	public int cartDel(String cart_num) {
		return sqlSessionTemplate.delete("dao.MypageMapper.cartDel", cart_num);
	}
}
