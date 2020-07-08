package funfun.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import funfun.vo.Admin;
import funfun.vo.Paging;

@Repository
public interface Sw_AdminDao {
	public int verifyAdmId(Admin admin);
	
	public int AdminCnt();
	public ArrayList<Admin> list(Paging sch);
	public void insert(Admin ins);
	
	
	public Admin detail(int admin_code);
	public void update(Admin upt);
	public void delete(int admin_code);
	
	
}
