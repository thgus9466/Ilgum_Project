package com.java.admin.service;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author 최선권
 * @date 2019.08.14
 * @description 쿠폰관리 서비스 
 */ 

@Component
public interface AdminCouponService {

	public void couponAuto(ModelAndView mav);

	//쿠폰번호 랜덤생성기
	public String RandomCouponNumber(int length);

	public void couponUpdate(ModelAndView mav);
}
