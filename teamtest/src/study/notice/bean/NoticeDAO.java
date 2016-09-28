package study.notice.bean;

import java.sql.*;
import java.util.*;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import study.util.CloseUtil;

public class NoticeDAO {	
	private static NoticeDAO instance = new NoticeDAO();
	public static NoticeDAO getInstance() {
		return instance;
	} // 인스턴스 생성부
	
	public NoticeDAO() {	}

	public Connection getConnection() throws Exception {
		InitialContext ctx = new InitialContext(); 
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc:BoardDB");
		return ds.getConnection();
	} //커넥션 풀 연결부 

	public void insert(NoticeVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		int number = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select max(num) from study_notice");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1;
			}
			sb.append("insert into study_notice(num, writer, subject, content, reg_date) ");
			sb.append(" values(notice_num.nextVal, ?, ?, ?, ?)");
			
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
	} // write

	public int getListAllCount(String keyField,String keyWord)throws Exception{
        Connection conn= null;
        PreparedStatement pstmt =null;
        ResultSet rs= null;
        int count =0;
        String sql = null;
        
        try{
            conn = getConnection();
            if(keyWord == null || "".equals(keyWord.trim())){
                sql="select count(*) from study_notice";
                pstmt =conn.prepareStatement(sql);
            }else{
                sql="select count(*) from study_notice where "+keyField+" like ?";
                pstmt =conn.prepareStatement(sql);
                pstmt.setString(1, "%"+keyWord+"%");
            }
            rs =pstmt.executeQuery();
            if (rs.next()){
                count =rs.getInt(1);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            CloseUtil.close(conn);
            CloseUtil.close(pstmt);
            CloseUtil.close(rs);
        }            
        return count;
    }
    
    public List<NoticeVO> getSelectAll(int startRow, int endRow, String keyField, String keyWord)throws Exception{
        Connection conn= null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        List<NoticeVO> list = null;
        String sql=null;
           
        try{
            conn =getConnection();
            if(keyWord == null || "".equals(keyWord.trim())){
                sql ="select * from (select rownum r, num, writer, subject, content, reg_date, readnum  from study_notice) where r>=? and r<=? order by reg_date desc";
                pstmt =conn.prepareStatement(sql);            
                pstmt.setInt(1, startRow);
                pstmt.setInt(2, endRow);    
            }else{
                sql ="select * from (select rownum r, num, writer, subject, content, reg_date, readnum from (select * from study_notice where "+keyField+" like ? )) where r>=? and r<=? order by reg_date desc";
                pstmt =conn.prepareStatement(sql);
                pstmt.setString(1, "%"+keyWord+"%");
                pstmt.setInt(2, startRow);
                pstmt.setInt(3, endRow);
            }
            rs = pstmt.executeQuery();
            if(rs.next()){
                list= new ArrayList<NoticeVO>();                
                do{
                    NoticeVO vo =new NoticeVO();
                    vo.setNum(rs.getInt("num"));
                    vo.setWriter(rs.getString("writer"));
                    vo.setSubject(rs.getString("subject"));
                    vo.setReg_date(rs.getTimestamp("reg_date"));
                    vo.setReadnum(rs.getInt("readnum"));
                    vo.setContent(rs.getString("content"));
                    list.add(vo);
                    System.out.println(list);
                }while(rs.next());
            }else{
                list = Collections.EMPTY_LIST;
            }            
        }catch(Exception e){
            e.printStackTrace();
        }finally{
        	CloseUtil.close(conn);
            CloseUtil.close(pstmt);
            CloseUtil.close(rs);
        }        
        return list;
    }

	public NoticeVO getDataDetail(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		String sql = null;
		NoticeVO  vo = null;
		try {
			sql = "update study_notice set readnum = readnum + 1 where num=?";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("select * from study_notice where num=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				vo = new NoticeVO();
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
	} //content
	
	
	public NoticeVO update(int num) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      NoticeVO vo = null;

	      try {
	         conn = getConnection();
	         pstmt = conn.prepareStatement("select * from study_notice where num = ?");
	         pstmt.setInt(1, num);
	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            vo = new NoticeVO();
	            vo.setNum(rs.getInt("num"));
	            vo.setWriter(rs.getString("writer"));
	            vo.setSubject(rs.getString("subject"));
	            vo.setContent(rs.getString("content"));

	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         CloseUtil.close(conn);
	         CloseUtil.close(rs);
	         CloseUtil.close(pstmt);
	      }

	      return vo;
	   } //update(1) 수정전 데이터 추출

	   public int update(NoticeVO vo) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;

	      String dbwriter = "";
	      String sql = "";
	      StringBuffer sb = new StringBuffer();

	      int result = -1;

	      try {
	         conn = getConnection();
	         pstmt = conn.prepareStatement("select writer from study_notice where num = ?");
	         pstmt.setInt(1, vo.getNum());
	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            dbwriter = rs.getString("writer");

	            if (dbwriter.equals(vo.getWriter())) {
	               sb.append("update study_notice set subject = ?, content = ? ");
	               sb.append("where num = ?");

	               pstmt = conn.prepareStatement(sb.toString());

	               pstmt.setString(1, vo.getSubject());
	               pstmt.setString(2, vo.getContent());
	               pstmt.setInt(3, vo.getNum());

	               pstmt.executeUpdate();

	               result = 1;
	            }

	            else {
	               result = 0;
	            }
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         CloseUtil.close(conn);
	         CloseUtil.close(pstmt);
	         CloseUtil.close(rs);
	      }

	      return result;
	   } // update(2) 수정
	   
	   public void delete(int num) {
		      Connection conn = null;
		      PreparedStatement pstmt = null;

		      try {
		         conn = getConnection();
	             pstmt = conn.prepareStatement("delete from study_notice where num = ?");
	             pstmt.setInt(1, num);
	             pstmt.executeUpdate();
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         CloseUtil.close(pstmt);
		         CloseUtil.close(conn);
		      }
	   } // 삭제
	   
	   public void delete(String num) {
	         Connection conn = null;
	         PreparedStatement pstmt = null;

	         try {
	            conn = getConnection();
	           pstmt = conn.prepareStatement("delete from study_notice where num = ?");
	           pstmt.setString(1, num);

	           pstmt.executeUpdate();
	         } catch (Exception e) {
	            e.printStackTrace();
	         } finally {
	            CloseUtil.close(pstmt);
	            CloseUtil.close(conn);
	         }
	    }
}
