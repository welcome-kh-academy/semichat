package controller.join;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CounselorJoinController
 */
@WebServlet("/join/join")
public class CounselorJoinController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//VIEW JSP 지정하고 forwarding
		req.getRequestDispatcher("/WEB-INF/views/join/join.jsp")
		.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		
		String id = req.getParameter("id");
		String pw = req.getParameter("password");
		String pwcheck = req.getParameter("passwordCheck");
		String name = req.getParameter("name");
		String nickname = req.getParameter("nickname");
		String email = req.getParameter("email");
		String phone = req.getParameter("phoneNumber");
		String entriprise = req.getParameter("enterprise");
		
		String privacy = req.getParameter("privacyInfoAgree");
		String marketing = req.getParameter("marketingAgree");
		
		
		System.out.println(id);
		System.out.println(pw);
		System.out.println(pwcheck);
		System.out.println(name);
		System.out.println(nickname);
		System.out.println(email);
		System.out.println(phone);
		System.out.println(entriprise);
		System.out.println(privacy);
		System.out.println(marketing);
	}
	
}
