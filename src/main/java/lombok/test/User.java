package lombok.test;

import lombok.RequiredArgsConstructor;
import lombok.ToString;

@ToString
@RequiredArgsConstructor
// final 필드만 생성자 생성
public class User {
	private final String name;
	private double price;
	private String address;
	private final String email;
}
