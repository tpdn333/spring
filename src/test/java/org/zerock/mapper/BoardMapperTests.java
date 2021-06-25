package org.zerock.mapper;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {
		assertNotNull(mapper);
		mapper.getList().forEach(board -> log.info(board));
		List<BoardVO> list = mapper.getList();
		assertEquals(5, list.size());
		
	}
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("new user2");
		
		int cnt = mapper.insert(board);
		assertEquals(1, cnt);
	}
	
	@Test
	public void testInsertSelectkey() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("new user2");
		
		assertEquals(0, board.getBno());
	
		int cnt = mapper.insertSelectKey(board);
		
		assertNotEquals(0, board.getBno());
		assertEquals(1, cnt);
	}
	
	@Test
	public void testRead() {
		BoardVO board = mapper.read(3L);
		
		log.info(board);
	}
	
	@Test
	public void testDelete() {
		
		BoardVO board = new BoardVO();
		board.setTitle("title delete");
		board.setContent("content delete");
		board.setWriter("writer delete");
		
		mapper.insertSelectKey(board);
		
		log.info("DELETE COUNT: " + mapper.delete(board.getBno()));
	}
	
	@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		board.setBno(5);
		board.setTitle("update title");
		board.setContent("update content");
		board.setWriter("update writer");
		
		int cnt = mapper.update(board);
		
		assertEquals(1, cnt);
	}
	
	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setType("W");
		cri.setKeyword("123");
		
		mapper.getListWithPaging(cri);
	}
}
