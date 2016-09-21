package study.bean;

import java.sql.*;
import java.util.*;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import study.util.CloseUtil;

public class FreeboardDAO {	
	private static FreeboardDAO instance = new FreeboardDAO();
	public static FreeboardDAO getInstance() {
		return instance;
	}
	public FreeboardDAO() {	}

	public Connection getConnection() throws Exception {
		InitialContext ctx = new InitialContext(); 
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc:BoardDB");
		return ds.getConnection();
	} 

	public void insert(FreeboardVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		int number = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select max(num) from study_freeboard");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1;
			}
			sb.append("insert into study_freeboard(num, writer, subject, content, reg_date) ");
			sb.append(" values(freeboard_num.nextVal, ?, ?, ?, ?)");
			
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getSubject());
			pstmt.setString(3, vo.getContent());
			pstmt.setTimestamp(4, vo.getReg_date());
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);	
		}	
	}
	
	public int getListAllCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from study_freeboard" );
			rs = pstmt.executeQuery();
			
			if(rs.next()) count = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		return count;
	}
	
	public List<FreeboardVO> getSelectAll(int startRow, int endRow) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		List list = null;
		StringBuffer sb = new StringBuffer();
		try {
			conn = getConnection();
			sb.append("select * from (select rownum r, num, writer, subject, content, reg_date, readnum  from study_freeboard) where r>=? and r<=? order by num desc");
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			if(rs.next()) { 
				list = new ArrayList();
				
				do {
					FreeboardVO vo = new FreeboardVO();
					vo.setNum(rs.getInt("num"));
					vo.setWriter(rs.getString("writer"));
					vo.setSubject(rs.getString("subject"));
					vo.setReg_date(rs.getTimestamp("reg_date"));
					vo.setReadnum(rs.getInt("readnum"));
					vo.setContent(rs.getString("content"));
					list.add(vo);
				} while(rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}  finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		return list;
	}

	public FreeboardVO getDataDetail(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		String sql = null;
		FreeboardVO  vo = null;
		try {
			sql = "update study_freeboard set readnum = readnum + 1 where num=?";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("select * from study_freeboard where num=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				vo = new FreeboardVO();
				vo.setNum(rs.getInt("num"));
				vo.setWriter(rs.getString("writer"));
				vo.setSubject(rs.getString("subject"));
				vo.setReg_date(rs.getTimestamp("reg_date"));
				vo.setReadnum(rs.getInt("readnum"));
				vo.setContent(rs.getString("content"));
			}	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		return vo;
	}
}
