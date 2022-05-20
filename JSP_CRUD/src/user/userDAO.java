package user;
import java.sql.*;

public class userDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	public userDAO() {
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
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID=?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getNString(1).contentEquals(userPassword)) {
					return 1; //일치
				} else {
					return 0; //불일치
				}
			}
			return -1; //아이디 없음
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
		
	}
	
	public int join(String userName, String userID, String userPassword) {
		String SQL = "INSERT INTO USER VALUES(?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setNString(3, userName);
			pstmt.setNString(1, userID);
			pstmt.setNString(2, userPassword);
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
