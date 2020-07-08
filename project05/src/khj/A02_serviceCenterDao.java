package khj;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cmk.Myorder;
import z01_vo.As;
import z01_vo.Notice;
import z01_vo.Order;
import z01_vo.Quecomm;
import z01_vo.Question;
import z01_vo.Revcomm;
import z01_vo.Review;

public class A02_serviceCenterDao {
//	0) 전역 field 객체 선언
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

//	1) 연결 공통 메서드 선언	
	private void setConnn() throws SQLException {
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
	// 공지리스트 불러오기
	public ArrayList<Notice> nlist() {
		ArrayList<Notice> nlist = new ArrayList<Notice>();
		try {
			setConnn();
			String sql = "SELECT * FROM p5_notice\r\n" + 
							"ORDER BY noti_no desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				nlist.add(new Notice(
							rs.getInt("noti_no"), 
							rs.getString("noti_name"),
							rs.getString("noti_detail"), 
							rs.getDate("noti_date") ));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nlist;
	}
	
	public Notice ndetail(int noti_no) {
		Notice noti = new Notice();
		try {
			setConnn();
			String sql = "SELECT noti_no, noti_name,\r\n" + 
					"REPLACE(noti_detail,'\\n', '<br>') noti_detail, noti_date\r\n" + 
					"FROM p5_notice\r\n" + 
					"WHERE noti_no = ?";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, noti_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				noti = new Notice(
							rs.getInt("noti_no"), 
							rs.getString("noti_name"),
							rs.getString("noti_detail"), 
							rs.getDate("noti_date"));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return noti;
	}
	public void insertNotice(Notice noti) {
		try {
			setConnn();
			String sql = "INSERT INTO p5_notice VALUES (p5_notice_seq.nextval,?,?,sysdate)";
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, noti.getNoti_name());
			pstmt.setString(2, noti.getNoti_detail());
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
	
	public void updateNotice(Notice noti) {
		try {
			setConnn();
			String sql = "UPDATE p5_notice\r\n" + 
					"SET noti_name = ?,\r\n" + 
					"	noti_detail = ?\r\n" + 
					"WHERE noti_no = ?";
			System.out.println(sql);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, noti.getNoti_name());
			pstmt.setString(2, noti.getNoti_detail());
			pstmt.setInt(3, noti.getNoti_no());
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
	
	public void deleteNotice(int noti_no) {
		try {
			setConnn();
			String sql = "DELETE FROM p5_notice\r\n" + 
					"WHERE noti_no= ?";
			System.out.println(sql);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, noti_no);
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
	
	// 공지리스트 불러오기
	public ArrayList<Question> qlist() {
		ArrayList<Question> qlist = new ArrayList<Question>();
		try {
			setConnn();
			String sql = "SELECT * FROM p5_question\r\n" + 
							"ORDER BY que_no desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				qlist.add(new Question(
							rs.getInt("que_no"), 
							rs.getString("mem_id"),
							rs.getString("que_name"), 
							rs.getString("que_detail"), 
							rs.getDate("que_date")
						));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return qlist;
	}
	
	public Question qdetail(int que_no) {
		Question que = new Question();
		try {
			setConnn();
			String sql = "SELECT que_no, mem_id, que_name,\r\n" + 
					"REPLACE(que_detail,'\\n', '<br>') que_detail, que_date\r\n" + 
					"FROM p5_question\r\n" + 
					"WHERE que_no = ?";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, que_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				que = new Question(
							rs.getInt("que_no"), 
							rs.getString("mem_id"),
							rs.getString("que_name"),
							rs.getString("que_detail"), 
							rs.getDate("que_date"));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return que;
	}
	
	// 문의댓글리스트 불러오기
	public ArrayList<Quecomm> qclist(int que_no) {
		ArrayList<Quecomm> qclist = new ArrayList<Quecomm>();
		try {
			setConnn();
			String sql = "SELECT quec_no, que_no, mem_id,\r\n" + 
					"REPLACE(quec_detail,'\\n', '<br>') quec_detail, quec_date\r\n" + 
					"FROM p5_quecomm\r\n" + 
					"WHERE que_no = ?" + 
					"ORDER BY quec_no ASC";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, que_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				qclist.add(new Quecomm(
							rs.getInt("quec_no"), 
							rs.getInt("que_no"), 
							rs.getString("mem_id"),
							rs.getString("quec_detail"), 
							rs.getDate("quec_date")
						));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return qclist;
	}
	
	public void insertQuestion(Question que) {
		try {
			setConnn();
			String sql = "INSERT INTO p5_question VALUES (p5_question_seq.nextval, ?, ?, ?, sysdate)";
			System.out.println(sql);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, que.getMem_id());
			pstmt.setString(2, que.getQue_name());
			pstmt.setString(3, que.getQue_detail());
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

	public void updateQuestion(Question que) {
		try {
			setConnn();
			String sql = "UPDATE p5_question\r\n" + 
					"SET que_name = ?,\r\n" + 
					"	que_detail = ?\r\n" + 
					"WHERE que_no = ?";
			System.out.println(sql);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, que.getQue_name());
			pstmt.setString(2, que.getQue_detail());
			pstmt.setInt(3, que.getQue_no());
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

	public void deleteQuestion(int que_no) {
		try {
			setConnn();
			String sql = "DELETE FROM p5_question\r\n" + 
					"WHERE que_no= ?";
			System.out.println(sql);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, que_no);
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
	
	public void insertQuecomm(Quecomm quec) {
		try {
			setConnn();
			String sql = "INSERT INTO p5_quecomm VALUES (p5_quecomm_seq.nextval,?,?,?,sysdate)";
			System.out.println(sql);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, quec.getQue_no());
			pstmt.setString(2, quec.getMem_id());
			pstmt.setString(3, quec.getQuec_detail());
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
	
	public void updateQuecomm(Quecomm quec) {
		try {
			setConnn();
			String sql = "UPDATE p5_quecomm\r\n" + 
					"SET quec_detail = ?,\r\n" + 
					"	quec_date = sysdate\r\n" + 
					"WHERE quec_no = ?";
			System.out.println(sql);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, quec.getQuec_detail());
			pstmt.setInt(2, quec.getQuec_no());
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

	public void deleteQuecomm(int quec_no) {
		try {
			setConnn();
			String sql = "DELETE FROM p5_quecomm\r\n" + 
					"WHERE quec_no= ?";
			System.out.println(sql);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, quec_no);
			pstmt.executeUpdate();
			
			con.commit();
			
			pstmt.close();
			con.close();
			
			System.out.println("댓글삭제성공");
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
	
	public void deleteQuecommAll(int que_no) {
		try {
			setConnn();
			String sql = "DELETE FROM p5_quecomm\r\n" + 
					"WHERE que_no= ?";
			System.out.println(sql);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, que_no);
			pstmt.executeUpdate();
			
			con.commit();
			
			pstmt.close();
			con.close();
			
			System.out.println("삭제성공");
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

	// 리뷰리스트 불러오기
	public ArrayList<Review> rlist() {
		ArrayList<Review> rlist = new ArrayList<Review>();
		try {
			setConnn();
			String sql = "SELECT * FROM p5_review\r\n" + 
							"ORDER BY rev_no desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				rlist.add(new Review(
							rs.getInt("rev_no"), 
							rs.getString("mem_id"),
							rs.getString("rev_name"), 
							rs.getString("rev_detail"), 
							rs.getDate("rev_date")
						));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rlist;
	}
	
	public Review rdetail(int rev_no) {
		Review rev = new Review();
		try {
			setConnn();
			String sql = "SELECT rev_no, mem_id, rev_name,\r\n" + 
					"REPLACE(rev_detail,'\\n', '<br>') rev_detail, rev_date\r\n" + 
					"FROM p5_review\r\n" + 
					"WHERE rev_no = ?";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rev_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				rev = new Review(
							rs.getInt("rev_no"), 
							rs.getString("mem_id"),
							rs.getString("rev_name"),
							rs.getString("rev_detail"), 
							rs.getDate("rev_date"));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rev;
	}
	
	// 문의댓글리스트 불러오기
	public ArrayList<Revcomm> rclist(int rev_no) {
		ArrayList<Revcomm> rclist = new ArrayList<Revcomm>();
		try {
			setConnn();
			String sql = "SELECT revc_no, rev_no, mem_id,\r\n" + 
					"REPLACE(revc_detail,'\\n', '<br>') revc_detail, revc_date\r\n" + 
					"FROM p5_revcomm\r\n" + 
					"WHERE rev_no = ?" + 
					"ORDER BY revc_no ASC";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rev_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				rclist.add(new Revcomm(
							rs.getInt("revc_no"), 
							rs.getInt("rev_no"), 
							rs.getString("mem_id"),
							rs.getString("revc_detail"), 
							rs.getDate("revc_date")
						));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rclist;
	}
	
	public void insertReview(Review rev) {
		try {
			setConnn();
			String sql = "INSERT INTO p5_review VALUES (p5_review_seq.nextval, ?, ?, ?, sysdate)";
			System.out.println(sql);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rev.getMem_id());
			pstmt.setString(2, rev.getRev_name());
			pstmt.setString(3, rev.getRev_detail());
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

	public void updateReview(Review que) {
		try {
			setConnn();
			String sql = "UPDATE p5_review\r\n" + 
					"SET rev_name = ?,\r\n" + 
					"	rev_detail = ?\r\n" + 
					"WHERE rev_no = ?";
			System.out.println(sql);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, que.getRev_name());
			pstmt.setString(2, que.getRev_detail());
			pstmt.setInt(3, que.getRev_no());
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

	public void deleteReview(int rev_no) {
		try {
			setConnn();
			String sql = "DELETE FROM p5_review\r\n" + 
					"WHERE rev_no= ?";
			System.out.println(sql);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rev_no);
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
	
	public void insertRevcomm(Revcomm revc) {
		try {
			setConnn();
			String sql = "INSERT INTO p5_revcomm VALUES (p5_revcomm_seq.nextval,?,?,?,sysdate)";
			System.out.println(sql);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, revc.getRev_no());
			pstmt.setString(2, revc.getMem_id());
			pstmt.setString(3, revc.getRevc_detail());
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
	
	public void updateRevcomm(Revcomm revc) {
		try {
			setConnn();
			String sql = "UPDATE p5_revcomm\r\n" + 
					"SET revc_detail = ?,\r\n" + 
					"	revc_date = sysdate\r\n" + 
					"WHERE revc_no = ?";
			System.out.println(sql);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, revc.getRevc_detail());
			pstmt.setInt(2, revc.getRevc_no());
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

	public void deleteRevcomm(int revc_no) {
		try {
			setConnn();
			String sql = "DELETE FROM p5_revcomm\r\n" + 
					"WHERE revc_no= ?";
			System.out.println(sql);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, revc_no);
			pstmt.executeUpdate();
			
			con.commit();
			
			pstmt.close();
			con.close();
			
			System.out.println("댓글삭제성공");
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
	
	public void deleteRevcommAll(int rev_no) {
		try {
			setConnn();
			String sql = "DELETE FROM p5_revcomm\r\n" + 
					"WHERE rev_no= ?";
			System.out.println(sql);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rev_no);
			pstmt.executeUpdate();
			
			con.commit();
			
			pstmt.close();
			con.close();
			
			System.out.println("삭제성공");
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
	
	public ArrayList<As> asList(){
		ArrayList<As> asList = new ArrayList<As>();
		try {
			setConnn();
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
			setConnn();
			String sql = "SELECT as_no, a.ord_no, as_cate, as_detail, as_date, mem_id, as_comm, as_comdate \r\n" + 
					"FROM P5_AS a, P5_ORDER b \r\n" + 
					"WHERE a.ORD_NO = b.ORD_NO\r\n" + 
					"AND a.as_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, as_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//as_no, as_cate, as_detail, as_date, mem_id, as_comm, as_comdate
				asList = new As(rs.getInt("as_no"),rs.getInt("ord_no"),rs.getString("as_cate"),
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
			setConnn();
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
			setConnn();
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
			System.out.println("AS 등록!!");
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
			setConnn();
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
			setConnn(); 
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
			setConnn(); 
			String sql = "INSERT INTO P5_AS\r\n" + 
					"VALUES(p5_as_seq.nextval, ?, ?, ?,sysdate,NULL,null)";
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
			setConnn(); 
			String sql = "UPDATE P5_AS\r\n" + 
					"SET as_cate = ?,\r\n" + 
					"as_detail = ?,\r\n" + 
					"as_date = sysdate\r\n" + 
					"WHERE as_no = ?";
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
			setConnn(); 
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
	public void insComm(int as_no, String as_comm) {
		try {
			setConnn(); 
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
			setConnn();
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
	}

	
}
