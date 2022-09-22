package control;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Map;
import java.util.Properties;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> commandMap = new HashMap<String, Object>();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// web.xml에서 propertyConfig에 해당하는 init-param 의 값을 읽어옴
		String props = config.getInitParameter("config");
		// WEB-INF/command.properties
		System.out.println("String props->"+ props); // ch16/com
		
		Properties pr = new Properties();
		FileInputStream f = null;
		
		
		
		
		try {
			String configFilePath = config.getServletContext().getRealPath(props);
			System.out.println("String configFilePath=>"+ configFilePath);// /och16/com
			f = new FileInputStream(configFilePath);
			
			pr.load(f);
		}catch(FileNotFoundException e)	{
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
		
			if(f != null)
				try {
					f.close();
				}catch(IOException ex)	{
					
				}
		}	
				
			Iterator keyIter = pr.keySet().iterator();
			while(keyIter.hasNext())	{
				String command = (String)keyIter.next();
				String className = pr.getProperty(command);
				System.out.println("3.command=>"+ command);
				System.out.println("4.className  =>"+ className);
				
				
				try {
					Class commandClass = Class.forName(className);
					Object commandInstance = commandClass.newInstance();
					commandMap.put(command, commandInstance);
					
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InstantiationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		requestServletPro(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		requestServletPro(request,response);
	}
	
	
	protected void requestServletPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//단 post 방식때문에 한글처리 해줘야한다
		if(request.getMethod().equals("POST"))	{
			request.setCharacterEncoding("UTF-8");
		}// if
		
		String view = null;
		CommandProcess com = null;
		String command = request.getServletPath(); // ~~~~~~/.do에서 /list.do만 뽑아오는 함수
		System.out.println("2. command substring=>"+command);
		
		try{
			com = (CommandProcess)commandMap.get(command);
			System.out.println("3. command=> "+command);
			System.out.println("commandMap=> "+commandMap);
			System.out.println("4. com "+com);
			
			view = com.requestPro(request, response);
			System.out.println("5. requestServletPro view=>"+view);
		}catch(Exception e) {
			throw new ServletException();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
	
	
}