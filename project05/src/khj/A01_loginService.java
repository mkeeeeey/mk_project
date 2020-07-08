package khj;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import z01_vo.Member;
import z01_vo.Nk;

public class A01_loginService {
	private A01_loginDao dao;
	public A01_loginService() {
		super();
		// TODO Auto-generated constructor stub
		dao = new A01_loginDao();
	}
	// 로그인 했을 때, Member객체 return 처리하는 메서드 선언.
	public Member login(HttpServletRequest request) {
		String mem_id = request.getParameter("mem_id");
		if(mem_id==null) mem_id="";
		String mem_pw = request.getParameter("mem_pw");
		if(mem_pw==null) mem_pw="";
		return dao.login(new Member(mem_id,mem_pw));	
	}
	// 회원가입
	public void insMem(HttpServletRequest request) {
		String mem_id = Nk.toStr(request.getParameter("mem_id"));
		String mem_pw = Nk.toStr(request.getParameter("mem_pw"));
		String mem_name = Nk.toStr(request.getParameter("mem_name"));
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String birth = Nk.toStr(request.getParameter("mem_birth"));
		Date mem_birth = null;
		try {
			mem_birth = transFormat.parse(birth);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String mem_email= Nk.toStr(request.getParameter("mem_email"));
		String mem_tel= Nk.toStr(request.getParameter("mem_tel"));
		
		Member ins = new Member(mem_id, mem_pw, mem_name, mem_birth, mem_email, mem_tel);
				
		dao.insSignUpMember(ins);
	}
	// 아이디 찾기
	// db에 일치하는 이름과 메일이 있는지 확인하고 id를 return받아야하는데
	// Dao에 있는 부분이 위내용이고 service단에서는 retrun받을 코드만 적으면 되는지?>
	public String findID(HttpServletRequest request) {
		String mem_name= Nk.toStr(request.getParameter("mem_name"));
		String mem_email= Nk.toStr(request.getParameter("mem_email"));
		return dao.findId(mem_name, mem_email);
	}
	
	public String findPW(HttpServletRequest request) {
		String mem_id = Nk.toStr(request.getParameter("mem_id"));
		String mem_email = Nk.toStr(request.getParameter("mem_email"));
		return dao.findPw(mem_id, mem_email);
	}
	// 회원가입 아이디 중복확인
	public boolean checkReg(HttpServletRequest request){
		String mem_id = Nk.toStr(request.getParameter("mem_id"));
		return dao.memberCk(mem_id);
	}

}
