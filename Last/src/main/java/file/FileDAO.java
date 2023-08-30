package file;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class FileDAO
{
	private Connection conn;
	
	public FileDAO() {
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
	
	public int upload(String name, String realName, int num) {
		String sql = "insert into file1 values (?,?,?)";
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, realName);
			pstmt.setInt(3, num);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			
		}
		return -1;
	}
}
