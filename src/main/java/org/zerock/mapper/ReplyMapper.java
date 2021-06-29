package org.zerock.mapper;

import org.zerock.domain.ReplyVO;

public interface ReplyMapper {
	
	public int insert(ReplyVO vo);
	
	public ReplyVO read(Long rno);
	
	public int insertSelectKey(ReplyVO vo);
	
	public int delete(Long rno);

	public int update(ReplyVO vo);

}
