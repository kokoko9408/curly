package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criterial;
import org.zerock.model.AttachImageVO;

public interface BoardService {
	
	public void register(BoardVO board);
	
	public BoardVO get(int b_seq);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(int b_seq);
	
	
	//public List<BoardVO> getList();
	
	public List<BoardVO> getList(Criterial cri);
	
	public int getTotal(Criterial cri);
	public int readCount(int b_seq);
	
	public List<BoardAttachVO> getAttachList(Long b_seq);

	public List<BoardVO> bestlistAll(Criterial cri); 

	//public void imageEnroll(BoardVO board);
	
	
	
	
}
