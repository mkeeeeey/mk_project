package jhk;

import java.sql.*;
import java.util.ArrayList;

import z01_vo.Computer;

public class ComMarketDao {
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
	
	public ArrayList<Computer> getComList(String category){
		ArrayList<Computer> clist = new ArrayList<Computer>();
		try {
			setCon();
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
			setCon();
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
			setCon();
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
}
