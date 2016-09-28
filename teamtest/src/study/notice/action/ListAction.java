package study.notice.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import study.controller.CommandAction;
import study.notice.bean.NoticeDAO;
import study.notice.bean.NoticePage;
import study.notice.bean.NoticeVO;

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
    
    NoticeDAO dao = NoticeDAO.getInstance(); 
    int pageSize = 10;
    int currentPage = Integer.parseInt(pageNum);
    int count = dao.getListAllCount(keyField, keyWord);
    int startRow = count - ((currentPage-1) * pageSize) -9;
    int endRow = startRow + 9;
    int number = 0;
    
    List<NoticeVO> list =null;

    count = dao.getListAllCount(keyField,keyWord);
    
    if(count > 0){
        list = dao.getSelectAll(startRow, endRow, keyField, keyWord);
    }
    number = count - (currentPage - 1) * pageSize;

    NoticePage vo= new NoticePage();
    vo.setCount(count);
    vo.setCurrentPage(currentPage);
    vo.setNumber(number);
    vo.setPageSize(pageSize);
    vo.setKeyField(keyField);
    vo.setKeyWord(keyWord);    
    
    request.setAttribute("vo", vo);
    request.setAttribute("list", list);

    return "/jsp/notice/list.jsp";
    }
}