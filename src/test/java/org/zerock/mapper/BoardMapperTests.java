package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criterial;
import org.zerock.model.AttachImageVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_ =@Autowired)
	private BoardAttachMapper attachMapper;

//	@Setter(onMethod_ = @Autowired)
//	private BoardAttachMapper BAmapper;

	/* 이미지 등록 */
	@Test
	public void imageEnrollTest() {

		BoardAttachVO vo = new BoardAttachVO();

		vo.setB_seq(139L);
		vo.setFileName("왜이래");
		vo.setUploadPath("제발");
		vo.setUuid("제발요");

		attachMapper.imageEnroll(vo);

	}
	
	/*이미지 정보 반환*/
	@Test
	public void getAttachListTests() {
		
		Long b_seq = 478L;
		
		System.out.println("이미지 정보 : " +attachMapper.getAttachList(b_seq));
		
		
	}
	

	@Test
	public void testGetList() {
		mapper.getList().forEach(board -> log.info(board));

	}

	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setB_title("꼽슬머리");
		board.setB_content("매직하고싶어요");
		board.setB_writer("채수림");

		System.out.println("Before BookVO :" + board);

		

		mapper.insert(board);
		System.out.println("After BookVO :" + board);
		log.info("인서트입니다요");

	}

	@Test
	public void testInsertSelectKey() {

		BoardVO board = new BoardVO();
		board.setB_title("곱슬머리");
		board.setB_content("곱슬머리 탈출");
		board.setB_writer("윤수경");

		mapper.insertSelectKey(board);
		log.info("인서트셀렉트");

	}

	@Test
	public void testRead() {
		BoardVO board = mapper.read(7);
		log.info("long b_seq로");
	}

	@Test
	public void testDelete() {
		log.info("delete count : " + mapper.delete(538));

	}
	
	

//	@Test
//	public void testUpdate() {
//		
//		BoardVO board = new BoardVO();
//		board.setB_seq(201803L);
//		board.setB_title("곱슬이 부러워요");
//		board.setB_content("곱슬머리하고싶어요");
//		board.setB_writer("김지은");
//		
//		int count = mapper.update(board);
//		log.info("update count :" + count);
//	}
	
	

	@Test
	public void testPaging() {
		Criterial cri = new Criterial();

		cri.setPageNum(3); //10개씩 3페이지
		cri.setAmount(10);

		List<BoardVO> list = mapper.getListWithPaging(cri);

		// list.forEach(board -> log.info(board));
		list.forEach(board -> log.info(board.getB_seq()));

	}

	@Test
	public void testSearch() {
		Criterial cri = new Criterial();
		cri.setKeyword("파마");
		cri.setType("TC");

		List<BoardVO> list = mapper.getListWithPaging(cri);

		list.forEach(board -> log.info(board));
	}

}
