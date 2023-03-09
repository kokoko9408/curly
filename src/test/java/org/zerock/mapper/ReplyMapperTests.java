package org.zerock.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criterial;
import org.zerock.domain.ReplyVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	private int[] b_seqArr = {413,412,411,410,409};

	@Autowired
	private ReplyMapper mapper;

	
	
	@Test
	public void testCreate() {
		IntStream.rangeClosed(1,10).forEach(i-> {
			ReplyVO vo = new ReplyVO();
			
			//게시물 번호
			vo.setB_seq(b_seqArr[i%5]);
			vo.setR_reply("댓글아들어가라" +i);
			vo.setR_replyer("윤수경" + i);
			
			mapper.insert(vo);
		});
	
	}
		@Test
		public void testMapper() { //그냥 mapper가 시행되는지
			log.info(mapper);
		}
		
		@Test
		public void testRead() {
			int targetR_seq = 10;
			
			ReplyVO vo = mapper.read(targetR_seq);
			
			log.info(vo);
		}
		
		@Test
		public void testDelete() {
			int targetR_seq = 6;
			
			mapper.delete(targetR_seq);
		}
		
		@Test
		public void testUpdate() {
			
			int targetR_seq = 7;
			
			ReplyVO vo = mapper.read(targetR_seq);
			
			vo.setR_reply("업데이트");
			
			int count = mapper.update(vo);
			
			log.info(count);
			
		}
		
		@Test
		public void testList() {
			
			Criterial cri = new Criterial();
			List<ReplyVO> replies = mapper.getListWithPaging(cri, b_seqArr[0]);
			replies.forEach(reply -> log.info(reply));
		}
		
		@Test
		public void testList2() {
			
			Criterial cri = new Criterial(2,10);
			List<ReplyVO> replies = mapper.getListWithPaging(cri, 421);
			replies.forEach(reply -> log.info(reply));
		}
	
}
