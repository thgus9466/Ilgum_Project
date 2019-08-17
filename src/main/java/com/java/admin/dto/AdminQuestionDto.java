package com.java.admin.dto;

import java.util.Date;

/**
 * @author 최선권
 * @Date 2019.08.12
 * @Decription 관리자 상담글관리 DTO
 */

public class AdminQuestionDto {

	private int q_number;     		//상담글 번호(SQL시퀀스로 자동증가)
	private String member_id;		//회원아이디
	private String q_title;			//상담금 제목
	private String q_content; 		//상담글 내용
	private String q_theme; 		//상담글 분류
	private String q_state; 		//상담글 처리상태
	private Date q_date;			//상담글 날짜

	private String a_member_id;		//관리자 아이디등록
	private String a_title;			//관리자 답글제목
	private String a_content;		//관리자 답글내용
	private Date a_date;			//관리자 답글시간
	
	private int board_number;    	//
	private int group_number; 		//
	private int sequence_number;	//
	private int sequence_level;		//
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
	public String getA_member_id() {
		return a_member_id;
	}
	public void setA_member_id(String a_member_id) {
		this.a_member_id = a_member_id;
	}
	public String getA_title() {
		return a_title;
	}
	public void setA_title(String a_title) {
		this.a_title = a_title;
	}
	public String getA_content() {
		return a_content;
	}
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	public Date getA_date() {
		return a_date;
	}
	public void setA_date(Date a_date) {
		this.a_date = a_date;
	}
	public int getBoard_number() {
		return board_number;
	}
	public void setBoard_number(int board_number) {
		this.board_number = board_number;
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
		return "AdminQuestionDto [q_number=" + q_number + ", member_id=" + member_id + ", q_title=" + q_title
				+ ", q_content=" + q_content + ", q_theme=" + q_theme + ", q_state=" + q_state + ", q_date=" + q_date
				+ ", a_member_id=" + a_member_id + ", a_title=" + a_title + ", a_content=" + a_content + ", a_date="
				+ a_date + ", board_number=" + board_number + ", group_number=" + group_number + ", sequence_number="
				+ sequence_number + ", sequence_level=" + sequence_level + "]";
	}


	
	
}
