package khj;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import cmk.Myorder;
import jhk.Comdetail;
import z01_vo.As;
import z01_vo.Computer;
import z01_vo.Member;
import z01_vo.Mgr;
import z01_vo.Notice;
import z01_vo.Parts;

public class A04_adminDao {
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

//	1) 연결 공통 메서드 선언	
	private void setConn() throws SQLException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String info = "jdbc:oracle:thin:@localhost:1521:xe";
		con = DriverManager.getConnection(info, "scott", "tiger");
		System.out.println("정상 접속 성공!");
	}
	
	public Member getMember(String mem_name){
		Member mem=null;
		try {
			setConn(); // Connection 객체가 메모리 로딩.
			String sql = "SELECT * \r\n" + 
					"FROM p5_member\r\n" + 
					"WHERE mem_name= ? ";
					System.out.println("##sql##");
					System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_name );
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				mem = new Member(rs.getString("mem_id"),
								   rs.getString("mem_pw"),
								   rs.getString("mem_name"),
								   rs.getDate("mem_birth"),
								   rs.getString("mem_email"),
								   rs.getString("mem_tel"),
								   rs.getDate("mem_jdate"));
			}
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return mem;
	}
	// 회원리시트
	public ArrayList<Member> mlist() {
		ArrayList<Member> mlist = new ArrayList<Member>();
		try {
			setConn();
			String sql = "SELECT * FROM p5_member\r\n" + 
					"WHERE NOT mem_id LIKE '%'||'guest0.'||'%'\r\n" + 
					"AND NOT mem_id = 'admin'\r\n" + 
					"ORDER BY mem_jdate desc";
			pstmt = con.prepareStatement(sql);
			System.out.println(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				mlist.add(new Member(
						   rs.getString("mem_id"),
						   rs.getString("mem_name"),
						   rs.getString("mem_email"),
						   rs.getString("mem_tel")));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mlist;
	}
	// 회원상세
	public Member mdetail(String mem_id) {
		Member mem = new Member();
		try {
			setConn();
			String sql = "SELECT mem_id, mem_name, mem_birth, mem_email, mem_tel, mem_jdate\r\n" + 
							"FROM p5_member\r\n" + 
							"WHERE mem_id = ?";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				mem = new Member(
							rs.getString("mem_id"), 
							rs.getString("mem_name"),
							rs.getDate("mem_birth"), 
							rs.getString("mem_email"),
							rs.getString("mem_tel"),
							rs.getDate("mem_jdate")
							);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mem;
	}
	// 회원삭제
	public void deleteMember(String mem_id) {
		try {
			setConn();
			String sql = "DELETE FROM p5_member\r\n" + 
						"WHERE mem_id= ?";
			System.out.println(sql);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
			
			System.out.println("수정성공");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
	}
	public ArrayList<Computer> getComList(String category){
		ArrayList<Computer> clist = new ArrayList<Computer>();
		try {
			setConn();
			String sql = "SELECT * FROM p5_computer\r\n" + 
					"WHERE NOT com_kind = '개인사양'\r\n" + 
					"AND NOT com_kind = '임시견적'\r\n"; 
					if(!category.equals("all")) sql+="AND com_kind = ? \r\n";
					sql+="ORDER BY com_no asc";
			
			System.out.println(sql);
			
			pstmt = con.prepareStatement(sql);
			if(!category.equals("all")) {
				pstmt.setString(1, category);
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				clist.add(new Computer(rs.getInt(1),
								    rs.getString(2),
								    rs.getString(3),
								    rs.getString(4),
								    rs.getString(5),
								    rs.getString(6),
								    rs.getInt(7)
						));
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return clist;
	}

	public ArrayList<Comdetail> getComDetailList(int com_no){
		ArrayList<Comdetail> cdlist = new ArrayList<Comdetail>();
		
		try {
			setConn();
			String sql = "SELECT pa.com_no, parts_name, parts_cnt, parts_mc, \r\n" + 
					"com_name, com_kind, com_img, com_detail, com_price \r\n" + 
					"FROM p5_assembly pa, p5_parts pp, p5_computer pc\r\n" + 
					"WHERE pa.parts_no = pp.parts_no\r\n" + 
					"AND pa.com_no = pc.com_no\r\n"; 
					if(com_no!=0) sql+="AND pa.com_no = ?\r\n"; 
					sql+="ORDER BY pp.parts_no asc";
			System.out.println(sql);
			
			pstmt = con.prepareStatement(sql);
			if(com_no!=0) {
				pstmt.setInt(1, com_no);
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				cdlist.add(new Comdetail(rs.getInt(1),
								    rs.getString(2),
								    rs.getInt(3),
								    rs.getString(4),
								    rs.getString(5),
								    rs.getString(6),
								    rs.getString(7),
								    rs.getString(8),
								    rs.getInt(9)
						));
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cdlist;
	}
	
	public Computer getComDetail(int com_no){
		Computer com = new Computer();
		
		try {
			setConn();
			String sql = "SELECT * FROM p5_computer\r\n" + 
					"WHERE com_no = ?\r\n" + 
					"ORDER BY com_no asc";
			System.out.println(sql);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, com_no);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				com = new Computer(rs.getInt(1),
							    rs.getString(2),
							    rs.getString(3),
							    rs.getString(4),
							    rs.getString(5),
							    rs.getString(6),
							    rs.getInt(7)
								);
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return com;
	}
	
	public ArrayList<Mgr> mgrList(){
		ArrayList<Mgr> mgrList = new ArrayList<Mgr>();
		try {
			setConn();
			// int mgr_no, int as_no, Date as_date, String as_cate,
			// String mem_id, Date mgr_date, String mgr_stat
			String sql = "SELECT a.MGR_NO, b.AS_NO, b.AS_DATE, b.AS_CATE, c.MEM_ID, a.MGR_DATE , a.MGR_STAT \r\n" + 
					"FROM P5_MGR a, P5_AS b, P5_ORDER c\r\n" + 
					"WHERE a.AS_NO = b.AS_NO \r\n" + 
					"AND b.ORD_NO = c.ORD_NO\r\n" + 
					"ORDER BY a.MGR_NO DESC";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				mgrList.add(new Mgr(rs.getInt(1),
									rs.getInt(2),
									rs.getDate(3),
									rs.getString(4),
									rs.getString(5),
									rs.getDate(6),
									rs.getString(7)));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		return mgrList;
	}
	
	public ArrayList<Parts> getPartsList(String category){
		ArrayList<Parts> plist = new ArrayList<Parts>();
		
		try {
			setConn();
			String sql = "SELECT * FROM p5_parts \r\n"; 
			if(!category.equals("all")) sql+="WHERE parts_mc=? \r\n";
				sql+="ORDER BY parts_no asc";
			System.out.println(sql);
			
			pstmt = con.prepareStatement(sql);
			if(!category.equals("all")) {
				pstmt.setString(1, category);
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				plist.add(new Parts(rs.getInt(1),
								    rs.getString(2),
								    rs.getInt(3),
								    rs.getInt(4),
								    rs.getString(5),
								    rs.getString(6),
								    rs.getString(7),
								    rs.getString(8),
								    rs.getString(9),
								    rs.getString(10),
								    rs.getString(11),
								    rs.getString(12),
								    rs.getString(13)
						));
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return plist;
	}
	
	public Parts getPartsDetail(int parts_no){
		Parts parts = new Parts();
		
		try {
			setConn();
			String sql = "SELECT * FROM p5_parts\r\n" + 
					"WHERE parts_no = ?\r\n" + 
					"ORDER BY parts_no asc";
			System.out.println(sql);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, parts_no);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				parts = new Parts(rs.getInt(1),
					    rs.getString(2),
					    rs.getInt(3),
					    rs.getInt(4),
					    rs.getString(5),
					    rs.getString(6),
					    rs.getString(7),
					    rs.getString(8),
					    rs.getString(9),
					    rs.getString(10),
					    rs.getString(11),
					    rs.getString(12),
					    rs.getString(13)
						);
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return parts;
	}


	public Mgr mgrDetail(int mgr_no){
		Mgr mgrDetail = new Mgr();
		try {
			setConn();
			// 관리번호mgr_no, 신청번호 as_no, 신청일as_date, 분류as_cate, 신청자mem_id, 입고일mgr_date, 진행사항mgr_stat
			// 주문번호ord_no, 구매날짜ord_date, 신청내용as_detail, 처리비용mgr_price, 비고mgr_note
			String sql = "SELECT a.MGR_NO, b.AS_NO, b.AS_DATE, b.AS_CATE, c.MEM_ID, a.MGR_DATE , a.MGR_STAT,\r\n" + 
					"		b.ORD_NO, c.ORD_DATE, b.AS_DETAIL, a.MGR_PRICE, a.MGR_NOTE\r\n" + 
					"FROM P5_MGR a, P5_AS b, P5_ORDER c\r\n" + 
					"WHERE a.AS_NO = b.AS_NO \r\n" + 
					"AND b.ORD_NO = c.ORD_NO\r\n" + 
					"AND a.MGR_NO = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mgr_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				mgrDetail = new Mgr(rs.getInt(1),rs.getInt(2),
									rs.getDate(3),rs.getString(4),
									rs.getString(5),rs.getDate(6),rs.getString(7),
									rs.getInt(8),rs.getDate(9),rs.getString(10),
									rs.getInt(11), rs.getString(12));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mgrDetail;
	}

	public ArrayList<Mgr> reqList(int mgr_no){
		ArrayList<Mgr> reqList = new ArrayList<Mgr>();
		try {
			setConn();
			String sql = "SELECT a.MGR_NO , c.REQ_NO, d.parts_img, d.parts_name, c.REQ_CNT\r\n" + 
					"FROM P5_MGR a, P5_AS b, P5_REQUEST c,\r\n" + 
					"(SELECT parts_no, parts_name, PARTS_IMG\r\n" + 
					"FROM P5_PARTS\r\n" + 
					"UNION\r\n" + 
					"SELECT COM_NO, COM_NAME,com_img FROM P5_COMPUTER) d\r\n" + 
					"WHERE a.AS_NO = b.AS_NO \r\n" + 
					"AND b.ORD_NO = c.ORD_NO\r\n" + 
					"AND c.REQ_NO = d.parts_no\r\n" + 
					"AND a.MGR_NO = ?\r\n" + 
					"ORDER BY req_no desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mgr_no);
			rs = pstmt.executeQuery();
			// mgr_no, req_no, parts_img, parts_name, req_cnt
			while(rs.next()) {
				reqList.add(new Mgr(rs.getInt(1),rs.getInt(2),
						rs.getString(3),rs.getString(4), rs.getInt(5) ));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return reqList;
	}

	public void uptMgr(Mgr upt) {
		try {
			setConn(); 
			String sql = "UPDATE P5_MGR \r\n" + 
					"SET MGR_STAT =?, \r\n" + 
					"	MGR_NOTE =?, \r\n" + 
					"	MGR_PRICE = ? \r\n" + 
					"WHERE MGR_NO = ?";
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, upt.getMgr_stat());
			pstmt.setString(2, upt.getMgr_note());
			pstmt.setInt(3, upt.getMgr_price());
			pstmt.setInt(4, upt.getMgr_no());
			// 실행
			pstmt.executeUpdate();
			con.commit();
			// 자원해제
			pstmt.close();
			con.close();
			System.out.println("as 수정!!");
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
			// 입력시, 문제 발생시, 이전 데이터 원복 처리.
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public ArrayList<Myorder> getOrders(){
		ArrayList<Myorder> orders = new ArrayList<Myorder>();
		try {
			setConn();
			String sql = "SELECT c.ord_no, sum(pr.req_cnt*a.parts_price) total, c.ORD_DATE, c.ord_stat, c.ORD_INVOICE \r\n" + 
					"FROM p5_request pr, \r\n" + 
					"	(SELECT parts_no, parts_img, parts_name, PARTS_PRICE FROM p5_parts\r\n" + 
					"	UNION SELECT com_no, com_img, com_name, com_price FROM p5_computer) a, P5_ORDER c\r\n" + 
					"WHERE pr.REQ_NO = a.parts_no AND c.ord_no = pr.ord_no \r\n" + 
					"GROUP BY c.ORD_NO, c.ORD_DATE, c.ORD_STAT, c.ORD_INVOICE \r\n" + 
					"ORDER BY ord_no DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				orders.add(new Myorder(rs.getInt(1),rs.getInt(2), rs.getDate(3),rs.getString(4),rs.getLong(5)));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return orders;
	}
	public ArrayList<Myorder> OrdersList(){
		ArrayList<Myorder> olists = new ArrayList<Myorder>();
		try {
			setConn();
			String sql = "SELECT pr.ord_no, a.parts_img, a.parts_name\r\n" + 
					"FROM p5_request pr, \r\n" + 
					"	(SELECT parts_no, parts_img, parts_name, PARTS_PRICE FROM p5_parts\r\n" + 
					"	UNION SELECT com_no, com_img, com_name, com_price FROM p5_computer) a\r\n" + 
					"WHERE pr.REQ_NO = a.parts_no\r\n" + 
					"ORDER BY ord_no DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				olists.add(new Myorder(rs.getInt(1),rs.getString(2),rs.getString(3)));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return olists;
	}
	
	public ArrayList<Myorder> getord(int ord_no){
		ArrayList<Myorder> getord = new ArrayList<Myorder>();
		try {
			setConn();
			String sql = "SELECT pr.ord_no, c.ord_date, f.MEM_NAME , c.ord_stat, a.parts_img, a.parts_name, a.parts_price, pr.req_cnt, (pr.req_cnt*a.parts_price) req, d.total, c.ORD_INVOICE,\r\n" + 
					" c.ORD_NAME, c.ORD_POST, c.ORD_ADDR1, c.ORD_ADDR2, c.ORD_TEL, c.ORD_REQ, e.PAY_METHOD,e.PAY_POINT ,e.PAY_PRICE \r\n" + 
					"FROM p5_request pr, \r\n" + 
					"	(SELECT parts_no, parts_img, parts_name, PARTS_PRICE FROM p5_parts\r\n" + 
					"	UNION SELECT com_no, com_img, com_name, com_price FROM p5_computer) a, P5_ORDER c,\r\n" + 
					"	(SELECT pr.ord_no, sum(pr.req_cnt*a.parts_price) total FROM p5_request pr, \r\n" + 
					"		(SELECT parts_no, parts_name, PARTS_PRICE FROM p5_parts\r\n" + 
					"		UNION\r\n" + 
					"		SELECT com_no, com_name, com_price FROM p5_computer) a\r\n" + 
					"	WHERE pr.REQ_NO = a.parts_no\r\n" + 
					"	GROUP BY ord_no\r\n" + 
					"	ORDER BY ord_no ASC) d, p5_pay e, p5_member f\r\n" + 
					"WHERE pr.REQ_NO = a.parts_no AND c.ord_no = pr.ord_no AND d.ord_no = pr.ord_no AND e.ORD_NO = pr.ORD_NO AND c.MEM_ID = f.MEM_ID " + 
					"AND pr.ord_no=? ";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ord_no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
			/*
			int 1, Date 2, String 3, String 4, String 5, String 6, int 7, int 8, int 9, int 10,
			int 11, String 12, String 13, String 14, String 15, String 16, String 17, String 18, int 19, int 20
			 */	
				getord.add(new Myorder(rs.getInt(1),rs.getDate(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getInt(8),
						rs.getInt(9), rs.getInt(10),rs.getLong(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15),
						rs.getString(16),rs.getString(17),rs.getString(18),rs.getInt(19),rs.getInt(20)));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return getord;
	}
	public void uptOrd(Myorder upt) {
		try {
			setConn(); 
			String sql = "UPDATE P5_ORDER \r\n" + 
					"SET ORD_INVOICE = ? , ord_stat='배송중'\r\n" + 
					"WHERE ORD_NO = ? ";
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, upt.getOrd_invoice());
			pstmt.setInt(2, upt.getOrd_no());
			// 실행
			pstmt.executeUpdate();
			con.commit();
			// 자원해제
			pstmt.close();
			con.close();
			System.out.println("수정!!");
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
			// 입력시, 문제 발생시, 이전 데이터 원복 처리.
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A04_adminDao dao = new A04_adminDao();
		
		System.out.println("데이터건수"+dao.mlist().size());
		
	}

}
