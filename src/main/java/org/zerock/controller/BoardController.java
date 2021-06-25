package org.zerock.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
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
	public void list(@ModelAttribute("cri") Criteria cri, Model model) {
		log.info("board/lsit method 실행됨!");
		int total = service.getTotal(cri);
		
		// service getList() 실행결과를
		List<BoardVO> list = service.getList(cri);

		// model에 attribute로 넣고
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		// view로 forward
	}

	@PostMapping("register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("board/register method 실행됨!");

		// service에게 등록업무를 시키고
		service.register(board);

		// redirect 목적지로 정보 전달
		rttr.addFlashAttribute("result", board.getBno());
		rttr.addFlashAttribute("messageTitle", "등록 성공");
		rttr.addFlashAttribute("messageBody", board.getBno() + "번 게시물이 등록 되었습니다.");

		// /board/list redirect
		return "redirect:/board/list";

	}
	@GetMapping({ "get", "modify" })
	public void get(@RequestParam("bno") Long bno, 
			@ModelAttribute("cri") Criteria cri, 
			Model model) {
		log.info("board/get method 실행됨!!!!!! ");
		// service에게 일 시킴
		service.addViews(bno);
		BoardVO board = service.get(bno);
		
		// 결과를 model객체에 넣음
		model.addAttribute("board", board);
		
		// forward가 알아서됨
	}
	
	@PostMapping("modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		// request param 수집
		
		// service 일 시킴
		boolean success = service.modify(board);
		// 결과를 model(또는 FlashMap)에 넣고
		if(success) {
			rttr.addFlashAttribute("result", "success");
			rttr.addFlashAttribute("messageTitle", "수정 성공");
			rttr.addFlashAttribute("messageBody", "수정 되었습니다.");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		// redirect
		return "redirect:/board/list";
	}
	
	@PostMapping("remove")
	public String remove(@RequestParam("bno") Long bno, 
			Criteria cri, RedirectAttributes rttr) {
		// param 수집
		
		// service 
		boolean success = service.remove(bno);
		
		if(success) {
			rttr.addFlashAttribute("result", "success");
			rttr.addFlashAttribute("messageTitle", "삭제 성공");
			rttr.addFlashAttribute("messageBody", "삭제 되었습니다.");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	@GetMapping("register")
	public void register(@ModelAttribute("cri") Criteria cri) {
		// /WEB-INF/views/board/register.jsp로 forward됨
		// 화면만 보여줘야되서 아무것도 필요없음.
	}
}













