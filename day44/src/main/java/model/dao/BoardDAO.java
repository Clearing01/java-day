package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import model.util.JDBCUtil;
import model.vo.BoardVO;

public class BoardDAO {
	Connection conn;
	PreparedStatement pstmt;
	final String sql_selectOne="SELECT BID,TITLE,CONTENT,MNAME,DATETIME FROM BOARD LEFT OUTER JOIN MEMBER ON BOARD.WRITER = MEMBER.MID WHERE BID=?";
	final String sql_selectAll="SELECT BID,TITLE,CONTENT,MNAME,DATETIME FROM BOARD LEFT OUTER JOIN MEMBER ON BOARD.WRITER = MEMBER.MID ORDER BY BID DESC";
	final String sql_selectAll_T="SELECT BID,TITLE,CONTENT,MNAME,DATETIME FROM BOARD LEFT OUTER JOIN MEMBER ON BOARD.WRITER = MEMBER.MID "
								+ "WHERE TITLE LIKE '%'||?||'%' ORDER BY BID DESC";
	final String sql_selectAll_C="SELECT BID,TITLE,CONTENT,MNAME,DATETIME FROM BOARD LEFT OUTER JOIN MEMBER ON BOARD.WRITER = MEMBER.MID "
								+ "WHERE CONTENT LIKE '%'||?||'%' ORDER BY BID DESC";
	final String sql_selectAll_N="SELECT BID,TITLE,CONTENT,MNAME,DATETIME FROM BOARD LEFT OUTER JOIN MEMBER ON BOARD.WRITER = MEMBER.MID "
								+ "WHERE MNAME LIKE '%'||?||'%' ORDER BY BID DESC";	
	final String sql_insert="INSERT INTO BOARD VALUES((SELECT NVL(MAX(BID),0)+1 FROM BOARD),?,?,?,?)";
	final String sql_update="UPDATE BOARD SET TITLE=?,CONTENT=? WHERE BID=?";
	final String sql_update_all="UPDATE BOARD SET WRITER=? WHERE WRITER=?";
	final String sql_delete="DELETE FROM BOARD WHERE BID=?";
	final String sql_delete_all="DELETE FROM BOARD WHERE WRITER=?";
		
	public BoardVO selectOne(BoardVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectOne);
			pstmt.setInt(1, vo.getBid());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				BoardVO data=new BoardVO();
				data.setBid(rs.getInt("BID"));
				data.setContent(rs.getString("CONTENT"));
				data.setTitle(rs.getString("TITLE"));
				if(rs.getString("MNAME")==null) {				
					data.setWriter("(알수없음)");
				} else {
					data.setWriter(rs.getString("MNAME"));					
				}
				data.setDateTime(rs.getString("DATETIME"));
				return data;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}		
		return null;
	}
	
	public ArrayList<BoardVO> selectAll(BoardVO vo){
		if(vo.getSearchCondition()==null) {
			vo.setSearchCondition("");
		}
	//	System.out.println("SelectAll 로그: 시작");
		ArrayList<BoardVO> datas=new ArrayList<BoardVO>();
		conn=JDBCUtil.connect();
		try {
			if(vo.getSearchCondition().equals("title")) {
				pstmt=conn.prepareStatement(sql_selectAll_T);
				pstmt.setString(1, vo.getSearchContent());
			}
			else if(vo.getSearchCondition().equals("content")) {
				pstmt=conn.prepareStatement(sql_selectAll_C);
				pstmt.setString(1, vo.getSearchContent());
			}
			else if(vo.getSearchCondition().equals("writer")) {
				pstmt=conn.prepareStatement(sql_selectAll_N);
				pstmt.setString(1, vo.getSearchContent());
			}
			else {
				pstmt=conn.prepareStatement(sql_selectAll);
				
			}
	//		System.out.println("SelectAll 로그: 중간" );
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {		
				BoardVO data=new BoardVO();
				data.setBid(rs.getInt("BID"));
				data.setContent(rs.getString("CONTENT"));
				data.setTitle(rs.getString("TITLE"));
				if(rs.getString("MNAME")==null) {
					data.setWriter("(알수없음)");
				} else {
					data.setWriter(rs.getString("MNAME"));					
				}
				data.setDateTime(rs.getString("DATETIME"));
				datas.add(data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
	//	System.out.println("SelectAll 로그: 끝" );
		return datas;
	}
	
	public boolean insert(BoardVO vo) {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		String strStamp = String.valueOf(timestamp.getTime());

		Date date = new Date(Long.parseLong(strStamp)); // [타임 스탬프 값 문자열 형 변환]
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd kk:mm:ss"); // [Date 형식으로 변경 : 24 시간 포맷 형태]
		
		strStamp = String.valueOf(sdf.format(date));
		//System.out.println(strStamp);
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_insert);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getWriter());
			pstmt.setString(4, strStamp);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	public boolean update(BoardVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_update);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3,vo.getBid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	public boolean update_all(BoardVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_update_all);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getWriter());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}

	public boolean delete(BoardVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_delete);
			pstmt.setInt(1,vo.getBid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	
	public boolean delete_all(BoardVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_delete_all);
			pstmt.setString(1,vo.getWriter());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
}
