package org.zerock.controller.lecture.rest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("rest01")
@Log4j
public class Ex01RestController {
	
	@RequestMapping("sub01")
	@ResponseBody
	public String method1() {
		log.info("rest sub01 method1 실행");
		
		return "/rest01/sub01";
		// jsp로 가는게아니라
		// 그 자체가 응답이 되어서 문자열로 나타남
		
	}
	
	@RequestMapping("sub02")
	@ResponseBody
	public String method2() {
		log.info("rest01 sub02 실행");
		
		return "<h1>hello wordl!</h1>";
	}

}
