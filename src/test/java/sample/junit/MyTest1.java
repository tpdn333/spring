package sample.junit;

import static org.junit.Assert.*;

import org.junit.Test;

public class MyTest1 {
	
	// Test 메소드는 꼭 public / void / no parameter 
	@Test
	public void test() {
//		fail("Not yet implemented"); // 무조건 실패
		int i = 3;
		if(i != 3) {
			fail("i는 3이 아닙니다.");
		}
	}
	
	@Test
	public void equals() {
		int i = 3;
		boolean b = true;
		Object o = null;
		
		assertEquals(i, 3);
		assertTrue(b);
		assertNull(o);
	}
	
	@Test
	public void notEquals() {
		int i = 4;
		boolean b = false;
		Object o = new Object();
		
		assertNotEquals(i, 3);
		assertFalse(b);
		assertNotNull(o);
	}
}
