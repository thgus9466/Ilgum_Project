package com.java.ilgum.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.book.dto.BookDto;
import com.java.ilgum.service.HomeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	private HomeService homeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String indexPage(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		List<BookDto> bookList = homeService.monthBook();
		
		ArrayList<BookDto> novelList = (ArrayList<BookDto>) homeService.novelList();
		ArrayList<BookDto> novelList_first = new ArrayList<BookDto>();
		for(int i=0 ;i<novelList.size()-5;i++) {
			novelList_first.add(novelList.get(i));
		}
		ArrayList<BookDto> novelList_second = new ArrayList<BookDto>();
		for(int i=5 ;i<novelList.size();i++) {
			novelList_second.add(novelList.get(i));
		}
		
		
		ArrayList<BookDto> economyList = (ArrayList<BookDto>) homeService.economyBook();
		ArrayList<BookDto> economyList_first = new ArrayList<BookDto>();
		for(int i=0 ;i<economyList.size()-5;i++) {
			economyList_first.add(economyList.get(i));
		}		
		ArrayList<BookDto> economyList_second = new ArrayList<BookDto>();
		for(int i=5 ;i<economyList.size();i++) {
			economyList_second.add(economyList.get(i));
		}
		
		
		ArrayList<BookDto> ItList = (ArrayList<BookDto>) homeService.itBook();
		ArrayList<BookDto> ItList_first = new ArrayList<BookDto>();
		for(int i=0 ;i<ItList.size()-5;i++) {
			ItList_first.add(ItList.get(i));
		}		
		ArrayList<BookDto> ItList_second = new ArrayList<BookDto>();
		for(int i=5 ;i<ItList.size();i++) {
			ItList_second.add(ItList.get(i));
		}
		
		model.addAttribute("bookList", bookList);
		
		model.addAttribute("novelList_first", novelList_first);
		model.addAttribute("novelList_second", novelList_second);
		
		model.addAttribute("economyList_first", economyList_first);
		model.addAttribute("economyList_second", economyList_second);
		
		model.addAttribute("ItList_first", ItList_first);
		model.addAttribute("ItList_second", ItList_second);
		
		return "/index.empty";
	}
	
}
