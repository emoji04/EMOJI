package com.bit.emoji;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping(value = "/")
	public String home() {
		return "home";
	}

	@RequestMapping(value = "/home")
	public String home2() {
		return "home";
	}
}