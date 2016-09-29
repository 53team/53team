package study.freeboard.action;

import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import study.controller.CommandAction;
import study.freeboard.bean.FreeboardDAO;
import study.freeboard.bean.FreeboardVO;
import study.freeboard.bean.ReplyVO;
import study.freeboard.bean.FreeboardPage;

public class ListAction implements CommandAction{
    public String process(HttpServletRequest request,HttpServletResponse response) throws Exception {
    request.setCharacterEncoding("utf-8");

    String keyField =request.getParameter("keyField");
    String keyWord =request.getParameter("keyWord");
    String pageNum =request.getParameter("pageNum");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    
    if(keyField==null){
        keyField="";
    }
    if(keyWord==null){
        keyWord="";
    }    
    
    if(pageNum ==null){
        pageNum = "1";
    }    
    
    FreeboardDAO dao = FreeboardDAO.getInstance(); 
    int pageSize = 10;
    int currentPage = Integer.parseInt(pageNum);
    int count = dao.getListAllCount(keyField, keyWord);
    System.out.println(count);
    
    int startRow = count - ((currentPage-1) * pageSize) -9;
    int endRow = startRow + 9;
    int number = 0;
    
    List<FreeboardVO> list =null;
    
    if(count > 0){
        list = dao.getSelectAll(startRow, endRow, keyField, keyWord);
    }

    number = count - (currentPage - 1) * pageSize;
    FreeboardPage vo = new FreeboardPage();
    vo.setCount(count);
    vo.setCurrentPage(currentPage);
    vo.setNumber(number);
    vo.setPageSize(pageSize);
    vo.setKeyField(keyField);
    vo.setKeyWord(keyWord);
    request.setAttribute("vo", vo);
    request.setAttribute("list", list);
    
    
    return "/jsp/freeboard/list.jsp";
    }
}