package com.yijiwenhua.mayigege.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/")
public class IndexController {

	@RequestMapping("index.html")
	public String index(){
		return "index";
	}
	
	@RequestMapping("commons/404.html")
	public String fourZeroFour(){
		return "/commons/404";
	}
	
	@RequestMapping("commons/500.html")
	public String fiveZeroZero(){
		return "/commons/500";
	}
}
