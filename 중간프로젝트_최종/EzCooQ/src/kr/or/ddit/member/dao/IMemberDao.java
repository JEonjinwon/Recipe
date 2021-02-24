package kr.or.ddit.member.dao;

import java.util.List;

import kr.or.ddit.member.vo.MemberVO;

public interface IMemberDao {

	boolean createMember(MemberVO mv);

	boolean checkMember(String memId);

	boolean logIn(MemberVO mv);

	MemberVO getMember(String memId);

	boolean getPoint(MemberVO mv);
	
	boolean updateMember(MemberVO mv);
	
	List<MemberVO> displayAll(String memId);

	boolean deleteMember(String memId);
	
}
