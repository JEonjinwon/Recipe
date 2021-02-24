package kr.or.ddit.blacklist.service;

import kr.or.ddit.blacklist.dao.BlacklistDaoImpl;
import kr.or.ddit.blacklist.dao.IBlacklistDao;

public class BlacklistServiceImpl implements IBlacklistService{
	private IBlacklistDao bDao;
	private static IBlacklistService service;
	
	private BlacklistServiceImpl() {
		bDao = BlacklistDaoImpl.getInstance();
	}
	
	public static IBlacklistService getInstance() {
		if(service == null) {
			service = new BlacklistServiceImpl();
		}
		return service;
	}
	
}
