package kr.or.ddit.star.service;

import kr.or.ddit.star.dao.IStarDao;
import kr.or.ddit.star.dao.StarDaoImpl;

public class StarServiceImpl implements IStarService{

	private IStarDao sDao;
	private static IStarService service;
	
	public StarServiceImpl() {
		try {
			sDao = StarDaoImpl.getInstance();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static IStarService getInstance() {
		if(service == null) {
			service = new StarServiceImpl();
		}
		return service;
	}
	
}
