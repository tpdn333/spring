package org.zerock.controller.lecture;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("ex02")
@Log4j
public class Ex02Controller {
	
	@RequestMapping("sub01")
	public void method01(HttpServletRequest request) {
		log.info("ex02, sub01 동작함!");
		log.info(request);
	}
	
	@RequestMapping("sub02")
	public void method02(HttpServletRequest req) {
		log.info("ex02, sub02 동작함!");
		log.info(req.getParameter("id"));
		log.info(req.getParameter("age"));
	}
	
	@RequestMapping("sub03")
	public void method03(@RequestParam("id") String idParam) {
		// id 파라미터가 있으면 idParam에 저장함
		log.info("ex02, sub03 동작함!");
		log.info(idParam);
	}
	
	@RequestMapping("sub04")
	public void method04(@RequestParam("id") String idParam,
						 @RequestParam("age") int ageParam) {
		// id 파라미터가 있으면 idParam에 저장함
		log.info("ex02, sub04 동작함!");
		log.info(idParam);
		log.info(ageParam);
	}
	
	@RequestMapping("sub05")
	// 파라미터 이름을 보고 같은 이름으로 알아서 request객체로 꺼내줌
	public void method05(@RequestParam String id,
						@RequestParam int age) {
		log.info("ex02, sub05 동작함!");
		log.info(id);
		log.info(age);
	}
	
	@RequestMapping("sub06")
	public void method06(@RequestParam int age) {
		log.info(age + "는 int");
	}
	
	@RequestMapping("sub07")
	public void method07(@RequestParam String[] fav) {
		for(String favs : fav) {
			log.info(favs);
		}
	}
	
	@RequestMapping("sub08")
	public void method08(@RequestParam List<String> fav) {
		log.info("ex02, sub08 동작함!");
		log.info(fav);
	}
}
