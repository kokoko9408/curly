package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criterial;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.domain.ReplyVO;

public interface ReplyService {
	
	
	public int register(ReplyVO vo);
	public ReplyVO get(int r_seq);
	public int modify(ReplyVO vo);
	public int remove(int r_seq);
	public List<ReplyVO> getList(Criterial cri, int b_seq);
	public ReplyPageDTO getListPage(Criterial cri, int b_seq);
	
	
}
