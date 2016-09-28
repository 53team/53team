package study.member.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import study.crypt.BCrypt;
//import study.crypt.BCrypt;
import study.util.CloseUtil;

public class MemberDAO {
	private static MemberDAO instance = new MemberDAO();
    
    public static MemberDAO getInstance() {
        return instance;
    }
    
    private MemberDAO(){}
	public Connection getConnection() throws Exception {
		InitialContext ctx = new InitialContext(); 
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc:BoardDB");
		return ds.getConnection();
	} 
    
	public int idCheck(MemberVO vo) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		int idcheck=0;
		
		try {
			conn=getConnection();
			sql="select id from study_member where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				idcheck = -1;
			} else {
				idcheck = 0;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
		return idcheck;
	}
	
    public void registerMember(MemberVO vo) {
    	Connection conn=null;
    	PreparedStatement pstmt=null;
    	String sql=null;
    	String originalPWD=null;
    	String cryptPWD=null;
    	
    	try {
    		conn=getConnection();
    		
    		originalPWD=vo.getPwd();
    		cryptPWD=BCrypt.hashpw(originalPWD , BCrypt.gensalt());
    		
			sql="insert into study_member(ID, PWD, name, phone, location, reg_date) values(?, ?, ?, ?, ?, ?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, cryptPWD);
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getPhone());
			pstmt.setString(5, vo.getLocation());
			pstmt.setTimestamp(6, vo.getReg_date());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
    } // 회원가입 
    
    public int registerCheck(MemberVO vo) {//2
    	Connection conn=null;
    	PreparedStatement pstmt=null;
    	ResultSet rs=null;
    	String sql=null;
    	int result=0;
    	
    	try {
			conn=getConnection();
			sql="select id from study_member where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				//중복 아이디 있음
				result=1;
			} else {
				//중복 아이디 없음
				result=0;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
    	
    	return result;
    } // 회원가입 검열
    
    public int loginCheck(MemberVO vo) {//3
    	Connection conn=null;
    	PreparedStatement pstmt=null;
    	ResultSet rs=null;
    	String sql=null;
    	
    	String inputID=vo.getId();
    	String inputPWD=vo.getPwd();
    	

    	int result=0;
    	
    	try {
			conn=getConnection();
			sql="select pwd from study_member where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, inputID);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
					String DBPWD=rs.getString("pwd");
				if(BCrypt.checkpw(inputPWD, DBPWD)){
				//if(inputPWD.equals(DBPWD)){
					//로그인 성공
					result=1;
				} else {
					//패스워드 틀림
					result=0;
				}//if end
				
			} else { 
				result=-1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
    	return result;
    } // 로그인 검열
    
    public MemberVO updateMember(String sid) {//3
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      MemberVO vo = new MemberVO();

	      try {
	         conn = getConnection();
	         pstmt = conn.prepareStatement("select * from study_member where id = ?");
	         pstmt.setString(1, sid);
	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            vo.setName(rs.getString("name"));
	            vo.setPhone(rs.getString("phone"));
	            vo.setLocation(rs.getString("location"));
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         CloseUtil.close(conn);
	         CloseUtil.close(rs);
	         CloseUtil.close(pstmt);
	      }
	      return vo;
	   } // 회원수정 - 기존정보 받아오기
    
    public void updateMember(MemberVO vo, String sid) {//4
    	Connection conn=null;
    	PreparedStatement pstmt=null;
    	String sql=null;
    	
    	try {
			conn=getConnection();
			sql="update study_member set pwd=?, name=?, phone=?, location=? where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPwd());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getLocation());
			pstmt.setString(5, sid);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
    	
    }// 회원수정 - 정보 수정적용
    
    public int updateCheck(MemberVO vo, String sid) {//4
    	Connection conn=null;
    	PreparedStatement pstmt=null;
    	ResultSet rs=null;
    	String sql=null;
    	String inputPWD=null;
    	String DBPWD=null;
    	int result=0;
    	
    	inputPWD=vo.getPwd();
    	
    	try {
			conn=getConnection();
    		sql="select pwd from study_member where id=?";
    		pstmt=conn.prepareStatement(sql);
    		pstmt.setString(1, sid);
    		rs=pstmt.executeQuery();
    		
    		if(rs.next()){
    			DBPWD=rs.getString("pwd");
    			if(BCrypt.checkpw(inputPWD, DBPWD)){
    			//if(inputPWD.equals(DBPWD)) {
    				//패스워드 확인 성공
    				result=1;
    			} else {
    				//패스워드 틀림
    				result=0;
    			}
    		}//if end
    		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
    	return result;
    } // 회원수정 - 검열
    
    public int deleteMember(MemberVO vo, String sid) {//6
    	Connection conn=null;
    	PreparedStatement pstmt=null;
    	ResultSet rs=null;
    	String inputPWD=null;
    	String DBPWD=null;
    	String sql=null;
    	int result=0;
    	
    	inputPWD=vo.getPwd();
    	
    	try {
			conn=getConnection();
			sql="select pwd from study_member where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, sid);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				DBPWD=rs.getString("pwd");
				if(BCrypt.checkpw(inputPWD, DBPWD)) {
				//if(inputPWD.equals(DBPWD)) {
				sql="delete from Study_Member where id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, sid);
				pstmt.executeUpdate();
				result=1;
				} else {
				result=0;
				}
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
    	return result;
    }//회원탈퇴
    
    public int getListAllCount() {//6
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int count = 0;
        
        try {
           conn = getConnection();
           pstmt = conn.prepareStatement("select count(*) from study_member" );
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
     } //총 회원수
     
     public List<MemberVO> getSelectAll(int startRow, int endRow) {//7
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null; 
        List<MemberVO> list = null;
        StringBuffer sb = new StringBuffer();
        
        try {
           conn = getConnection();
           sb.append("select * from (select rownum r, id, pwd, name, phone, location, reg_date from study_member) where r>=? and r<=? and id not like 'admin'order by reg_date desc");
           pstmt = conn.prepareStatement(sb.toString());
           pstmt.setInt(1, startRow);
           pstmt.setInt(2, endRow);
           rs = pstmt.executeQuery();
           if(rs.next()) { 
              list = new ArrayList<MemberVO>();
              do {
                 MemberVO vo = new MemberVO();
                 vo.setId(rs.getString("id"));
                 vo.setPwd(rs.getString("pwd"));
                 vo.setName(rs.getString("name"));
                 vo.setPhone(rs.getString("phone"));
                 vo.setLocation(rs.getString("location"));
                 vo.setReg_date(rs.getTimestamp("reg_date"));
                 list.add(vo);
              } while(rs.next());
           } else {
        	   list = Collections.EMPTY_LIST;
           }
        } catch (Exception e) {
           e.printStackTrace();
        }  finally {
           CloseUtil.close(rs);
           CloseUtil.close(pstmt);
           CloseUtil.close(conn);
        }
        return list;
     } //회원 목록
     
     public void delete(String id) {
         Connection conn = null;
         PreparedStatement pstmt = null;

         try {
            conn = getConnection();
           pstmt = conn.prepareStatement("delete from study_member where id = ?");
           pstmt.setString(1, id);

           pstmt.executeUpdate();
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
            CloseUtil.close(pstmt);
            CloseUtil.close(conn);
         }
    }
}
