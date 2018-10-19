package com.bit.emoji;

import java.util.List;

import javax.servlet.http.HttpSession;

import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.emoji.model.DeliciousMapVO;
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

		//맛집지도 검색일때
		if (dbchoice.equals("dMap")) {

			List<DeliciousMapVO> list = searchservice.selectDmap(search3);
	
			Iterator<DeliciousMapVO> itr = list.iterator();
			while (itr.hasNext()) {
				DeliciousMapVO deliciousMapVO = itr.next();
				deliciousMapVO.setDeliciousCount(searchservice.selectScrapCount(deliciousMapVO.getDeliciousMapNum()));
			}

			model.addAttribute("Search", list);

			str = "searchDmap";

			//원정대 검색일때
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