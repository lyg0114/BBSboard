package org.zerock.controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;
import org.zerock.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Inject
	private UserService service;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(@ModelAttribute("dto") LoginDTO dto) {
		return "/user/login";
	}

	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {

		UserVO vo = service.login(dto);
		
		if (vo == null) {
			System.out.println("vo is null");
			return;
		}
		
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%");
		System.out.println("vo is : "+ vo);
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%");

		model.addAttribute("userVO", vo);

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {
		Object obj = session.getAttribute("login");

		if (obj != null) {
			UserVO vo = (UserVO) obj;

			session.removeAttribute("login");
			session.invalidate();

			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

			if (loginCookie != null) {
				System.out.println("test1#####################################");
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
			}
			System.out.println("test2#####################################");
		}
		System.out.println("test3#####################################");
		return "user/login";
	}
	

}
