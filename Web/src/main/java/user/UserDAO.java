package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO
{
	public Connection conn;	
	public PreparedStatement pstmt;	
	public ResultSet rs;	
	
	public UserDAO()
	{
		try
		{
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "musthave";
			String pwd = "1234";
			conn = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공(기본 생성자)");
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public int login(String id, String pass)
	{
		String sql = "select pass from user1 where id = ?";
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next())
			{
				if (rs.getString(1).equals(pass)) {
					return 1;	// 로그인 성공
				}else
					return 0;	// 비밀번호 오류
			}
			return -1;	// 아이디 없음
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return -2;	// 오류
	}
	
	public int join(User user)
	{
		String sql = "insert into user1 values(?,?,?,sysdate)";
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPass());
			pstmt.setString(3, user.getName());
			return pstmt.executeUpdate();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return -1;	// 데이터베이스 오류
	}
	
	public int update(String id, String pass, String name) {
		String sql  = "update user1 set pass = ?, name = ? where id = ?";	// 특정한 이메일에 해당하는 제목과 내용을 바꿔준다. 
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pass);
			pstmt.setString(2, name);
			pstmt.setString(4, id);
			return pstmt.executeUpdate();		
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;	// 데이터베이스 오류
	}
	
	public int delete(String id) {
		String sql = "delete from user1 where id = ?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;	// 데이터베이스 오류
	}
}
