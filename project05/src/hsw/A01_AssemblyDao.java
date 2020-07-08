package hsw;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import z01_vo.Assembly;
import z01_vo.Assque;
import z01_vo.Parts;

public class A01_AssemblyDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private void setcon() throws SQLException {
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
	
	
	public ArrayList<Parts> pList(){
		ArrayList<Parts> pList = new ArrayList<Parts>();
		
		try {
			setcon();
			String sql = "SELECT parts_no, parts_name, parts_price, parts_img FROM p5_parts\r\n" + 
					"WHERE parts_mc = 'CPU'";
			
			pstmt = con.prepareStatement(sql);
						
			rs = pstmt.executeQuery();
			while(rs.next()) {
				pList.add(new Parts(rs.getInt(1),
								    rs.getString(2),
								    rs.getInt(3),
								    rs.getString(4)
						));
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pList;
	}
	
	
	// proc sch => 검색화면
	public ArrayList<Parts> pList(Parts sch){
		ArrayList<Parts> pList = new ArrayList<Parts>();
		
		try {
			setcon();
			String sql = "SELECT parts_no, parts_name, parts_price, parts_img FROM p5_parts\r\n" + 
					"WHERE parts_mc = ?\r\n" + 
					"AND parts_sc1 LIKE '%'||?||'%'\r\n" + 
					"AND parts_sc2 LIKE '%'||?||'%'\r\n" + 
					"AND parts_sc3 LIKE '%'||?||'%'\r\n" + 
					"AND parts_sc4 LIKE '%'||?||'%'\r\n" + 
					"AND parts_sc5 LIKE '%'||?||'%'\r\n" + 
					"AND parts_sc6 LIKE '%'||?||'%'";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sch.getParts_mc());
			pstmt.setString(2, sch.getParts_sc1());
			pstmt.setString(3, sch.getParts_sc2());
			pstmt.setString(4, sch.getParts_sc3());
			pstmt.setString(5, sch.getParts_sc4());
			pstmt.setString(6, sch.getParts_sc5());
			pstmt.setString(7, sch.getParts_sc6());
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				pList.add(new Parts(rs.getInt(1),
								    rs.getString(2),
								    rs.getInt(3),
								    rs.getString(4)));
				
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pList;
	}


	// proc ins => 견적 테이블에 추가(기본1개)
	public void insertCart(Assembly ins) {
		try {
			setcon(); // Connection 객체가 메모리 로딩.
			String sql = "insert into p5_assembly values (?,?,1)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ins.getCom_no());
			pstmt.setInt(2, ins.getParts_no());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
			System.out.println("견적테이블에 추가(기본1개) 성공!!");
	
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
	
	
	// proc ins => 데이터 존재 유무
	public boolean cList(Assembly ins){
		boolean isItem = false;
		
		try {
			setcon();
			String sql = "SELECT * FROM P5_ASSEMBLY\r\n" + 
					"WHERE parts_no = ?\r\n" + 
					"AND com_no = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ins.getParts_no() );
			pstmt.setInt(2, ins.getCom_no());
			
			rs = pstmt.executeQuery();
			
			isItem = rs.next();
			System.out.println("ins 데이터 유무: "+isItem);
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isItem;
	}


	public ArrayList<Parts> cartList(int com_no){
		ArrayList<Parts> cartList = new ArrayList<Parts>();
		
		try {
			setcon();
			String sql = "SELECT b.COM_NO, a.PARTS_NO ,a.PARTS_NAME ,a.PARTS_PRICE, b.PARTS_CNT, a.PARTS_MC \r\n" + 
					"FROM p5_parts a, P5_ASSEMBLY b\r\n" + 
					"WHERE b.COM_NO = ?\r\n" + 
					"AND b.PARTS_NO = a.PARTS_NO";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, com_no);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				cartList.add(new Parts(rs.getInt(1),
								    rs.getInt(2),
								    rs.getString(3),
								    rs.getInt(4),
								    rs.getInt(5),
								    rs.getString(6)
						));
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cartList;
	}


	// proc del => 카트에서 제거
	public void deleteCart(int com_no, int parts_no) {
		try {
			setcon(); // Connection 객체가 메모리 로딩.
			String sql = "DELETE p5_assembly \r\n" + 
					"WHERE com_no = ?\r\n" + 
					"AND parts_no = ?";
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, com_no);
			pstmt.setInt(2, parts_no);
			
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
			System.out.println("카트에서 삭제 성공!!");
	
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
	// proc delAll => 카트에서 모두제거
	public void deleteAllCart(int com_no) {
		try {
			setcon(); // Connection 객체가 메모리 로딩.
			String sql = "DELETE p5_assembly WHERE com_no = ?";
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, com_no);
			
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
			System.out.println("카트에서 모두 삭제!!");
	
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
	// proc reg => 견적목록에 추가
	public void regEstimate(Assque reg) {
		try {
			setcon(); // Connection 객체가 메모리 로딩.
			String sql = "INSERT INTO P5_ASSQUE values(p5_assque_seq.nextval, ?, ?, ?, sysdate,'','')";
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, reg.getCom_no());
			pstmt.setString(2, reg.getAsq_name());
			pstmt.setString(3, reg.getAsq_detail());
			
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
			System.out.println("견적목록 추가!!");
	
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


	// proc ins => 테이블에 부품 추가
	public void insertCart(Parts ins) {
		try {
			setcon(); // Connection 객체가 메모리 로딩.
			String sql = "INSERT INTO p5_assembly values(?,?,?)";
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ins.getParts_com());
			pstmt.setInt(2, ins.getParts_no());
			pstmt.setInt(3, ins.getParts_cnt());
			
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
			System.out.println("견적에 데이터 추가!!");
	
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


	// proc first => 비회원member만들기
	public void regMem(String mem) {
		try {
			setcon(); // Connection 객체가 메모리 로딩.
			String sql = "INSERT INTO p5_member VALUES (?,'admin',' ',to_date('1990-01-01','YYYY-MM-DD'),' ',' ',to_date('2020-01-01','YYYY-MM-DD'))";
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem);
			
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
			System.out.println("비회원 임시id!!");
	
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


	// proc first => 비회원 견적용 computer만들기
	public void regCom(String mem) {
		try {
			setcon(); // Connection 객체가 메모리 로딩.
			String sql = "INSERT INTO p5_computer VALUES (p5_computer_seq.nextval, ?,'guest님의 컴퓨터','임시견적','PCCAT-USER01.jpg','',1000000)";
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem);
			
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
			System.out.println("임시견적 컴퓨터 추가!!");
	
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


	// proc first => 회원 견적용 computer 여부 확인
	public boolean ckCom(int com_no) {
		boolean ckCom = false;
		try {
			setcon(); // Connection 객체가 메모리 로딩.
			String sql = "SELECT com_kind FROM P5_COMPUTER WHERE com_no = ? AND com_kind = '임시견적'";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, com_no);
			rs = pstmt.executeQuery();
			ckCom = rs.next();
			
			rs.close();
			pstmt.close();
			con.close();
			System.out.println("검색 성공!!");
	
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
		return ckCom;
	}


	// proc first => 비회원 견적용 computer 번호 가져오기
	public int comNo(String mem){
		int com_no = 0;
		try {
			setcon();
			String sql = "SELECT max(com_no) FROM P5_COMPUTER  WHERE mem_id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				com_no = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return com_no;
	}


	public void updateCart(Assembly upt) {
		try {
			setcon(); // Connection 객체가 메모리 로딩.
			String sql = "UPDATE P5_ASSEMBLY\r\n" + 
					"SET PARTS_CNT = PARTS_CNT+1\r\n" + 
					"WHERE COM_NO=?\r\n" + 
					"AND PARTS_NO = ?";
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, upt.getCom_no());
			pstmt.setInt(2, upt.getParts_no());
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


	public ArrayList<Assque> asqList(){
		ArrayList<Assque> asqList = new ArrayList<Assque>();
		
		try {
			setcon();
			String sql = "SELECT a.ASQ_NO, a.ASQ_NAME ,c.MEM_ID ,a.ASQ_REQDATE\r\n" + 
					"FROM P5_ASSQUE a, P5_COMPUTER b, P5_MEMBER c\r\n" + 
					"WHERE a.COM_NO = b.COM_NO \r\n" + 
					"AND b.MEM_ID = c.MEM_ID\r\n" + 
					"ORDER BY a.ASQ_NO desc";
			
			pstmt = con.prepareStatement(sql);
						
			rs = pstmt.executeQuery();
			while(rs.next()) {
				asqList.add(new Assque(rs.getInt(1),
									   rs.getString(2),
									   rs.getString(3),
									   rs.getDate(4)));
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return asqList;
	}


	public Assque asqSch(int asq_no){
		Assque asq = new Assque();
		
		try {
			setcon();
			String sql = "SELECT a.ASQ_NO, a.ASQ_NAME ,a.ASQ_DETAIL ,a.ASQ_REQDATE, a.ASQ_COMM ,a.ASQ_COMDATE, c.MEM_ID  \r\n" + 
					"FROM P5_ASSQUE a, P5_COMPUTER b, P5_MEMBER c\r\n" + 
					"WHERE a.COM_NO = b.COM_NO\r\n" + 
					"AND b.MEM_ID = c.MEM_ID  \r\n" + 
					"AND a.ASQ_NO = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, asq_no);			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				asq = new Assque(rs.getInt(1),
							     rs.getString(2),
							     rs.getString(3),
							     rs.getDate(4),
							     rs.getString(5),
							     rs.getDate(6),
							     rs.getString(7) );
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return asq;
	}


	public ArrayList<Parts> assList(int asq_no){
		ArrayList<Parts> assList = new ArrayList<Parts>();
		
		try {
			setcon();
			String sql = "SELECT a.COM_NO, b.PARTS_NO, b.PARTS_NAME, (b.PARTS_PRICE*a.PARTS_CNT), a.PARTS_CNT, b.PARTS_MC \r\n" + 
					"FROM P5_ASSEMBLY a, P5_PARTS b, P5_ASSQUE c\r\n" + 
					"WHERE a.PARTS_NO = b.PARTS_NO \r\n" + 
					"AND a.COM_NO = c.COM_NO \r\n" + 
					"AND c.ASQ_NO = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, asq_no);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				assList.add(new Parts(rs.getInt(1),
								    rs.getInt(2),
								    rs.getString(3),
								    rs.getInt(4),
								    rs.getInt(5),
								    rs.getString(6)
						));
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return assList;
	}


	public void updateCom(int com_no, int tot) {
		try {
			setcon(); // Connection 객체가 메모리 로딩.
			String sql = "UPDATE P5_COMPUTER\r\n" + 
					"SET COM_KIND = '개인사양',\r\n" + 
					"    COM_PRICE = ?\r\n" + 
					"WHERE COM_NO = ?";
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tot);
			pstmt.setInt(2, com_no);
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


	public void updateAsqcomm(Assque upt) {
		try {
			setcon(); // Connection 객체가 메모리 로딩.
			String sql = "UPDATE P5_ASSQUE\r\n" + 
					"SET ASQ_COMM = ?,\r\n" + 
					"	ASQ_COMDATE = SYSDATE\r\n" + 
					"WHERE ASQ_NO = ?";
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,upt.getAsq_comm() );
			pstmt.setInt(2, upt.getAsq_no());
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


	// 견적낸 부품의 총가격
	public int getTot(int com_no){
		int tot = 0;
		try {
			setcon();
			String sql = "SELECT sum(b.PARTS_PRICE )\r\n" + 
					"FROM P5_ASSEMBLY a, P5_PARTS b\r\n" + 
					"WHERE a.PARTS_NO = b.PARTS_NO\r\n" + 
					"AND a.COM_NO = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, com_no);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				tot = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tot;
	}	
		
	
	
	
	 
}
