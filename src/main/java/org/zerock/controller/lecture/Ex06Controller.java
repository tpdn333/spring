package org.zerock.controller.lecture;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("ex06")
public class Ex06Controller {
	
	@RequestMapping("sub01")
	public String method01() {
		log.info("Ex06, sub01 동작함!");
		/*
		request.getRequestDispatcher("/WEB-INF/views/ex06/sub01.jsp").foward(reqeust, response);
		*/
		return "ex06/sub01";
	}
	
	@RequestMapping("sub02")
	public void method02() {
		log.info("ex06, sub02 method");
	}
	
	@RequestMapping("sub03")
	public String method03() {
		log.info("ex06, sub03 method");
		// 주소는 그대로 있고 포워드한다.
		return "forward:/ex06/sub02";
	}
	
	@RequestMapping("sub04")
	public String method04() {
		log.info("ex06, sub04 method");
		// 주소가 바뀐다.
		return "redirect:/ex06/sub02";
	}
}
