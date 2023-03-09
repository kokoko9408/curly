package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criterial;

public interface BoardMapper {
	
	
	//@Select("select * from request_board where bno > 0 ")
	public List<BoardVO> getList();
	
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(int b_seq);
	
	public int delete(int b_seq);
	
	public int update(BoardVO board);
	
	public List<BoardVO> getListWithPaging(Criterial cri); //페이징 처리
	
	public int getTotalCount(Criterial cri);
	
	public void updateReplyCnt(@Param("b_seq") int b_seq, @Param("amount") int amount);
	
	public List<BoardVO> bestlistAll(Criterial cri);
	
	public int readCount(int b_seq);
	
	

}
