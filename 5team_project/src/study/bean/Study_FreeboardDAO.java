package study.bean;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import study.connection.*;

public class Study_FreeboardDAO {
	public static Study_FreeboardDAO instance = new Study_FreeboardDAO();
	
	public Study_FreeboardDAO(){
		
	}

	public static Study_FreeboardDAO getInstance(){
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		//연결은 JNDI & Pool 형태로 연결 객체 생성해서 리턴할 것임
		Context ctx = new InitialContext();
		DataSource  ds = (DataSource)ctx.lookup("java:comp/env/jdbc:BoardDB");
		
		return ds.getConnection();
	}
	
	//insert(vo)

	public void insert(Study_FreeboardVO vo) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		
		int num = vo.getNum();
/*		int ref = vo.getRef();
		int re_step = vo.getRe_step();
		int re_level = vo.getRe_level();*/
		int number = 0;
		String sql = "";
			
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select max(num) from study_freeboard");
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				number = rs.getInt(1) + 1;//다음 글 번호(지금 추가할)는 가장 큰번호 + 1
			}
			else{
				number = 1;
			}
			
		/*	if(num != 0){ //답젼글은 부모글의 글번호를 가짐
				sql = "update board set re_step + 1 where ref = ? and re_level = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_level);
				pstmt.executeQuery();
				
				re_step = re_step + 1;
				re_level = re_level + 1;
			}
			else{ //부모글인 경우 글번호 없음
				ref = number;
				re_step = 0;
				re_level = 0;
			}*/
			
			//insert 명령 실행
			sb.append("insert into board(num, writer, subject, content, reg_date) " );
			sb.append(" values(freeboard_num.nextVal, ?, ?, ?, ?)");
			
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getSubject());
			pstmt.setString(3, vo.getContent() );
			pstmt.setTimestamp(4, vo.getReg_date() );
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);			
		}
	}
	
	//list.jsp 사용할 레코드 갯수 얻어오는 함수
	public int getListAllCount(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from study_freeboard");
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt(1);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
			
		return count;
	}
	
	//list.jsp
	public List<Study_FreeboardVO> getSelectAll(int startRow, int endRow){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null;
		StringBuffer sb = new StringBuffer();
		String sql;
		try {
			conn = getConnection();

			/*sql = "select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip, r "
					+ "from(select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip, rownum r "
					+ " from(select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip "
					+ " from board order by ref desc, re_step asc) order by ref desc, re_level asc) where r>=? and r<=?";*/
			
			sb.append("select num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, "); 
			sb.append("content, ip, readcount, r from(select num, writer, email, subject, passwd, ");
			sb.append(" reg_date, ref, re_step, re_level, content, ip, readcount, rownum r " );
			sb.append(" from(select num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, ");
			sb.append("content, ip, readcount  from board order by ref desc, re_step asc) ");
			sb.append(" order by ref desc, re_level asc) where r>=? and r<=? ");
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				list = new ArrayList(endRow);
				
				do{
					Study_FreeboardVO vo = new Study_FreeboardVO();
					vo.setNum(rs.getInt("num"));
					vo.setWriter(rs.getString("writer"));
					vo.setSubject(rs.getString("subject"));
					vo.setReg_date(rs.getTimestamp("reg_date"));
					vo.setReadnum(rs.getInt("readcount"));
					vo.setContent(rs.getString("content"));
					
					//list 객체에 데이터 저장빈인 BoardVO 객체를 저장
					list.add(vo);
				}while(rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
		return list;
	}
	
	public Study_FreeboardVO getDataDetail(int num){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Study_FreeboardVO vo = null;
		String sql = null;
		
		try{
			conn = getConnection();
			sql = "update board set readcount = readcount + 1 where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("select * from board where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				vo = new Study_FreeboardVO();
				vo.setNum(rs.getInt("num"));
				vo.setWriter(rs.getString("writer"));
				vo.setSubject(rs.getString("subject"));
				vo.setReg_date(rs.getTimestamp("reg_date"));
				vo.setReadnum(rs.getInt("readcount"));
				vo.setContent(rs.getString("content"));
			}
			
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
		return vo;
	}
	
	public Study_FreeboardVO update(int num){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Study_FreeboardVO vo = null;
		
		String sql = "select * from board where num = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				vo = new Study_FreeboardVO();
				vo.setNum(rs.getInt("num"));
				vo.setWriter(rs.getString("writer"));
				vo.setSubject(rs.getString("subject"));
				vo.setReg_date(rs.getTimestamp("reg_date"));
				vo.setReadnum(rs.getInt("readcount"));
				vo.setContent(rs.getString("content"));
			}
			
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
		return vo;
	}
	
	//글 수정 처리에서 사용할 함수 updatePro.jsp
	/*public int update(Study_FreeboardVO vo){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String dbpasswd = "";
		String sql ="";
		int result = 1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select passwd from board where num = ?");
			pstmt.setInt(1, vo.getNum());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dbpasswd = rs.getString("passwd");
				
				if(dbpasswd.equals(vo.getPasswd())){
					sql = "update board set writer=?, email=?, subject=?, passwd=?, ";
					sql += "content=? where num=? ";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, vo.getWriter());
					pstmt.setString(3, vo.getSubject());
					pstmt.setString(4, vo.getPasswd());
					pstmt.setString(5, vo.getContent());
					pstmt.setInt(6, vo.getNum());
					
					pstmt.executeUpdate();
					
					result = 1;
				}
				else{
					result = 0;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
		
		return result;
	}
	
	
	public Study_FreeboardVO delete(int num){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Study_FreeboardVO vo = null;
		
		String sql = "select * from board where num = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				vo = new Study_FreeboardVO();
				vo.setNum(rs.getInt("num"));
				vo.setWriter(rs.getString("writer"));
				vo.setSubject(rs.getString("subject"));
				vo.setReg_date(rs.getTimestamp("reg_date"));
				vo.setReadnum(rs.getInt("readcount"));
				vo.setContent(rs.getString("content"));
			}
			
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
		return vo;
	}
	
	public int delete(Study_FreeboardVO vo){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String pw = "";
		int result = 1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select passwd from board where num = ?");
			pstmt.setInt(1, vo.getNum());
			rs = pstmt.executeQuery();
			if(rs.next()){
				pw = rs.getString("passwd");
				
				if(pw.equals(vo.getPasswd())){
					pstmt = conn.prepareStatement("delete from board where num = ?");
					pstmt.setInt(1, vo.getNum());
					pstmt.executeUpdate();
					result = 1;
				}
				else{
					result = 0;
				}
			}
		

		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
		return result;
	}*/
}
