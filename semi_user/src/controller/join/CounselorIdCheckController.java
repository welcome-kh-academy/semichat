package controller.join;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.face.join.CounselorJoinService;
import service.impl.join.CounselorJoinServiceImpl;

/**
 * Servlet implementation class CounselorIdCheckController
 */
@WebServlet("/join/idCheck")
public class CounselorIdCheckController extends HttpServlet {
	
	private CounselorJoinService counselorJoinService = new CounselorJoinServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");

		String id = req.getParameter("id");
		int check = counselorJoinService.counselorIdCheck(id);
		req.setAttribute("check", check);
		
		req.getRequestDispatcher("/WEB-INF/views/join/idCheck.jsp").forward(req, resp);
		
	}

}
