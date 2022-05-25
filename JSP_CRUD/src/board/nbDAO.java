package board;

import java.sql.*;
import java.util.ArrayList;

public class nbDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	public nbDAO() {
		//DB Connection
		try {
			String dbURL ="jdbc:mysql://localhost:3306/NB?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword="root";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("db not connect");
		}
	}
	

	public int getNext() {
		String SQL = "SELECT BID FROM BOARD ORDER BY BID DESC"; //최신꺼부터?
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) return rs.getInt(1) + 1;
			return 1; // 첫번째 게시물인 경우
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db 오류
	}
	
	public int write(String BTitle, String userID, String BContent) {
		String SQL = "INSERT INTO BOARD VALUES(?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext());
			pstmt.setString(2,BTitle);
			pstmt.setString(3,userID);
			pstmt.setString(4,BContent);
			pstmt.setInt(5,1);
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db 오류
	}
	
	public ArrayList<nb> getList() {
		ArrayList<nb> list = new ArrayList<nb>();
		
		String SQL = "SELECT * FROM BOARD WHERE BAvailable = 1 ORDER BY BID DESC";
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				nb _nb = new nb();
				_nb.setBID(rs.getInt(1));
				_nb.setBTitle(rs.getString(2));
				_nb.setUserID(rs.getString(3));
				_nb.setBContent(rs.getString(4));
				_nb.setBAvailable(rs.getInt(5));
				list.add(_nb);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public nb getOne(int bid){
		
		String SQL = "SELECT * FROM BOARD WHERE BID=?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,bid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				nb _nb = new nb();
				
				_nb.setBID(rs.getInt(1));
				_nb.setBTitle(rs.getString(2));
				_nb.setUserID(rs.getString(3));
				_nb.setBContent(rs.getString(4));
				_nb.setBAvailable(rs.getInt(5));
				
				return _nb;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public int update(int BID, String BTitle, String BContent) {
		String SQL = "UPDATE BOARD SET BTitle = ?, BContent = ? WHERE BID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(3,BID);
			pstmt.setString(1,BTitle);
			pstmt.setString(2,BContent);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public int delete(int BID) {
		String SQL = "UPDATE BOARD SET BAvailable=0 WHERE BID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,BID);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
}
