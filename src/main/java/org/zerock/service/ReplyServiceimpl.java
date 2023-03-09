package org.zerock.service;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criterial;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
public class ReplyServiceimpl implements ReplyService {

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;
	
	@Transactional
	@Override
	public int register(ReplyVO vo) {
		// TODO Auto-generated method stub
		
		log.info("등록합니다" +vo);
		boardMapper.updateReplyCnt(vo.getB_seq(),1);
		
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(int r_seq) {
		// TODO Auto-generated method stub
		log.info("get" +r_seq);
		return mapper.read(r_seq);
	}

	@Override
	public int modify(ReplyVO vo) {
		
		log.info("modify" + vo);
		return mapper.update(vo);
	}
	
	
	@Transactional
	@Override
	public int remove(int r_seq) {
		
		ReplyVO vo = mapper.read(r_seq);
		boardMapper.updateReplyCnt(vo.getB_seq(), -1);
		log.info("remove" + r_seq);
		// TODO Auto-generated method stub
		return mapper.delete(r_seq);
	}

	@Override
	public List<ReplyVO> getList(Criterial cri, int b_seq) {
		log.info("겟리스트 죽여버리고싶어" + b_seq);
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(cri, b_seq);
	}

	@Override
	public ReplyPageDTO getListPage(Criterial cri, int b_seq) {
		
		log.info("여기가 문제구먼?");
		// TODO Auto-generated method stub
		return new  ReplyPageDTO(
				
				mapper.getCountByB_seq(b_seq),
				mapper.getListWithPaging(cri, b_seq));
	}
}
