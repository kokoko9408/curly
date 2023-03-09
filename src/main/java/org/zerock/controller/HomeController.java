package org.zerock.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criterial;
import org.zerock.service.BoardService;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Log4j
@Controller
public class HomeController {
	
	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,Criterial cri) {
		/* 베스트 게시판 게시글 출력 */
		List<BoardVO> list = service.getList(cri);
		 for(BoardVO board : list) { // attachList에 BoardAttachVO 객체 추가
	           board.setAttachList(service.getAttachList((long) board.getB_seq()));
	       }
		 log.info("베스트 게시물 :" + list);
	
		model.addAttribute("list", service.bestlistAll(cri));
		model.addAttribute("list", list);
		return "home";
	}
	
}
