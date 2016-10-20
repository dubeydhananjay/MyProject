package com.webdesign.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DesignController {

	@RequestMapping(value={"/","home"})
	public String getHome() {
		return "index";
	}

}
