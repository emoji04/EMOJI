package com.bit.emoji;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class controller2 {
	@RequestMapping(value = "/ee")
	public String home() {
		return "ee";
	}
	
	
	@RequestMapping(value = "/eee")
	public String home2() {
		return "eee";
	}
	
	@RequestMapping(value = "/rr")
	public String home3() {
		return "rr";
	}
}