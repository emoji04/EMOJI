package com.bit.emoji.route.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.emoji.model.DeliciousMapVO;
import com.bit.emoji.model.DeliciousPinVO;
import com.bit.emoji.route.service.MakeRouteService;

@Controller
public class MakeRouteController {
	@RequestMapping("/goRoute")
	public String routeFrom() {
		return "route";
	}
}