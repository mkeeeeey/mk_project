package funfun.repository;

import java.util.ArrayList;

import funfun.vo.*;
public interface KB_RSOptionRep {
	public ArrayList<storeOption> stoOptList(int sto_code);
	
	public storeOption stoOpt(int sto_opt_code);
	
	public String opt_title(int sto_opt_code);

	public int mem_balance(int mem_code);
}
