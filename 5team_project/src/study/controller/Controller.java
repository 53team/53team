/*package study.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.commnad.CommandAction;

public class Controller extends HttpServlet {
   
   private Map<String, Object> commandMap = new HashMap<>();

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      process(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      process(request, response);
   }

   public void init(ServletConfig config) throws ServletException {
      String props = config.getInitParameter("propertyConfig");
      Properties pr = new Properties();
      FileInputStream f = null;
      
      try {
         f=new FileInputStream(props);
         pr.load(f);
         
      } catch (Exception e) {
         e.printStackTrace();
      } finally{
         if(f!=null) try{f.close();} catch(Exception e){e.printStackTrace();}
      }
      Iterator<?> keyIter = pr.keySet().iterator();
      System.out.println("keyIter:"+keyIter);
      
      while(keyIter.hasNext()){
         String command=(String)keyIter.next();
         String className = pr.getProperty(command);
         try {
            Class<?> commandClass = Class.forName(className);
            Object commandInstance = commandClass.newInstance();
            
            commandMap.put(command, commandInstance);
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
   }

   protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String view = null;
      CommandAction ca = null;
      System.out.println("commandMap : "+commandMap);
      try {
         String command = request.getRequestURI(); 
         if(command.indexOf(request.getContextPath())==0){
            command = command.substring(request.getContextPath().length()+1);
         }
         
         ca=(CommandAction)commandMap.get(command);
         view = ca.process(request, response);
      } catch (Throwable e) {
         e.printStackTrace();
      }
      request.setAttribute("CONTENT", view);
      RequestDispatcher dispatcher = request.getRequestDispatcher("/template/template.jsp");
      dispatcher.forward(request, response);
   }
   
}*/

package study.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.commnad.*;

public class Controller extends HttpServlet {

	private Map commandMap = new HashMap();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	@Override
	public void init(ServletConfig config) throws ServletException { // 초기화를 위한
																		// method
		String props = config.getInitParameter("propertyConfig"); // web.xml 설정
																	// 파일 읽어들임

		Properties pr = new Properties();
		FileInputStream f = null;

		try {
			f = new FileInputStream(props);
			pr.load(f);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (f != null) {
				try {
					f.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} // try~catch close

		Iterator keyIter = pr.keySet().iterator();

		while (keyIter.hasNext()) {
			String command = (String) keyIter.next();

			String className = pr.getProperty(command); // value :
														// edu.kosta.boardAction.WriteFormAction

			try {
				Class commandClass = Class.forName(className); // String 타입이였던
																// 클래스이름을
																// Class.forName(className);
																// 을 통해
																// Class이름으로 변경
				Object commandInstance = commandClass.newInstance(); // 객체 생성

				commandMap.put(command, commandInstance); // commandMap.put(키값,
															// 명령처리값)
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // while close
	}

	private void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String view = null;
		CommandAction ca = null;

		try {
			String command = request.getRequestURI();
			System.out.println("command : " + command); // /Day52_boardMVC/writeForm.do
			System.out.println("request.getContextPath() : " + request.getContextPath()); // /Day52_boardMVC
			if (command.indexOf(request.getContextPath()) == 0) {
				command = command.substring(request.getContextPath().length() + 1);
				System.out.println("if command : " + command); // if command :
																// writeForm.do
			} // if close

			ca = (CommandAction) commandMap.get(command);
			System.out.println("ca : " + ca);
			view = ca.process(request, response);
			System.out.println("view : " + view + "\n\n");

		} catch (Exception e) {
			e.printStackTrace();
		}

		request.setAttribute("CONTENT", view);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/template/template.jsp");
		dispatcher.forward(request, response);
	}
}