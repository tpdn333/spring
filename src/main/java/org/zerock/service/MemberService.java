package org.zerock.service;

import org.zerock.domain.MemberVO;

public interface MemberService {

	public boolean insert(MemberVO vo);

	public MemberVO read(String name);

	public boolean modify(MemberVO vo);

	public boolean remove(MemberVO vo);

	public boolean remove(MemberVO vo, String oldPassword);

	public boolean modify(MemberVO vo, String oldPassword);
}

