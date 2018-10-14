package com.bit.emoji;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.emoji.service.SearchService;

@Controller
public class HomeController {
	
	@Autowired
	SearchService searchservice;

	
	@RequestMapping(value = "/")
	public String home() {
		return "home";
	}

	@RequestMapping("/mainsearch")
	public String search(Model model, @RequestParam(value = "search3") String search3,
			@RequestParam(value = "dbchoice") String dbchoice) {

		String str = "";

		if (dbchoice.equals("dMap")) {

			model.addAttribute("Search", searchservice.selectDmap(search3));

			str = "searchDmap";

		} else {

			model.addAttribute("Search", searchservice.selectRoute(search3));

			str = "searchRoute";
		}

		return str;
	}

	@RequestMapping(value = "/home")
	public String home2() {
		return "home";
	}
}