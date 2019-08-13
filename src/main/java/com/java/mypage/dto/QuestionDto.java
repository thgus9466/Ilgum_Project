package com.java.mypage.dto;

import java.util.Date;

public class QuestionDto {//상담내역
	private int q_number;		// 상담글 번호
	private String member_id;	// 아이디
	private String q_title;		// 제목
	private String q_content;	// 내용
	private String q_theme;		// 상담분야
	private String q_state;		// 처리상태
	private Date q_date;		// 작성일
	
	private int group_number;
	private int sequence_number;
	private int sequence_level;

	public QuestionDto() {}

	public QuestionDto(int q_number, String member_id, String q_title, String q_content, String q_theme, String q_state,
			Date q_date, int group_number, int sequence_number, int sequence_level) {
		super();
		this.q_number = q_number;
		this.member_id = member_id;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_theme = q_theme;
		this.q_state = q_state;
		this.q_date = q_date;
		this.group_number = group_number;
		this.sequence_number = sequence_number;
		this.sequence_level = sequence_level;
	}

	public int getQ_number() {
		return q_number;
	}

	public void setQ_number(int q_number) {
		this.q_number = q_number;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public String getQ_theme() {
		return q_theme;
	}

	public void setQ_theme(String q_theme) {
		this.q_theme = q_theme;
	}

	public String getQ_state() {
		return q_state;
	}

	public void setQ_state(String q_state) {
		this.q_state = q_state;
	}

	public Date getQ_date() {
		return q_date;
	}

	public void setQ_date(Date q_date) {
		this.q_date = q_date;
	}

	public int getGroup_number() {
		return group_number;
	}

	public void setGroup_number(int group_number) {
		this.group_number = group_number;
	}

	public int getSequence_number() {
		return sequence_number;
	}

	public void setSequence_number(int sequence_number) {
		this.sequence_number = sequence_number;
	}

	public int getSequence_level() {
		return sequence_level;
	}

	public void setSequence_level(int sequence_level) {
		this.sequence_level = sequence_level;
	}

	@Override
	public String toString() {
		return "QuestionDto [q_number=" + q_number + ", member_id=" + member_id + ", q_title=" + q_title
				+ ", q_content=" + q_content + ", q_theme=" + q_theme + ", q_state=" + q_state + ", q_date=" + q_date
				+ ", group_number=" + group_number + ", sequence_number=" + sequence_number + ", sequence_level="
				+ sequence_level + "]";
	}
	
}