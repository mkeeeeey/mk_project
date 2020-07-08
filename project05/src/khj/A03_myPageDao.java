package khj;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import cmk.Myorder;
import z01_vo.Member;
import z01_vo.Point;

public class A03_myPageDao {

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
	
	
	
	// 회원정보 불러오기
	public Member getMember(String mem_id) {
		Member mem = new Member();
		try {
			setConn();
			String sql = "SELECT * FROM p5_member WHERE mem_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mem= new Member(rs.getString("mem_id"),
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
		}
		return mem;
	}
	
	
	// 비밀번호 업데이트
	public void uptPw(Member upt) {
		try {
			setConn(); // Connection 객체가 메모리 로딩.
			String sql = "UPDATE P5_MEMBER \r\n" + 
						"SET mem_pw = ?\r\n" + 
						"WHERE mem_id= ?";
			System.out.println(sql);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, upt.getMem_pw());
			pstmt.setString(2, upt.getMem_id());
			// 실행
			pstmt.executeUpdate();
			con.commit();
			// 자원해제
			pstmt.close();
			con.close();
			System.out.println("수정 성공!!");
	
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
	
	
	// 회원정보 삭제
	public void deleteMember(Member del) {
		try {
			setConn(); // Connection 객체가 메모리 로딩.
			String sql = "DELETE FROM p5_member \r\n" + 
							"WHERE mem_id = ? \r\n" + 
							"AND mem_pw = ?";
			System.out.println(sql);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, del.getMem_id());
			pstmt.setString(2, del.getMem_pw());
			// 실행
			pstmt.executeUpdate();
			con.commit();
			// 자원해제
			pstmt.close();
			con.close();
			System.out.println("삭제 성공!!");
	
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
	
	public ArrayList<Point> ptList(String mem_id){
		ArrayList<Point> ptList = new ArrayList<Point>();
		try {
			setConn();
			String sql = "SELECT point_date, point_detail, point_pt\r\n" + 
					"FROM p5_point\r\n" + 
					"WHERE mem_id = ? \r\n" + 
					"ORDER BY point_no DESC";
			System.out.println(sql);
			System.out.println(mem_id);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ptList.add(new Point(rs.getDate("point_date"),rs.getString("point_detail"),rs.getInt("point_pt")));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ptList;
	}
	
	public ArrayList<Myorder> getolist(String mem_id){
		ArrayList<Myorder> olist = new ArrayList<Myorder>();
		try {
			setConn();
			String sql = "SELECT pr.ord_no, a.parts_img, a.parts_name, pr.req_cnt, (pr.req_cnt*a.parts_price) req\r\n" + 
					"FROM p5_request pr, \r\n" + 
					"	(SELECT parts_no, parts_img, parts_name, PARTS_PRICE FROM p5_parts\r\n" + 
					"	UNION SELECT com_no, com_img, com_name, com_price FROM p5_computer) a, P5_ORDER c\r\n" + 
					"WHERE pr.REQ_NO = a.parts_no AND c.ord_no = pr.ord_no\r\n" + 
					"AND c.mem_id=? \r\n" + 
					"ORDER BY ord_no DESC";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				olist.add(new Myorder(rs.getInt(1),rs.getString(2), rs.getString(3),rs.getInt(4),rs.getInt(5)));
			}
			System.out.println("dao단 확인");
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return olist;
	}
	public ArrayList<Myorder> olist(String mem_id){
		ArrayList<Myorder> olist = new ArrayList<Myorder>();
		try {
			setConn();
			String sql = "SELECT c.ord_no, sum(pr.req_cnt*a.parts_price) total, c.ORD_DATE, c.ord_stat\r\n" + 
					"FROM p5_request pr, \r\n" + 
					"	(SELECT parts_no, parts_img, parts_name, PARTS_PRICE FROM p5_parts\r\n" + 
					"	UNION SELECT com_no, com_img, com_name, com_price FROM p5_computer) a, P5_ORDER c\r\n" + 
					"WHERE pr.REQ_NO = a.parts_no AND c.ord_no = pr.ord_no \r\n" + 
					"AND c.mem_id=? \r\n" + 
					"GROUP BY c.ORD_NO, c.ORD_DATE, c.ORD_STAT \r\n" + 
					"ORDER BY ord_no DESC";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				olist.add(new Myorder(rs.getInt(1),rs.getInt(2), rs.getDate(3),rs.getString(4)));
			}
			System.out.println("dao단 확인");
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return olist;
	}
	
	
	
	public ArrayList<Myorder> myolist(String mem_id, int ord_no){
		ArrayList<Myorder> myolist = new ArrayList<Myorder>();
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
					"AND c.mem_id=? AND pr.ord_no=? ";
			System.out.println(sql);
			
			pstmt = con.prepareStatement(sql);
			System.out.println("1");
			pstmt.setString(1, mem_id);
			System.out.println("2");
			pstmt.setInt(2, ord_no);
			System.out.println("3");
			
			rs = pstmt.executeQuery();
			System.out.println("4");
			while(rs.next()) {
			/*
			int 1, Date 2, String 3, String 4, String 5, String 6, int 7, int 8, int 9, int 10,
			int 11, String 12, String 13, String 14, String 15, String 16, String 17, String 18, int 19, int 20
			 */	
				myolist.add(new Myorder(rs.getInt(1),rs.getDate(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getInt(8),
						rs.getInt(9), rs.getInt(10),rs.getLong(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15),
						rs.getString(16),rs.getString(17),rs.getString(18),rs.getInt(19),rs.getInt(20)));
				System.out.println("5");
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return myolist;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
