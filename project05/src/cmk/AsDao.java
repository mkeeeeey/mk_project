package cmk;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import z01_vo.As;
import z01_vo.Order;

public class AsDao {
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
	
	public ArrayList<As> asList(){
		ArrayList<As> asList = new ArrayList<As>();
		try {
			setCon();
			String sql = "SELECT as_no, as_cate, mem_id, as_date\r\n" + 
					"FROM p5_as a, P5_ORDER b \r\n" + 
					"WHERE a.ORD_NO = b.ORD_NO\r\n" + 
					"ORDER BY as_no DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				asList.add(new As(rs.getInt("as_no"),rs.getString("as_cate"),rs.getDate("as_date"),rs.getString("mem_id")));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return asList;
	}
	
	public As asList(int as_no){
		As asList = new As();
		try {
			setCon();
			String sql = "SELECT as_no, as_cate, as_detail, as_date, mem_id, as_comm, as_comdate\r\n" + 
					"FROM P5_AS a, P5_ORDER b \r\n" + 
					"WHERE a.ORD_NO = b.ORD_NO\r\n" + 
					"AND a.as_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, as_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//as_no, as_cate, as_detail, as_date, mem_id, as_comm, as_comdate
				asList = new As(rs.getInt("as_no"),rs.getString("as_cate"),
						rs.getString("as_detail"),rs.getDate("as_date"),
						rs.getString("mem_id"), rs.getString("as_comm"), rs.getDate("as_comdate"));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return asList;
	}

	public ArrayList<Myorder> getOrder(){
		ArrayList<Myorder> order = new ArrayList<Myorder>();
		try {
			setCon();
			String sql = "SELECT pr.ord_no, a.parts_img, a.parts_name, pr.req_cnt, (pr.req_cnt*a.parts_price) req, c.ord_date\r\n" + 
					"FROM p5_request pr, \r\n" + 
					"	(SELECT parts_no, parts_img, parts_name, PARTS_PRICE FROM p5_parts\r\n" + 
					"	UNION SELECT com_no, com_img, com_name, com_price FROM p5_computer) a, P5_ORDER c\r\n" + 
					"WHERE pr.REQ_NO = a.parts_no AND c.ord_no = pr.ord_no  \r\n" + 
					"AND c.mem_id='ezen01'\r\n" + 
					"ORDER BY ord_no ASC";
			pstmt = con.prepareStatement(sql);
			//pstmt.setString(1, "ezen01");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				order.add(new Myorder(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4), rs.getInt(5),rs.getDate(6)));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return order;
	}
	
	public void applyAs(As ins) {
		try {
			setCon();
			String sql = "INSERT INTO p5_as VALUES (p5_as_seq.nextval, ?,?,?,sysdate,null,null)";
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ins.getOrd_no());
			pstmt.setString(2, ins.getAs_cate());
			pstmt.setString(3, ins.getAs_detail());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
			System.out.println("등록성공");
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
	
	public ArrayList<As> getAs(int as_no) {
		ArrayList<As> asdetail = new ArrayList<As>();
		try {
			setCon();
			String sql = "SELECT pr.ord_no, d.as_cate, d.as_detail, d.as_date, c.mem_id, d.as_comm,\r\n" + 
					"		d.as_comdate, a.parts_img, a.parts_name, pr.req_cnt, a.parts_price*pr.req_cnt, c.ord_date\r\n" + 
					"FROM P5_AS d, p5_request pr,  \r\n" + 
					"	(SELECT parts_no, parts_img, parts_name, PARTS_PRICE FROM p5_parts \r\n" + 
					"	UNION SELECT com_no, com_img, com_name, com_price FROM p5_computer) a, P5_ORDER c \r\n" + 
					"WHERE pr.REQ_NO = a.parts_no AND c.ord_no = pr.ord_no   \r\n" + 
					"AND d.ORD_NO = c.ORD_NO \r\n" + 
					"AND as_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, as_no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				asdetail.add(new As(rs.getInt(1),rs.getString(2),rs.getString(3),
						rs.getDate(4),rs.getString(5),rs.getString(6),
						rs.getDate(7),rs.getString(8),rs.getString(9),
						rs.getInt(10),rs.getInt(11),rs.getDate(12)));
			}
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return asdetail;
	}

	public void delAs(int as_no) {
		try {
			setCon(); 
			String sql = "DELETE P5_AS\r\n" + 
					"WHERE AS_NO =?";
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, as_no);
			// 실행
			pstmt.executeUpdate();
			con.commit();
			// 자원해제
			pstmt.close();
			con.close();
			System.out.println("as 삭제!!");
	
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

	public void insAs(As ins) {
		try {
			setCon(); 
			String sql = "INSERT INTO P5_AS\r\n" + 
					"VALUES(p5_as_seq.nextval, ?, ?,?,sysdate,NULL,null)";
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ins.getOrd_no());
			pstmt.setString(2, ins.getAs_cate());
			pstmt.setString(3, ins.getAs_detail());
			// 실행
			pstmt.executeUpdate();
			con.commit();
			// 자원해제
			pstmt.close();
			con.close();
			System.out.println("as 등록!!");
	
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

	public void uptAs(As upt) {
		try {
			setCon(); 
			String sql = "UPDATE P5_AS"
					+ "SET as_cate = ?,"
					+ "as_detail = ?,"
					+ "as_date = sysdate"
					+ "WHERE as_no = ?";
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, upt.getAs_cate());
			pstmt.setString(2, upt.getAs_detail());
			pstmt.setInt(3, upt.getAs_no());
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

	public void delComm(int as_no) {
		try {
			setCon(); 
			String sql = "UPDATE P5_AS\r\n" + 
					"SET AS_COMM = NULL\r\n" + 
					"WHERE AS_NO =?";
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, as_no);
			// 실행
			pstmt.executeUpdate();
			con.commit();
			// 자원해제
			pstmt.close();
			con.close();
			System.out.println("as_comm 삭제!!");
	
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

	public void insAns(int as_no, String as_comm) {
		try {
			setCon(); 
			String sql = "UPDATE P5_AS\r\n" + 
					"SET AS_COMM = ?,\r\n" + 
					"	AS_COMDATE = SYSDATE \r\n" + 
					"WHERE AS_NO =?";
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, as_comm);
			pstmt.setInt(2, as_no);
			// 실행
			pstmt.executeUpdate();
			con.commit();
			// 자원해제
			pstmt.close();
			con.close();
			System.out.println("as_comm 등록!!");
	
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

	public ArrayList<Order> ordList(String mem_id) {
		ArrayList<Order> ordList = new ArrayList<Order>();
		try {
			setCon();
			String sql = "select ord_no from p5_order where mem_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ordList.add(new Order(rs.getInt(1)));
			}
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ordList;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		AsDao dao = new AsDao();

	}

}