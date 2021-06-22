package org.zerock.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("board")
@AllArgsConstructor
public class BoardController {

	private BoardService service;

	@GetMapping("list")
	public void list(Model model) {
		log.info("board/lsit method 실행됨!");
		// service getList() 실행결과를
		List<BoardVO> list = service.getList();

		// model에 attribute로 넣고
		model.addAttribute("list", list);
		// view로 forward
	}

	@PostMapping("register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("board/register method 실행됨!");

		// service에게 등록업무를 시키고
		service.register(board);

		// redirect 목적지로 정보 전달
		rttr.addFlashAttribute("result", board.getBno());

		// /board/list redirect
		return "redirect:/board/list";

	}
}
