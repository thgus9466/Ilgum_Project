package com.java.member.service;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.IlgumAspect;
import com.java.member.dao.MemberDao;
import com.java.member.dto.MemberDto;
import com.java.mypage.dao.MypageDao;

@Component
public class MemberServiceImp implements MemberService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MypageDao mypageDao;

	@Override
	public void idCheck(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String id = request.getParameter("userid");
		String checkId = memberDao.idCheck(id);
		
		int check = 0;
		if(checkId != null) check = 1;

		IlgumAspect.logger.info(IlgumAspect.logMsg + check);
		
		mav.addObject("check", check);
	}

	@Override
	public void memberJoinOk(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		MemberDto memberDto = (MemberDto) map.get("memberDto");

		memberDto.setMember_email(request.getParameter("member_email1")+"@"+request.getParameter("member_email2"));
		memberDto.setMember_phone1(request.getParameter("phone1_1")+request.getParameter("phone1_2")+request.getParameter("phone1_3"));
		memberDto.setMember_phone2(request.getParameter("phone2_1")+request.getParameter("phone2_2")+request.getParameter("phone2_3"));

		memberDto.setMember_point(0);
		memberDto.setMember_level("AA");
		
		int check = memberDao.memberInsert(memberDto);
		IlgumAspect.logger.info(IlgumAspect.logMsg + check);
		
		mav.addObject("check", check);
		mav.setViewName("member/joinOk.tiles");
	}
	
	@Override
	public void memberLoginOk(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = (HttpSession) map.get("session");
		
		IlgumAspect.logger.info(IlgumAspect.logMsg + session.getAttribute("member_id"));
		
		if(session.getAttribute("member_id") != null) {
			session.removeAttribute("member_id");
		}		
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("member_id", request.getParameter("member_id"));
		hMap.put("member_password", request.getParameter("member_password"));
		
		String member_id = memberDao.memberLoginOk(hMap);
		String member_level = memberDao.memberLevel(member_id);
		
		IlgumAspect.logger.info(IlgumAspect.logMsg + member_id + member_level);
		
		if(member_id != null && !member_level.equals("withdrawal")) {
			session.setAttribute("member_id", member_id);
			session.setAttribute("member_level", member_level);
			
			IlgumAspect.logger.info(IlgumAspect.logMsg + session.getAttribute("member_id") + "member_level : "+ session.getAttribute("member_level"));
			mav.setViewName("redirect:/index.empty");
			
		}else if(member_id == null) {
			session.removeAttribute("member_id");
			IlgumAspect.logger.info(IlgumAspect.logMsg + "비회원일때"+member_id +member_level);
			mav.setViewName("member/notlogin.tiles");
		}else if(member_level.equals("withdrawal")) {
			session.removeAttribute("member_id");
			IlgumAspect.logger.info(IlgumAspect.logMsg + "탈퇴한 회원일때"+member_id +member_level);
			mav.setViewName("member/withdrawal.tiles");
		}
		
	}
	
	@Override
	public void memberLogout(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		request.getSession().getAttribute("member_id");
		
		IlgumAspect.logger.info(IlgumAspect.logMsg + request.getSession().getAttribute("member_id"));
		
		request.getSession().removeAttribute("member_id");
		request.getSession().removeAttribute("member_level");
		request.getSession().removeAttribute("memberDto");
		
		IlgumAspect.logger.info(IlgumAspect.logMsg + request.getSession().getAttribute("member_id"));
		IlgumAspect.logger.info(IlgumAspect.logMsg + request.getSession().getAttribute("member_level"));
		IlgumAspect.logger.info(IlgumAspect.logMsg + request.getSession().getAttribute("memberDto"));
		
		mav.setViewName("redirect:/index.empty");
	}
	
	@Override
	public void memberIdSearchOk(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		IlgumAspect.logger.info(IlgumAspect.logMsg +request.getParameter("member_name")+ request.getParameter("member_email"));
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("member_name", request.getParameter("member_name"));
		hMap.put("member_email", request.getParameter("member_email"));
		
		String member_id = memberDao.memberIdSearchOk(hMap);
		
		IlgumAspect.logger.info(IlgumAspect.logMsg + member_id);
		
		if(member_id == null) {
			mav.addObject("talk",0);
			mav.setViewName("member/IdUpdateOk.tiles");
		}else {
		mav.addObject("talk",1);
		mav.addObject("member_id", member_id);
		mav.addObject("member_name", request.getParameter("member_name"));
		
		mav.setViewName("member/IdUpdateOk.tiles");
		}
	}

	@Override
	public void memberPasswordSearchOk(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		IlgumAspect.logger.info(IlgumAspect.logMsg +request.getParameter("member_name"));
		IlgumAspect.logger.info(IlgumAspect.logMsg +request.getParameter("member_id"));
		IlgumAspect.logger.info(IlgumAspect.logMsg +request.getParameter("member_email"));
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("member_name", request.getParameter("member_name"));
		hMap.put("member_id", request.getParameter("member_id"));
		hMap.put("member_email", request.getParameter("member_email"));
		
		String member_password = memberDao.memberPasswordSearchOk(hMap);
		
		if(member_password == null) {
			mav.addObject("talk","아이디가 존재하지 않습니다.");
			mav.setViewName("member/passwordSearch.tiles");
		}else {
			        String password = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다. 
			        password = password.substring(0, 10); //uuid를 앞에서부터 10자리 잘라줌. 
			        System.out.println(password); 
			        
			        hMap.put("member_password", password);
			        
			        
			        int check = memberDao.memberPasswordNew(hMap);
			        
			        if(check>0) {
			        	String setfrom = "akswb8719@naver.com";
			    		String tomail = request.getParameter("member_email"); // 받는 사람 이메일
			    		String title = "임시 비밀번호를 알려드립니다"; // 제목
			    		String content = request.getParameter("member_name")+"님의 임시 비밀번호는 "+ password +"입니다."; // 내용

			    		try {
			    			MimeMessage message = mailSender.createMimeMessage();
			    			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
			    					true, "UTF-8");

			    			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			    			messageHelper.setTo(tomail); // 받는사람 이메일
			    			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			    			messageHelper.setText(content); // 메일 내용

			    			mailSender.send(message);
			    		} catch (Exception e) {
			    			System.out.println(e);
			    		}
			    		mav.addObject("talk","ok");
			    		mav.setViewName("member/emailUpdateOk.tiles");
			    	}
			        
			      
		}
		
		
	}
		
}
