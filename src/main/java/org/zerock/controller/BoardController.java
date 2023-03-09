package org.zerock.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criterial;
import org.zerock.domain.PageDTO;
import org.zerock.mapper.BoardAttachMapper;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller // 스프링빈으로 인식할 수 있게
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;

	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;

	/* 전체목록을 가져오기 */
	@GetMapping("/list")
	public void list(Criterial cri, Model model) {

		log.info("list");

		List<BoardVO> list = service.getList(cri);

		for (BoardVO board : list) { // attachList에 BoardAttachVO 객체 추가
			board.setAttachList(service.getAttachList((long) board.getB_seq()));
		} // 첨부파일 가져오기!

		log.info(list);

		model.addAttribute("list", service.getList(cri));
		log.info(cri);

		// model.addAttribute("pageMaker",new PageDTO(cri,123));

		int total = service.getTotal(cri);

		log.info("total :" + total); // 총 게시물 수
		model.addAttribute("list", list); // list에 담아줘야지 BoardAttachVO 객체들
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	/* 게시물 등록 */
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("register : " + board);

//		if(board.getAttachList() != null) {
//			board.getAttachList().forEach(attach -> log.info(attach));
//			
//		}

		service.register(board);
		
		//addFlashAttribute() 이용해 일회성으로만 데이터를 사용
		rttr.addFlashAttribute("result", board.getB_seq());
		return "redirect:/board/list"; // redirect : 등록작업이 끝난 후 다시 목록화면으로 이동
	}
	
	/* 게시물 입력 페이지 */
	@GetMapping("/register")
	public void register() {

	}

	/* 게시물 조회 */
	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("b_seq") int b_seq, @ModelAttribute("cri") Criterial cri, 
			Model model) {                         // @ModelAttribute 지정한 이름으로 데이터를 담아주는 기능

		log.info("/get or /modify");

		service.readCount(b_seq);

		model.addAttribute("board", service.get(b_seq));
	}

	/* 게시물 수정 */
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criterial cri, RedirectAttributes rttr) {
		
		log.info("modify : " + board);

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/board/list";
	}

	/* 이미지 정보 반환 */
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long b_seq) {

		log.info("겟어태치리스트 : " + b_seq);

		return new ResponseEntity<>(service.getAttachList(b_seq), HttpStatus.OK);

	}

	

//	@GetMapping({"/get","/modify"})
//	public void get(@RequestParam("b_seq") int b_seq, Model model) {
//		log.info("/get or /modify");
//		model.addAttribute("board", service.get(b_seq));
//	}

//	@PostMapping("/modify")
//	public String modify(BoardVO board, RedirectAttributes rttr) {
//		log.info("modify : " + board);
//		
//		if(service.modify(board)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		return "redirect:/board/list";
//	}

	

//	@PostMapping("/remove")
//	   public String remove(@RequestParam("b_seq") int b_seq, RedirectAttributes rttr) {
//	      
//	      log.info("remove...." + b_seq);
//	      
//	      if(service.remove(b_seq)) {
//	         rttr.addFlashAttribute("result", "success");
//	      }
//	      
//	      rttr.addAttribute("pageNum", cri.getPageNum());
//	      rttr.addAttribute("amount", cri.getAmount());
//	      rttr.addAttribute("type", cri.getType());
//	      rttr.addAttribute("keyword", cri.getKeyword());
//	      
//	      return "redirect:/board/list";
//	      
//	   }

//	@PostMapping("/remove")
//	public String remove(@RequestParam("b_seq") int b_seq, @ModelAttribute("cri") Criterial cri,
//			RedirectAttributes rttr) {
//
//		log.info("remove...." + b_seq);
//
//		if (service.remove(b_seq)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
//
//		return "redirect:/board/list";
//
//	}

	@PostMapping("/remove")
	public String remove(@RequestParam("b_seq") int b_seq, Criterial cri, RedirectAttributes rttr) {

		log.info("remove..." + b_seq);

		List<BoardAttachVO> attachList = service.getAttachList((long) b_seq);

		if (service.remove(b_seq)) {

			// delete Attach Files
			deleteFiles(attachList);

			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list" + cri.getListLink();
	}

	private void deleteFiles(List<BoardAttachVO> attachList) {

		if (attachList == null || attachList.size() == 0) {
			return;
		}

		log.info("delete attach files...................");
		log.info(attachList);

		attachList.forEach(attach -> {
			try {
				Path file = Paths.get(
						"C:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());

				Files.deleteIfExists(file);

				if (Files.probeContentType(file).startsWith("image")) {

					Path thumbNail = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_"
							+ attach.getFileName());

					Files.delete(thumbNail);
				}

			} catch (Exception e) {
				log.error("delete file error" + e.getMessage());
			} // end catch
		});// end for each end
	}

	

}
