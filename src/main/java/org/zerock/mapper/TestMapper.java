package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.TestVO;

public interface TestMapper {

	public List<TestVO> getList();

	public void insert(TestVO test);

	public TestVO read(int id);

	public int delete(int id);

	public int update(TestVO test);
}
