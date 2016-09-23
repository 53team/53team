package study.member.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;
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
    
    public void registerMember(MemberVO vo) {
    	Connection conn=null;
    	PreparedStatement pstmt=null;
    	String sql=null;
    	
    	try {
    		conn=getConnection();
			sql="insert into study_member(ID, PWD, name, phone, location, reg_date) values(?, ?, ?, ?, ?, ?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
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
    }
    
    public int loginCheck(MemberVO vo) {
    	Connection conn=null;
    	PreparedStatement pstmt=null;
    	ResultSet rs=null;
    	String sql=null;
    	
    	String inputID=vo.getId();
    	String inputPWD=vo.getPwd();
    	String DBPWD=null;
    	int result=0;
    	
    	try {
			conn=getConnection();
			sql="select pwd from study_member where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, inputID);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
					DBPWD=rs.getString("pwd");
					
				if(inputPWD.equals(DBPWD)){
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
    }
    public MemberVO updateMember(String sid) {
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
	   }
    public void updateMember(MemberVO vo, String sid) {
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
    	
    }//updateMember end
    
    public void deleteMember(MemberVO vo, String sid) {
    	Connection conn=null;
    	PreparedStatement pstmt=null;
    	String sql=null;
    	
    	try {
			conn=getConnection();
			sql="delete from Study_Member where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, sid);
			pstmt.executeUpdate();
    		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
    }//deleteMember end
    
    public int getListAllCount() {
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
     } // list(1)
     
     public List<MemberVO> getSelectAll(int startRow, int endRow) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null; 
        List list = null;
        StringBuffer sb = new StringBuffer();
        try {
           conn = getConnection();
           sb.append("select * from (select rownum r, id, pwd, name, phone, location, reg_date from study_member) where r>=? and r<=? order by reg_date desc");
           pstmt = conn.prepareStatement(sb.toString());
           pstmt.setInt(1, startRow);
           pstmt.setInt(2, endRow);
           rs = pstmt.executeQuery();
           if(rs.next()) { 
              list = new ArrayList();
              
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
           }
        } catch (Exception e) {
           e.printStackTrace();
        }  finally {
           CloseUtil.close(rs);
           CloseUtil.close(pstmt);
           CloseUtil.close(conn);
        }
        return list;
     } // list(2)
}
