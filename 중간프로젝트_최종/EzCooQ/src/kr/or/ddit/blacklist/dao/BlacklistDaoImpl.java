package kr.or.ddit.blacklist.dao;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.util.SqlMapClientFactory;

public class BlacklistDaoImpl implements IBlacklistDao{
	private static IBlacklistDao bDao;
	private SqlMapClient smc;
	
	private BlacklistDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IBlacklistDao getInstance() {
		if(bDao == null) {
			bDao = new BlacklistDaoImpl();
		}
		return bDao;
	}
}
