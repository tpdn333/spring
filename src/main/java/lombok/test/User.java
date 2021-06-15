package lombok.test;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;


// final 필드만 생성자 생성
@Data
public class User {
	private final String name;
	private double price;
	private String address;
	private final String email;
}
