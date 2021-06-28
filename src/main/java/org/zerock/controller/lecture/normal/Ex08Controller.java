package org.zerock.controller.lecture.normal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.controller.lecture.domain.User;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("ex08")
public class Ex08Controller {
	
	@RequestMapping("sub01")
	public void method01(Model model) {
		log.info("ex08, sub01 method");
		
		model.addAttribute("name", "tpdn");
		model.addAttribute("age", 22);
	}
	
	@RequestMapping("sub02")
	public void method02(Model model) {
		log.info("ex08, sub01 method");
		
		User user = new User();
		user.setId("tpdn");
		user.setAge(22);
		model.addAttribute("user", user);
	}
	
	@RequestMapping("sub03")
	public String method03(Model model) {
		log.info("ex08, sub03 method");
		
		User user = new User();
		user.setId("korea");
		user.setAge(5000);
		
//		이름을 생략하면 클래스명(User)이 어트리뷰트명(user)으로 설정됨
//		알아서 첫번째 대문자는 소문자로 변경되서 설정됨
//		model.addAttribute("user", user);
		model.addAttribute(user);
		
		
		return "ex08/sub02";
	}
	
//	http://localhost:8080/controller/ex08/sub04?id=qhgus&age=28
	@RequestMapping("sub04")
	public String method04(User user, Model model) {
		log.info("ex08, sub04 method");
		
		model.addAttribute(user);
		
		return "ex08/sub02";
	}
	
	@RequestMapping("sub05")
	// 4개가 같은 동작을함
//	public String method05(@ModelAttribute("user") User user, Model model) {
//	public String method05(@ModelAttribute User user, Model model) {	
//	public String method05(User user, Model model) {
	public String method05(User user) {
		log.info("Ex08, Sub05 method");
		
		return "ex08/sub02";
	}
	
	@RequestMapping("sub07")
	public String method07(User user, Model model) {
		log.info("Ex08, Sub07 method");
		
		model.addAttribute("hello world");
		return "ex08/sub02";
	}
	
	@RequestMapping("sub09")
//	@RequestParam 생략가능
//	public void method09(@RequestParam int age, @RequestParam String name) {
	public void method09(@ModelAttribute("age") int age, 
			@ModelAttribute("name") String name) {
		log.info("ex08, sub09 method");
		
		log.info(age);
		log.info(name);
	}
}
