package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criterial;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Setter(onMethod_ = { @Autowired })
	private BoardService service;

	
	
	
	@Test
	public void testExist() { // 객체가 제대로 주입이 가능한지 확인하는 작업

		log.info(service);
		assertNotNull(service);
	}

	@Test
	public void testRegister() {
		BoardVO board = new BoardVO();
		board.setB_title("파마");
		board.setB_content("저보고 파마했녜요");
		board.setB_writer("신봉재");

		service.register(board);
		log.info("게시물 번호 : " + board.getB_seq());
		
		
		List<BoardAttachVO> getAttaList = new ArrayList<BoardAttachVO>();
		
		BoardAttachVO image1 = new BoardAttachVO();
		
		image1.setFileName("테스트1");
		image1.setUploadPath("테스트경로1");
		image1.setUuid("eeeeeeee");
		
		getAttaList.add(image1);
		
		board.setAttachList(getAttaList);
		
		service.register(board);
		
		
		
		
	}
	
	@Test
	public void testGetList()  { //테스트 시 추가된 데이터가 정상적으로 나오는지 확인
		service.getList(new Criterial(2,10)).forEach(board -> log.info(board));
		
	}
	
	@Test
	public void testGet() {
		log.info(service.get(8));
	}
	
	@Test
	public void testDelete() {
		log.info("remove result : " +service.remove(497));
	}
	
	@Test
	public void testUpdate() {
		BoardVO board = service.get(11);
		
		if(board==null) {
			return;
		}
		
		board.setB_content("부럽지않아요");
		log.info("modify result : " + service.modify(board));
	}
}
