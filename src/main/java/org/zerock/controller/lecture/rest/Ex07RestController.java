package org.zerock.controller.lecture.rest;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.controller.lecture.domain.User;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("rest07")
@Log4j
public class Ex07RestController {

	@GetMapping("sub01")
	public String method01(String name, int age, HttpServletRequest req) {
		log.info("rest07 sub01 get method 실행");
		log.info("name : " + name + ", age : " + age);
		return "method1 [ name : " + name + ", age : " + age + " ]";
	}
	
	@PostMapping("sub02")
	public String method02(String id, int age, HttpServletRequest req) throws IOException {
		log.info("rest07 sub02 post method 실행");
		log.info(req.getRequestURI());
		
//		request body
//		log.info(req.getReader().lines().collect(Collectors.joining(System.lineSeparator())));
		
		return "method2 [ id : " + id + ", age : " + age + " ]";
	}
	
	@PostMapping("sub03")
	public String method03(@RequestBody User user) {
		log.info(user);
		
		return "";
	}
	
	@RequestMapping("sub04")
	public User method04() {
		User user = new User();
		user.setId("세우");
		user.setAge(28);
		
		return user;
	}
}







