package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class MemberDaoImpl implements IMemberDao{
	private static IMemberDao memberDao;
	private SqlMapClient smc;
	
	private MemberDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IMemberDao getInstance() {
		if(memberDao == null) {
			memberDao = new MemberDaoImpl();
		}
		return memberDao;
	}

	@Override
	public boolean createMember(MemberVO mv) {
		try {
			if(smc.insert("member.createMember", mv) == null)
				return true;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean checkMember(String memId) {
		try {
			if(0 < (int) smc.queryForObject("member.checkMember", memId))
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean logIn(MemberVO mv) {
		try {
			if((int)smc.queryForObject("member.logIn", mv) > 0)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public MemberVO getMember(String memId) {
		MemberVO memberVO = null;
		try {
			memberVO = (MemberVO)smc.queryForObject("member.getMember", memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberVO;
	}

	@Override
	public boolean getPoint(MemberVO mv) {
		try {
			int cnt = smc.update("member.getPoint", mv);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean updateMember(MemberVO mv) {
		try {
			int cnt = smc.update("member.updateMember", mv);
			if(cnt > 0) {
				return true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public List<MemberVO> displayAll(String memId) {
		List<MemberVO> memberList = new ArrayList<>();
		try {
			memberList = (List<MemberVO>)smc.queryForList("member.displayAll", memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberList;
	}

	@Override
	public boolean deleteMember(String memId) {
		try {
			int cnt = smc.delete("member.deleteMember", memId);
			if(cnt > 0) {
				return true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
}
