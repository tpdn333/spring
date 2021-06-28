package org.zerock.controller.lecture.rest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.controller.lecture.domain.User;

import lombok.extern.log4j.Log4j;

/*******************************************************
 ******* @Controller
 ******* @ResponseBody // 모드 메소드에 붙인 것과 같음 2개의 조합은 @RestController
 ********************************************************/

@RestController
@RequestMapping("rest02")
@Log4j
public class Ex02RestController {

	@RequestMapping("sub01")
	public String method01() {
		log.info("rest02 sub01 method 실행");

		return "response body1";
	}

	@RequestMapping("sub02")
	public User metho02() {
		User user = new User();
		user.setAge(20);
		user.setId("tpdn");

		return user;
	}

	@RequestMapping("sub03")
	public List<String> method03() {
		List<String> list = new ArrayList<String>();
		list.add("java");
		list.add("script");
		list.add("tpdn");
		list.add("tjdud");

		return list;
	}

	@RequestMapping("sub04")
	public List<User> method04() {
		List<User> list = new ArrayList<>();
		User user = new User();
		user.setAge(28);
		user.setId("tpdn");
		list.add(user);

		user.setAge(20);
		user.setId("dbals");
		list.add(user);

		user.setAge(30);
		user.setId("dbfla");
		list.add(user);

		return list;
	}

	@RequestMapping("sub05")
	public String[] method05() {
		return new String[] { "java", "세우", "서영", };
	}

	@RequestMapping("sub06")
	public Map<String, String> method06() {
		Map<String, String> map = new HashMap<>();
		map.put("k1", "v1");
		map.put("k2", "v2");
		map.put("k3", "v3");

		return map;
	}
	
	@RequestMapping("sub07")
	public Map<String, User> method07() {
		Map<String, User> map = new HashMap<>();
		
		User user = new User();
		user.setId("tpdn");
		user.setAge(20);
		map.put("u1", user);
		map.put("u2", user);
		map.put("u3", user);
				
		return map;
	}
}
