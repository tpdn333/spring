package org.zerock.mapper;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.TestVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TestMapperTests {

	@Setter(onMethod_ = @Autowired)
	private TestMapper mapper;

	@Test
	public void testGetList() {
		mapper.getList();
		assertNotNull(mapper);

	}

	@Test
	public void testInsert() {
		TestVO test = new TestVO();
		test.setName("세우");
		test.setAge(28);

		mapper.insert(test);
		log.info(test);
	}

	@Test
	public void testRead() {
		TestVO test = mapper.read(3);

		log.info(test);
	}

	@Test
	public void testDelete() {

		log.info("DELETE COUNT: " + mapper.delete(9));
	}

	@Test
	public void testUpdate() {
		TestVO test = new TestVO();
		test.setId(8);
		test.setName("유림");
		test.setAge(29);

		int cnt = mapper.update(test);
		log.info("UPDATE COUNT : " + cnt);
	}
}
