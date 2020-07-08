package cmk;

import java.sql.*;


import z01_vo.Cart;
import z01_vo.Order;
import z01_vo.Pay;
import z01_vo.Point;
import z01_vo.Request;

public class PayDao {
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
	
	public Cart getCart(int req_no, int req_cnt) {
		Cart cart = new Cart();
		try {
			setCon();
			String sql = "SELECT parts_no, parts_img, parts_name, parts_price \r\n" + 
					"FROM (SELECT parts_no, parts_img, parts_name, PARTS_PRICE FROM p5_parts\r\n" + 
					"	UNION SELECT com_no, com_img, com_name, com_price FROM p5_computer) \r\n" + 
					"WHERE parts_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, req_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cart = new Cart(rs.getInt(1),rs.getString(2),rs.getString(3), req_cnt ,rs.getInt(4));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cart;
	}
	
	// 주문하기
	public void insertOrder(Order ins) {
		try {
			setCon();
			String sql = "INSERT INTO p5_order VALUES (to_number(to_char(sysdate,'yymmdd'))||p5_order_seq.nextval,?, sysdate,?,?,?,?,?,?,'결제완료','')";
			System.out.println(sql);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getMem_id());
			pstmt.setString(2, ins.getOrd_name());
			pstmt.setString(3, ins.getOrd_tel());
			pstmt.setString(4, ins.getOrd_post());
			pstmt.setString(5, ins.getOrd_addr1());
			pstmt.setString(6, ins.getOrd_addr2());
			pstmt.setString(7, ins.getOrd_req());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
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
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	public int getOrdno(String mem_id) {
		int no = 0;
		try {
			setCon();
			String sql = "SELECT max(ord_no) FROM p5_order\r\n" + 
					"WHERE MEM_ID = ?";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				no = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return no;
	}
	// 주문번호에 상품담기
	public void insertRequest(Request ins) {
		try {
			setCon();
			String sql = "INSERT INTO p5_request VALUES (?, ?, ?,0)";
			System.out.println(sql);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ins.getOrd_no());
			pstmt.setInt(2, ins.getReq_no());
			pstmt.setInt(3, ins.getReq_cnt());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	// 사용가능 포인트 조회
	public int getPoint(String mem_id) {
		int pt = 0;
		try {
			setCon();
			String sql = "SELECT sum(point_pt) FROM P5_POINT\r\n" + 
					"WHERE mem_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				pt = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return pt;
	}
	// 결제정보
	public void insertPay(Pay ins) {
		try {
			setCon();
			String sql = "INSERT INTO p5_pay VALUES (p5_pay_seq.nextval,?,?,?,?)";
			System.out.println(sql);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ins.getOrd_no());
			pstmt.setString(2, ins.getPay_method());
			pstmt.setInt(3, ins.getPay_point());
			pstmt.setInt(4, ins.getPay_price());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	// 사용포인트 정보, 최종결제금액 정보
	public Pay getPay() {
		Pay payinfo = new Pay();
		try {
			setCon();
			String sql = "SELECT b.lastpay, a.pay_point, a.pay_price \r\n" + 
					"FROM P5_PAY a, (SELECT max(pay_no) lastpay FROM p5_pay) b\r\n" + 
					"WHERE a.PAY_NO = lastpay";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return payinfo;
	}
	
	// 포인트 적립 및 사용
	public void insPoint(Point ins) {
		try {
			setCon();
			String sql="INSERT INTO P5_POINT VALUES (p5_point_seq.nextval, ?, sysdate, ?, ?)";
			System.out.println(sql);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getMem_id());
			pstmt.setString(2, ins.getPoint_detail());
			pstmt.setInt(3, ins.getPoint_pt());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	// 재고 관리
	public void uptPartsCnt(int req_no, int req_cnt){
		try {
			setCon();
			String sql = "UPDATE P5_PARTS\r\n" + 
					"SET PARTS_STOCK = PARTS_STOCK - ?\r\n" + 
					"WHERE PARTS_NO = ?";
			System.out.println(sql);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, req_cnt);
			pstmt.setInt(2, req_no);
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
			System.out.println("재고수량 수정성공!");
			
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
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	
	}


	public Order getAddr(String mem_id) {
		Order addr = new Order();
		try {
			setCon();
			String sql = "SELECT ORD_NAME,ORD_TEL,ORD_POST,ORD_ADDR1 ,ORD_ADDR2 FROM P5_ORDER\r\n" + 
					"WHERE mem_id = ?\r\n" + 
					"ORDER BY ord_no DESC";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				addr = new Order(rs.getString(1),rs.getString(2),
								 rs.getString(3),rs.getString(4),rs.getString(5));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return addr;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
