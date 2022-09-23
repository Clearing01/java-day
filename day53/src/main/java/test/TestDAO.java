package test;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TestDAO {
	Connection conn;
	PreparedStatement pstmt;
	
	final private String sql_checkId="SELECT * FROM TEST WHERE MID=?";
	
	public int checkId(TestVO vo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_checkId);
			pstmt.setString(1, vo.getMid());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				return 0; // 아이디 중복 발생...
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return 1; // 아이디 중복 아님!!
	}
	
}
