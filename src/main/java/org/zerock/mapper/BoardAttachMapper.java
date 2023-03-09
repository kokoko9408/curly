package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardAttachVO;
import org.zerock.model.AttachImageVO;

public interface BoardAttachMapper {
	
//	public void insert(BoardAttachVO vo);
//	public void delete(String uuid);
	/* 이미지 등록 */
	public void imageEnroll(BoardAttachVO vo);
	
	//public List<BoardAttachVO> findByB_seq(Long b_seq);
	
	public List<BoardAttachVO> getAttachList(Long b_seq);

	public int deleteAll(int b_seq); //void에서 int로 변경
	
	/* 지정 상품 이미지 전체 삭제 */
	public void deleteImageAll(int bookId);
}
