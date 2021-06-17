package org.zerock.controller.lecture;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("ex01") // <- 경로로 오면 Ex01Controller가 일함
@Log4j
public class Ex01Controller {
	
	@RequestMapping("/sub01") // <- ex01/sub01 경로로 오면 method가 일함
	public void method01() {
		log.info("ex01, sub01 method");
	}
	
	@RequestMapping("sub02")
	public void method02() {
		log.info("ex01, sub02 method");
	}
	
	@RequestMapping(value = "sub03", method = RequestMethod.GET)
	public void method03() {
		log.info("ex01, sub03 doGet method");
	}
	
	@RequestMapping(value = "sub03", method = RequestMethod.POST)
	public void method04() {
		log.info("ex01, sub03 doPost method");
	}
	
	@GetMapping("sub05")
	public void method05() {
		log.info("ex01, sub05 GetMapping Method");		
	}
	
	@PostMapping("sub06")
	public void method06() {
		log.info("ex01, sub06 PostMapping Method");
	}
}
