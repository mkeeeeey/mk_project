package funfun.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funfun.repository.sh_profileEditReposi;
import funfun.vo.UserProfile;

@Service
public class sh_profileEditService {
	@Autowired(required=false)
	private sh_profileEditReposi dao;
	
	public UserProfile mlist(String memEmail){
		return dao.mlist(memEmail);
	}
	public int changeProfile(UserProfile uf){
		return dao.changeProfile(uf);
	}
}
