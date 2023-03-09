package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criterial;
import org.zerock.domain.ReplyVO;

public interface ReplyMapper {
	
	public int insert(ReplyVO vo);
	
	public ReplyVO read(int r_seq); //특정 댓글 읽기
	
	public int delete (int r_seq);
	
	public int update (ReplyVO reply);
	
	public List<ReplyVO> getListWithPaging(
			@Param("cri") Criterial cri,
			@Param("b_seq") int b_seq);
	
	public int getCountByB_seq(int b_seq);
	
}
