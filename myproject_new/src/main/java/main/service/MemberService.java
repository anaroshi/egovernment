package main.service;

import java.util.List;

public interface MemberService {
	
	// 회원등록
	public String insertMember(MemberVO vo) throws Exception;

	// 중보아이디 체크
	public int selectMemberIdCheck(String userid) throws Exception;
	
	// 우편번호(주소) 검색
	public List<?> selectPostList(String dong) throws Exception;
	
	// 로그인 처리
	public int selectMemberCount(MemberVO vo) throws Exception;

}
