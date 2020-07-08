package funfun.repository;

import funfun.vo.storePay;

public interface KB_RSPayReposi {
	public void payInsert(storePay pay);
	public void UptMemBalance(storePay pay);
	public int payCode(int mem_code);
	public void InsertBalance(storePay pay);
}
