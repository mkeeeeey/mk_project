package funfun.repository;

import org.springframework.stereotype.Repository;

import funfun.vo.UserProfile;

@Repository
public interface sh_profileEditReposi {
	public UserProfile mlist(String memEmail);
	public int changeProfile(UserProfile uf);
}
