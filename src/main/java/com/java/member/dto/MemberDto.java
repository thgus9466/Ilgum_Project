package com.java.member.dto;

public class MemberDto {
	String member_id;			// 아이디
	String member_password;		// 비밀번호
	String member_name;			// 이름
	String member_zipcode;		// 성별
	String member_address1;		// 우편번호
	String member_address2;		// 주소
	String member_gender;		// 상세주소
	String member_phone1;		// 휴대전화
	String member_phone2;		// 자택번호
	String member_interest;		// 관심분야
	String member_job;			// 직업
	String member_birth;		// 생년월일
	String member_email;		// 이메일
	int member_point;			// 포인트
	String member_level;		// 회원등급
	
	public MemberDto() {}

	public MemberDto(String member_id, String member_password, String member_name, String member_zipcode,
			String member_address1, String member_address2, String member_gender, String member_phone1,
			String member_phone2, String member_interest, String member_job, String member_birth, String member_email,
			int member_point, String member_level) {

		this.member_id = member_id;
		this.member_password = member_password;
		this.member_name = member_name;
		this.member_zipcode = member_zipcode;
		this.member_address1 = member_address1;
		this.member_address2 = member_address2;
		this.member_gender = member_gender;
		this.member_phone1 = member_phone1;
		this.member_phone2 = member_phone2;
		this.member_interest = member_interest;
		this.member_job = member_job;
		this.member_birth = member_birth;
		this.member_email = member_email;
		this.member_point = member_point;
		this.member_level = member_level;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_password() {
		return member_password;
	}

	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_zipcode() {
		return member_zipcode;
	}

	public void setMember_zipcode(String member_zipcode) {
		this.member_zipcode = member_zipcode;
	}

	public String getMember_address1() {
		return member_address1;
	}

	public void setMember_address1(String member_address1) {
		this.member_address1 = member_address1;
	}

	public String getMember_address2() {
		return member_address2;
	}

	public void setMember_address2(String member_address2) {
		this.member_address2 = member_address2;
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public String getMember_phone1() {
		return member_phone1;
	}

	public void setMember_phone1(String member_phone1) {
		this.member_phone1 = member_phone1;
	}

	public String getMember_phone2() {
		return member_phone2;
	}

	public void setMember_phone2(String member_phone2) {
		this.member_phone2 = member_phone2;
	}

	public String getMember_interest() {
		return member_interest;
	}

	public void setMember_interest(String member_interest) {
		this.member_interest = member_interest;
	}

	public String getMember_job() {
		return member_job;
	}

	public void setMember_job(String member_job) {
		this.member_job = member_job;
	}

	public String getMember_birth() {
		return member_birth;
	}

	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public int getMember_point() {
		return member_point;
	}

	public void setMember_point(int member_point) {
		this.member_point = member_point;
	}

	public String getMember_level() {
		return member_level;
	}

	public void setMember_level(String member_level) {
		this.member_level = member_level;
	}

	@Override
	public String toString() {
		return "MemberDto [member_id=" + member_id + ", member_password=" + member_password + ", member_name="
				+ member_name + ", member_zipcode=" + member_zipcode + ", member_address1=" + member_address1
				+ ", member_address2=" + member_address2 + ", member_gender=" + member_gender + ", member_phone1="
				+ member_phone1 + ", member_phone2=" + member_phone2 + ", member_interest=" + member_interest
				+ ", member_job=" + member_job + ", member_birth=" + member_birth + ", member_email=" + member_email
				+ ", member_point=" + member_point + ", member_level=" + member_level + "]";
	}
	
}