package cmk;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

import z01_vo.Point;

public class PointDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private void setCon() throws SQLException {
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
	
	public ArrayList<Point> ptList(String mem_id){
		ArrayList<Point> ptList = new ArrayList<Point>();
		try {
			setCon();
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
			setCon();
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
			setCon();
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
			setCon();
			String sql = "SELECT pr.ord_no, c.ord_date, c.MEM_ID, c.ord_stat, a.parts_img, a.parts_name, a.parts_price, pr.req_cnt, (pr.req_cnt*a.parts_price) req, d.total, c.ORD_INVOICE,\r\n" + 
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
					"	ORDER BY ord_no ASC) d, p5_pay e\r\n" + 
					"WHERE pr.REQ_NO = a.parts_no AND c.ord_no = pr.ord_no AND d.ord_no = pr.ord_no AND e.ORD_NO = pr.ORD_NO \r\n" + 
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
				myolist.add(new Myorder(rs.getInt(1),rs.getDate(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getInt(8),rs.getInt(9),rs.getInt(10),
						rs.getInt(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15),rs.getString(16),rs.getString(17),rs.getString(18),rs.getInt(19),rs.getInt(20)));
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
		PointDao dao = new PointDao();
	}

}
