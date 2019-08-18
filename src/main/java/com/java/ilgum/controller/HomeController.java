package com.java.ilgum.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

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
		List<BookDto> novelList = homeService.novelBook();
		List<BookDto> economyList = homeService.economyBook();
		List<BookDto> ItList = homeService.itBook();
		
		model.addAttribute("bookList", bookList);
		model.addAttribute("novelList", novelList);
		model.addAttribute("economyList", economyList);
		model.addAttribute("ItList", ItList);
		
		return "/index.empty";
	}
	
}
