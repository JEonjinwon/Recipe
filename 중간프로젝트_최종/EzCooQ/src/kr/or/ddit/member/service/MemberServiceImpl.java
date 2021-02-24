package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;

public class MemberServiceImpl implements IMemberService {
	private static IMemberService memberService;
	private IMemberDao memberDao;
	private MemberServiceImpl() {
		memberDao = MemberDaoImpl.getInstance();
	}
	
	public static IMemberService getInstance() {
		if(memberService == null) {
			memberService = new MemberServiceImpl();
		}
		return memberService;
	}

	@Override
	public boolean createMember(MemberVO mv) {
		return memberDao.createMember(mv);
	}

	@Override
	public boolean checkMember(String memId) {
		return memberDao.checkMember(memId);
	}

	@Override
	public boolean logIn(MemberVO mv) {
		return memberDao.logIn(mv);
	}

	@Override
	public MemberVO getMember(String memId) {
		return memberDao.getMember(memId);
	}

	@Override
	public boolean getPoint(MemberVO mv) {
		return memberDao.getPoint(mv);
	}

	@Override
	public boolean updateMember(MemberVO mv) {
		return memberDao.updateMember(mv);
	}
	

	@Override
	public List<MemberVO> displayAll(String memId) {
		return memberDao.displayAll(memId);
	}

	@Override
	public boolean deleteMember(String memId) {
		return memberDao.deleteMember(memId);
	}

}
