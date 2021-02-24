package kr.or.ddit.blacklist.vo;

public class BlacklistVO {
	private String ADMIN_ID;

	public String getADMIN_ID() {
		return ADMIN_ID;
	}

	public void setADMIN_ID(String aDMIN_ID) {
		ADMIN_ID = aDMIN_ID;
	}

	@Override
	public String toString() {
		return "adminVO [ADMIN_ID=" + ADMIN_ID + "]";
	}
	
}
