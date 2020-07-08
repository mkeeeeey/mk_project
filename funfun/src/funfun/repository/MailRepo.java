package funfun.repository;

import org.springframework.stereotype.Repository;

import funfun.vo.MailAuth;

@Repository
public interface MailRepo {
	
	
	public void insertAuthData(MailAuth mailAuth);
	
	public int getAuthData(String email);
	
	public void expireMailCode(int code);
	
}
