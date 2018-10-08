package com.bit.emoji.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Testcontroller {
	@RequestMapping(value = "/ee")
	public String home() {
		return "testNill/ee";
	}
	
	
	@RequestMapping(value = "/eee")
	public String home2() {
		return "testNill/eee";
	}
	
	@RequestMapping(value = "/rr")
	public String home3() {
		return "testNill/rr";
	}
	
}