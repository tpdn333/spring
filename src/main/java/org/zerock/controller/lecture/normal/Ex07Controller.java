package org.zerock.controller.lecture;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.controller.lecture.domain.User;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/ex07/*")
public class Ex07Controller {
	
	@RequestMapping("sub01")
	public @ResponseBody String method01() {
		log.info("ex07, sub01 method");
		// forward, redirect, views.jsp도 아니고 return이 응답 그자체가 됨
		return "my response message!";
	}
	
	@RequestMapping("sub04")
	public @ResponseBody User method04() {
		log.info("ex07,sub04");
		
		User user = new User();
		user.setId("tpdn");
		user.setAge(28);
		
		return user;
	}
	
	@RequestMapping("sub05")
	public ResponseEntity<String> method05() {
		log.info("ex07, sub05");
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=utf-8");
		headers.add("my-header", "my-value");
		
		String body = "<h1>Hello Entity</h1>";
		
		// 상태 코드값
		// 부가정보(header)
		// 본문(body)
		return new ResponseEntity<String>(body, headers, HttpStatus.OK);
	}
}
