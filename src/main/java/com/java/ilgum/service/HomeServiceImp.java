package com.java.ilgum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.aop.IlgumAspect;
import com.java.book.dto.BookDto;
import com.java.ilgum.dao.HomeDao;

@Component
public class HomeServiceImp implements HomeService {
	@Autowired
	private HomeDao homeDao;

	@Override
	public List<BookDto> monthBook() {
		int count = homeDao.bookCount();
		IlgumAspect.logger.info(IlgumAspect.logMsg + count);
		
		List<BookDto> list = null;
		if (count > 0) {
			list = homeDao.bookList();
		}
		
		return list;
	}

	@Override
	public List<BookDto> novelList() {
		int count = homeDao.novelCount();
		IlgumAspect.logger.info(IlgumAspect.logMsg + count);
		
		List<BookDto> list = null;
		if (count > 0) {
			list = homeDao.novelList();
		}
		
		return list;
	}

	@Override
	public List<BookDto> economyBook() {
		int count = homeDao.economyCount();
		IlgumAspect.logger.info(IlgumAspect.logMsg + count);
		
		List<BookDto> list = null;
		if (count > 0) {
			list = homeDao.economyList();
		}
		
		return list;
	}

	@Override
	public List<BookDto> itBook() {
		int count = homeDao.itCount();
		IlgumAspect.logger.info(IlgumAspect.logMsg + count);
		
		List<BookDto> list = null;
		if (count > 0) {
			list = homeDao.itList();
			IlgumAspect.logger.info(IlgumAspect.logMsg + list.toString());
		}
		
		return list;
	}

	

}
