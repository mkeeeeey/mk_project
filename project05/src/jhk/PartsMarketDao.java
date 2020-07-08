package jhk;

import java.sql.*;
import java.util.ArrayList;

import z01_vo.Parts;

public class PartsMarketDao {
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
	
	public ArrayList<Parts> getPartsList(String category){
		ArrayList<Parts> plist = new ArrayList<Parts>();
		
		try {
			setCon();
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
			setCon();
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
}
