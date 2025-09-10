package vn.iostar.controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iostar.services.IUserService;
import vn.iostar.services.impl.UserServiceImpl;
import vn.iostar.utils.Constant;

@WebServlet(urlPatterns = {"/forgotpassword"})
public class ForgotPasswordController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	IUserService service = new UserServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/forgotpassword.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		String email = req.getParameter("email");
		String password = req.getParameter("psw");
		String passwordRepeat = req.getParameter("psw-repeat");
		
		String alertMsg = "";
		
		if (!service.checkExistEmail(email)) {
			alertMsg = "Tài khoản không tồn tại!";
			req.setAttribute("alert", alertMsg);
			req.getRequestDispatcher("/views/forgotpassword.jsp").forward(req, resp);
			return;
		}
		
		if (!password.equals(passwordRepeat)) {
			alertMsg = "Mật khẩu không giống nhau";
			req.setAttribute("alert", alertMsg);
			req.getRequestDispatcher("/views/forgotpassword.jsp").forward(req, resp);
			return;
		}
		
		service.resetPassword(email, passwordRepeat);
		alertMsg = "Thay đổi mật khẩu thành công!";
		req.setAttribute("alert", alertMsg);
		
		req.getRequestDispatcher("/views/forgotpassword.jsp").forward(req, resp);
	}
}
