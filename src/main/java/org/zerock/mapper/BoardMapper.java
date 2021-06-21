package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardVO;

public interface BoardMapper {
	
	public List<BoardVO> getList();
	
	public int insert(BoardVO board);
	
	public int insertSelectKey(BoardVO board);
	
	public BoardVO read(long bno);
	
	public int delete(long bno);
	
	public int update(BoardVO board);
}
