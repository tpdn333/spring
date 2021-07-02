package org.zerock.mapper;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	private Long[] bnoArr = { 149L, 150L, 151L, 152L, 153L };
	
	@Test
	public void testMapper() {
		assertNotNull(mapper);
	}
	
	@Test
	public void testInsert() {
		ReplyVO vo = new ReplyVO();
		vo.setBno(153L);
		vo.setReply("화이팅");
		vo.setReplyer("진아진");
		int cnt = mapper.insert(vo);
		assertEquals(1, cnt);
	}
	
	@Test
	public void testCreate() {
		IntStream.range(30, 50).forEach(i -> {
			ReplyVO vo = new ReplyVO();
			
			vo.setBno(bnoArr[i % 5]);
			vo.setReply("댓글 테스트" + i);
			vo.setReplyer("replyer" + i);
			
			mapper.insert(vo);
		});
	}
	
	@Test
	public void testRead() {
		ReplyVO vo = mapper.read(1L);
		
		assertEquals("화이팅", vo.getReply());
	}
	
	@Test
	public void testDelete() {
		ReplyVO vo = new ReplyVO();
		vo.setBno(153L);
		vo.setReply("지울 댓글");
		vo.setReplyer("user00");
		mapper.insertSelectKey(vo);
		
		int cnt = mapper.delete(vo.getRno());
		assertEquals(1, cnt);
	}
	
	@Test
	public void testUpdate() {
		ReplyVO vo = mapper.read(1L);
		
		String re = "수정된 댓글!!";
		vo.setReply(re);
		
		assertEquals(1, mapper.update(vo));
		
		vo = mapper.read(1L);
		assertEquals(re, vo.getReply());
	}
	
	@Test
	public void testGetList() {
		Long bno = 150L;
		
		List<ReplyVO> list = mapper.getList(bno);
		
		assertTrue(list.size() > 0);
	}
	
	@Test
	public void testDeleteByBno() {
		Long bno = 154L;
		mapper.deleteByBno(bno);
	}
}
