package kr.or.ddit.star.dao;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.util.SqlMapClientFactory;

public class StarDaoImpl implements IStarDao {

	private static IStarDao sDao;
	private SqlMapClient smc;
	
	public StarDaoImpl() throws Exception{
		smc = SqlMapClientFactory.getInstance();
	} 
	
	public static IStarDao getInstance() throws Exception {
		if(sDao == null) {
			sDao = new StarDaoImpl();
		}
		return sDao;
	}
}
