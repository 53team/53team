package study.freeboard.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import study.controller.CommandAction;
import study.freeboard.bean.FreeboardDAO;
import study.freeboard.bean.FreeboardVO;
import study.freeboard.bean.SearchVO;

public class ListAction implements CommandAction{
    public String process(HttpServletRequest request,HttpServletResponse response) throws Exception {
    request.setCharacterEncoding("utf-8");

    String keyField =request.getParameter("keyField");
    String keyWord =request.getParameter("keyWord");
    String pageNum =request.getParameter("pageNum");
    
    if(keyField==null){
        keyField="";
    }
    if(keyWord==null){
        keyWord="";
    }    
    
    if(pageNum ==null){
        pageNum = "1";
    }    
    
    int pageSize = 10;
    int currentPage = Integer.parseInt(pageNum);
    int startRow =(currentPage-1)*pageSize +1;
    int endRow =currentPage * pageSize;
    int count = 0;
    int number = 0;
    
    List<FreeboardVO> list =null;
    FreeboardDAO dao = FreeboardDAO.getInstance();
    count =dao.getListAllCount(keyField,keyWord);
    
    if(count>0){
        list = dao.getSelectAll(startRow, endRow, keyField, keyWord);
    }
    number=count-(currentPage-1)*pageSize;

    SearchVO vo= new SearchVO();
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