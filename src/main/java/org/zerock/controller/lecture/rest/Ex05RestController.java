package org.zerock.controller.lecture.rest;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.controller.lecture.domain.User;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("rest05")
@Log4j
public class Ex05RestController {
	
	@RequestMapping("sub01")
	public User method01(@RequestBody User user) {
		log.info("rest05 sub01 method 실행");
		return user;
	}
	
	@RequestMapping("sub02")
	public String method02() {
		log.info("ret05 sub02");
		return "hello";
	}
}
