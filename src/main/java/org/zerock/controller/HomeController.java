package org.zerock.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value ="/doA",method = RequestMethod.GET )
	public String doA(Locale locale , Model model) {
		System.out.println("doA_____________________________________");
		return "home";
	}
	
	@RequestMapping(value ="/doB",method = RequestMethod.GET )
	public String doB(Locale locale , Model model) {
		
		System.out.println("doB_____________________________________");
		model.addAttribute("result", "DOB RESULT");
		
		
		return "home";
		
	}
}
