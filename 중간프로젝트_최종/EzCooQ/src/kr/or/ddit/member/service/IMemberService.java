package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.vo.MemberVO;

public interface IMemberService {
	boolean createMember(MemberVO mv); //C
	MemberVO getMember(String memId);  //R
	boolean updateMember(MemberVO mv); //U
	boolean deleteMember(String memId);//D

	List<MemberVO> displayAll(String memId);
	
	boolean checkMember(String memId);
	
	boolean logIn(MemberVO mv);
	
	boolean getPoint(MemberVO mv);

}
