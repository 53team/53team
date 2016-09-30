package study.room.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import study.util.CloseUtil;

public class StudyboardDAO {   
   private static StudyboardDAO instance = new StudyboardDAO();
   public static StudyboardDAO getInstance() {
      return instance;
   } 
   
   public StudyboardDAO() {   }

   public Connection getConnection() throws Exception {
      InitialContext ctx = new InitialContext(); 
      DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc:BoardDB");
      return ds.getConnection();
   } 

    public int registerGroup(StudyboardVO vo) {
          Connection conn=null;
          PreparedStatement pstmt=null;
          ResultSet rs=null;
          String sql=null;
          int num=0;
          
          try {
            conn=getConnection();
            sql="insert into study_room(num, ID, Title, Sub_title, Limit, location, reg_date,category) values(studyroom_num.nextVal, ?, ?, ?, ?, ?, ?,?)";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, vo.getId());
            pstmt.setString(2, vo.getTitle());
            pstmt.setString(3, vo.getSub_title());
            pstmt.setInt(4, vo.getLimit());
            pstmt.setString(5, vo.getLocation());
            pstmt.setTimestamp(6, vo.getReg_date());
            pstmt.setString(7, vo.getCategory());
            pstmt.executeUpdate();
            
            sql="select num from study_room where reg_date=?";
            pstmt=conn.prepareStatement(sql);
            pstmt.setTimestamp(1, vo.getReg_date());
            rs=pstmt.executeQuery();
            
            if(rs.next()){
            	num=rs.getInt("num");
            }
            
         } catch (Exception e) {
            e.printStackTrace();
         } finally{
            CloseUtil.close(pstmt);
            CloseUtil.close(conn);
         }
          return num;
       }
    
    public int getListAllCount() {
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         int count = 0;
         
         try {
            conn = getConnection();
            pstmt = conn.prepareStatement("select count(*) from study_room" );
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
      
      public List<StudyboardDAO> getSelectAll(int startRow, int endRow) {
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null; 
         List list = null;
         StringBuffer sb = new StringBuffer();
         try {
            conn = getConnection();
            sb.append("select * from (select rownum r, num, location, id, title, sub_title, limit, reg_date, category  from study_room) where r>=? and r<=? order by num desc");
            pstmt = conn.prepareStatement(sb.toString());
            pstmt.setInt(1, startRow);
            pstmt.setInt(2, endRow);
            rs = pstmt.executeQuery();
            if(rs.next()) { 
               list = new ArrayList();
               
               do {
                  StudyboardVO vo = new StudyboardVO();
                  vo.setNum(rs.getInt("num"));
                  vo.setLocation(rs.getString("location"));
                  vo.setId(rs.getString("id"));
                  vo.setTitle(rs.getString("title"));
                  vo.setSub_title(rs.getString("sub_title"));
                  vo.setLimit(rs.getInt("limit"));
                  vo.setReg_date(rs.getTimestamp("reg_date"));
                  vo.setCategory(rs.getString("category"));
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