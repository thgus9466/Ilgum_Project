package com.java.admin.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.admin.dao.AdminCouponDao;
import com.java.admin.dto.AdminCouponDto;
import com.java.admin.dto.AdminMemberDto;
import com.java.admin.dto.AdminQuestionDto;
import com.java.aop.IlgumAspect;

/**
 * @author 최선권
 * @date 2019.08.14
 * @description 쿠폰관리 서비스
 */ 

@Component
public class AdminCouponServiceImp implements AdminCouponService {
	@Autowired
	private AdminCouponDao couponDao;
	
	@Override//오픈축하기념 
	public void couponAuto(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		AdminCouponDto couponDto = new AdminCouponDto();
		
		String couponNumber = RandomCouponNumber(10);
		String admin_couponName = "오픈축하기념할인쿠폰";
		String admin_couponUseday = date();
		String admin_content = "홈페이지 오픈축하 도서할인쿠폰입니다. 회원님의 가입을 진심으로 환영합니다.";

		double admin_sale = 0.2;

		couponDto.setAdmin_couponNumber(couponNumber);
		couponDto.setAdmin_couponName(admin_couponName);
		couponDto.setAdmin_couponUseday(admin_couponUseday);
		couponDto.setAdmin_content(admin_content);
		couponDto.setAdmin_sale(admin_sale);
		
		//관리자쿠폰 생성
		int check = couponDao.couponAutoCreate(couponDto);
	
		IlgumAspect.logger.info(IlgumAspect.logMsg + check);		
		IlgumAspect.logger.info(IlgumAspect.logMsg + couponDto.toString());			

		
		//관리자 쿠폰을 회원에게 등록
		String admin_couponNumber = couponDto.getAdmin_couponNumber();
		String member_id = request.getParameter("member_id");
		String member_couponNumber = RandomCouponNumber(12);
		
		int check2 = couponDao.couponAndMemberInsert(admin_couponNumber, member_id, member_couponNumber);
		IlgumAspect.logger.info(IlgumAspect.logMsg + check2);
		IlgumAspect.logger.info(IlgumAspect.logMsg + couponDto.toString());
	}
	
	//쿠폰번호 생성기
	public String RandomCouponNumber(int length){

        char[] charaters = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9'};
        StringBuffer sb = new StringBuffer();
        Random rn = new Random();
        for( int i = 0 ; i < length ; i++ ){
            sb.append( charaters[ rn.nextInt( charaters.length ) ] );
        }
        return sb.toString();

    }
	
	public String date() {
	    Calendar cal = Calendar.getInstance();
	    cal.setTime(new Date());
	    cal.add(Calendar.MONTH, 1);

	    // 특정 형태의 날짜로 값을 뽑기 
	    DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
	    String strDate = df.format(cal.getTime());
	    return strDate.toString(); 
	}
}