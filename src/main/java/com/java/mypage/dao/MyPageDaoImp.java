package com.java.mypage.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.member.dto.MemberDto;
import com.java.mypage.dto.QuestionDto;

@Component
public class MypageDaoImp implements MypageDao {
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
}
