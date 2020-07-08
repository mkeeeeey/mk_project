package funfun.repository;

import java.util.ArrayList;

import funfun.vo.*;

public interface KB_adminPrjReposi {
	public ArrayList<Project> projectList(Paging sch);
	
	public int proCnt();
	public Project proDetail(int pro_code);
	
	public void UptCurr(Project pro);
}
